#!/usr/bin/perl -w
use strict;

# Filter all missing coverage genes by the parental strain

my $usage = 'Usage: compare_list_MC.pl <single_MC_FILE> <unfiltered_FILE> <OUT>';
my $input = shift or die $usage;
my $unfilt = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(UNF,"<$unfilt") || die "Unable to open $unfilt: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @unfiltered;
my $gene="";
my $flag=0;

while(<IN>) { 
  chomp; 
  push @unfiltered, $_;
} 

while($line=<UNF>) {
  chomp $line;
  $gene=(split(/\t/,$line))[1];
  $flag=0;
  foreach $_ (@unfiltered) {
    if ($_ =~ /$gene/ && $gene =~ /$_/) {
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "$line\n";
  } 
}

close(IN);
close(UNF);
close(OUT);
