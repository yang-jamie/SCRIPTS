#!/usr/bin/perl -w
use strict;
# Created 2/17/2018
# Remove from out.no-reverse all entries that contain out.dup

my $usage = 'Usage: remove_mult_match_YKO.pl <out.no-reverse> <out.dup> <out.single>';
my $input = shift or die $usage;
my $duplicate = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(DUP,"<$duplicate") || die "Unable to open $duplicate: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @array;
my $id="";
my $flag=0;

while($line=<DUP>) {
  chomp $line;
  push(@array,$line);
}

while($line=<IN>) {
  chomp $line;
  $id=(split(/\t/,$line))[0];
  $flag=0;
  foreach $a (@array) {
    if ($id eq $a) {
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "$line\n";
  }
}

close(IN);
close(DUP);
close(OUT);
