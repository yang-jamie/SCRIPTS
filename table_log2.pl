#!/usr/bin/perl -w
use strict;

# Created on 2/19/2018
# Take all values in table_norm and perform log2 on them

my $usage = 'Usage: perl table_log2.pl <TABLE_NORM> <TABLE_LOG2>\n';
my $input = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @array;
my $var=0;

$line=<IN>;
chomp $line;
print OUT "$line\n";

while($line=<IN>) {
  chomp $line;
  @array=split(/\t/,$line);
  foreach $_ (@array) {
    if ($_ =~ /Y/) {
      print OUT "$array[0]";
    }
    elsif ($_ == 0) {
      print OUT "\t0";
    }
    else {
      $var=log($_)/log(2);
      print OUT "\t$var";
    }
  }
  print OUT "\n";
}

close(IN);
close(OUT);
