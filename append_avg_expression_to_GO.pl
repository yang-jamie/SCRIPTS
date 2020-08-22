#!/usr/bin/perl -w
use strict;

# Add to gene list file the average expression over all time points

my $usage = 'Usage: append_avg_expression_to_GO.pl <WT_kall_ALL_time_*_UP_genes> <WT_kall_progression_log_norm> <OUT>';
my $input = shift or die $usage;
my $pattern = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(PAT,"<$pattern") || die "Unable to open $pattern: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @array_gene=();
my @array_growth=();
my @array_15=();
my @array_30=();
my @array_60=();
my @gene_list=();
my $genes="";
my $i=0;
my $j=0;
my $tot_pre=0;
my $tot_15=0;
my $tot_30=0;
my $tot_60=0;
my $count=0;
my $final_pre=0;
my $final_15=0;
my $final_30=0;
my $final_60=0;

# Read in master_GO file
<PAT>;
while($line=<PAT>) {
  chomp $line;
  push @array_gene, (split(/\t/,$line))[0];
  push @array_growth, (split(/\t/,$line))[1];
  push @array_15, (split(/\t/,$line))[3];
  push @array_30, (split(/\t/,$line))[4];
  push @array_60, (split(/\t/,$line))[5];
}
close(PAT);

# Read in header
$line=<IN>;
chomp $line;
print OUT "$line\tPre\t15\t30\t60\n";

# Loop through master_GO file
while($line=<IN>) {
  chomp $line;
  $genes=(split(/\t/,$line))[5];
  @gene_list=split(',',$genes);
  $tot_pre=0;
  $tot_15=0;
  $tot_30=0;
  $tot_60=0;
  $count=0;
  for ($i=0;$i<scalar(@gene_list);$i++) {
    for ($j=0;$j<scalar(@array_gene);$j++) {
      if ($gene_list[$i] eq $array_gene[$j]) {
        $tot_pre+=$array_growth[$j];
        $tot_15+=$array_15[$j];
        $tot_30+=$array_30[$j];
        $tot_60+=$array_60[$j];
        $count++;
      }
    }
  }
  if ($count==0) {
    die "Uh oh!\n";
  }
  else {
    $final_pre=$tot_pre/$count;
    $final_15=$tot_15/$count;
    $final_30=$tot_30/$count;
    $final_60=$tot_60/$count;
    print OUT "$line\t$final_pre\t$final_15\t$final_30\t$final_60\n";
  }
}

close(IN);
close(OUT);
