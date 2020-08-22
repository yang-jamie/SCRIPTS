#!/usr/bin/perl -w
use strict;

# Append list of genes to each significant GO term

my $usage = 'Usage: append_gene_to_GO.pl <WT_kall_ALL_time_*_UP_PLOT> <master_GO_WT_*> <OUT>';
my $input = shift or die $usage;
my $pattern = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(PAT,"<$pattern") || die "Unable to open $pattern: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @array_file=();
my @array_GO=();
my @array_num=();
my @array_genes=();
my @array_temp=();
my $GO="";
my $file="";
my $num=0;
my $i=0;
my $flag=0;
my $scal="";

# Read in master_GO file
while($line=<PAT>) {
  @array_temp=();
  chomp $line;
  push @array_file, (split(/\t/,$line))[0];
  push @array_GO, (split(/\t/,$line))[1];
  push @array_num, (split(/\t/,$line))[2];
  push @array_temp, split(/\t/,$line);
  shift @array_temp;
  shift @array_temp;
  shift @array_temp;
  $scal=join(",",@array_temp);
  push @array_genes, $scal;
}
close(PAT);

# Read in header
$line=<IN>;
chomp $line;
print OUT "$line\tGenes\n";

# Loop through master_GO file
while($line=<IN>) {
  chomp $line;
  $GO=(split(/\t/,$line))[0];
  $file=(split(/\t/,$line))[4];
  $num=(split(/\t/,$line))[3];
  $flag=0;
  for ($i=0;$i<scalar(@array_file);$i++) {
    if ($file eq $array_file[$i] && $GO eq $array_GO[$i] && $num==$array_num[$i]) {
      $flag=1;
      print OUT "$line\t$array_genes[$i]\n";
    }
  }
  if ($flag==0) {
    die "No match!";
  }
} 

close(IN);
close(OUT);
