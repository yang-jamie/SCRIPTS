#!/usr/bin/perl -w
use strict;

# Convert pvmatrix results of iPAGE to a list of significant terms

my $usage = 'Usage: pvmatrix_to_list.pl <PVMATRIX> <cutoff> <OUT>';
my $input = shift or die $usage;
my $cutoff = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @array=();
my $first;
my $second;
my $i=0;

# Read in header
$line=<IN>;
chomp $line;
my @header = split(/\t/,$line);

# Print header
print OUT "GO\tValue\tUP/DN\tNum\n";

while($line=<IN>) {
  chomp $line;
  @array = split(/\t/,$line);
  for ($i=1;$i<scalar(@array);$i++) {
    $first=(split(/\//,$array[$i]))[0];
    $second=(split(/\//,$array[$i]))[1];
    if ($first =~ /0\.000/ && $second <= $cutoff) {
      print OUT "$array[0]\t$second\tDN\t$header[$i]\n";
    }
    elsif ($second =~ /0\.000/ && $first <= $cutoff) {
      print OUT "$array[0]\t$first\tUP\t$header[$i]\n";
    }
  }
} 

close(IN);
close(OUT);
