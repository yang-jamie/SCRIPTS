#!/usr/bin/perl -w
use strict;

# Created on 2/20/2018
# Determine difference between 600 and post-stress strains

my $usage = 'Usage: perl table_600vpost.pl <TABLE_LOG2> <TABLE_600VPOST>\n';
my $input = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my $gene="";
my $H1_600=0;
my $H2_600=0;
my $H3_600=0;
my $E1_600=0;
my $E2_600=0;
my $E3_600=0;
my $H1_post=0;
my $H2_post=0;
my $H3_post=0;
my $E1_post=0;
my $E2_post=0;
my $E3_post=0;
my $H1_diff=0;
my $H2_diff=0;
my $H3_diff=0;
my $E1_diff=0;
my $E2_diff=0;
my $E3_diff=0;

$line=<IN>;
print OUT "Gene\tH1\tH2\tH3\tE1\tE2\tE3\n";

while($line=<IN>) {
  chomp $line;
  $gene=(split(/\t/,$line))[0];
  $H1_600=(split(/\t/,$line))[19];
  $H2_600=(split(/\t/,$line))[21];
  $H3_600=(split(/\t/,$line))[23];
  $E1_600=(split(/\t/,$line))[20];
  $E2_600=(split(/\t/,$line))[22];
  $E3_600=(split(/\t/,$line))[24];
  $H1_post=(split(/\t/,$line))[13];
  $H2_post=(split(/\t/,$line))[14];
  $H3_post=(split(/\t/,$line))[15];
  $E1_post=(split(/\t/,$line))[16];
  $E2_post=(split(/\t/,$line))[17];
  $E3_post=(split(/\t/,$line))[18];
  $H1_diff=$H1_post-$H1_600;
  $H2_diff=$H2_post-$H2_600;
  $H3_diff=$H3_post-$H3_600;
  $E1_diff=$E1_post-$E1_600;
  $E2_diff=$E2_post-$E2_600;
  $E3_diff=$E3_post-$E3_600;
  print OUT "$gene\t$H1_diff\t$H2_diff\t$H3_diff\t$E1_diff\t$E2_diff\t$E3_diff\n";
}

close(IN);
close(OUT);
