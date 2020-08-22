#!/usr/bin/perl -w
use strict;

# Add pattern information from ctsGE results to PVmatrix_list file

my $usage = 'Usage: append_ctsGE_pattern.pl <PVmatrix_list> <pattern> <OUT>';
my $input = shift or die $usage;
my $pattern = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(PAT,"<$pattern") || die "Unable to open $pattern: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @array=();
my $num=0;
my $i=0;

# Read in pattern file
<PAT>;
while($line=<PAT>) {
  chomp $line;
  push @array, (split(/\t/,$line))[1];
}
close(PAT);

# Read in header
$line=<IN>;
chomp $line;
print OUT "$line\tPattern\n";

# Loop through pvmatrix_list file
while($line=<IN>) {
  chomp $line;
  $num=(split(/\t/,$line))[3];
  for ($i=1;$i<scalar(@array)+1;$i++) {
    if ($num==$i) {
      print OUT "$line\t$array[$i-1]\n";
    }
  }
} 

close(IN);
close(OUT);
