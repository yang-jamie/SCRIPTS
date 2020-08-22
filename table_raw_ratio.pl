#!/usr/bin/perl -w
use strict;

# Created on 3/12/2018
# Calculate ratio of post-stress to pre-stress read counts
# ratio = 0.01 * post / pre

my $usage = 'Usage: perl table_raw_ratio.pl table_norm table_growth_RATE table_survival_ratio';
my $input = shift or die $usage;
my $growth = shift or die $usage;
my $output = shift or die $usage;

open(IN1,"<$input") || die "Unable to open $input: $!";
open(IN2,"<$growth") || die "Unable to open $growth: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my $line2="";
my $gene="";
my $gene2="";
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
my $H1_ratio=0;
my $H2_ratio=0;
my $H3_ratio=0;
my $E1_ratio=0;
my $E2_ratio=0;
my $E3_ratio=0;
my $rate;
my $rate1;
my $rate2;
my $rate3;

$line=<IN1>;
$line=<IN2>;
print OUT "gene\tH1_ratio\tH2_ratio\tH3_ratio\tE1_ratio\tE2_ratio\tE3_ratio\tavg_growth\ttest1\ttest2\ttest3\n";

while($line=<IN1>) {
  chomp $line;
  $line2=<IN2>;
  chomp $line2; 
  $gene=(split(/\t/,$line))[0];
  $gene2=(split(/\t/,$line2))[0];
  if ($gene ne $gene2) {
    die "Genes don't match: gene 1 is $gene and gene 2 is $gene2\n";
  }
  $rate=(split(/\t/,$line2))[4];
  $H1_600=(split(/\t/,$line))[19];
  $H2_600=(split(/\t/,$line))[21];
  $H3_600=(split(/\t/,$line))[23];
  $E1_600=(split(/\t/,$line))[20];
  $E2_600=(split(/\t/,$line))[22];
  $E3_600=(split(/\t/,$line))[24];
  $rate1=(split(/\t/,$line2))[1];
  $rate2=(split(/\t/,$line2))[2];
  $rate3=(split(/\t/,$line2))[3];
  $H1_post=(split(/\t/,$line))[13];
  $H2_post=(split(/\t/,$line))[14];
  $H3_post=(split(/\t/,$line))[15];
  $E1_post=(split(/\t/,$line))[16];
  $E2_post=(split(/\t/,$line))[17];
  $E3_post=(split(/\t/,$line))[18];
  if ($H1_600!=0) {
    $H1_ratio=0.01*$H1_post/$H1_600;
  }
  else {$H1_ratio="NA";}
  if ($H2_600!=0) {
    $H2_ratio=0.01*$H2_post/$H2_600;
  }
  else {$H2_ratio="NA";}
  if ($H3_600!=0) {
    $H3_ratio=0.01*$H3_post/$H3_600;
  }
  else {$H3_ratio="NA";}
  if ($E1_600!=0) {
    $E1_ratio=0.01*$E1_post/$E1_600;
  }
  else {$E1_ratio="NA";}
  if ($E2_600!=0) {
    $E2_ratio=0.01*$E2_post/$E2_600;
  }
  else {$E2_ratio="NA";}
  if ($E3_600!=0) {
    $E3_ratio=0.01*$E3_post/$E3_600;
  }
  else {$E3_ratio="NA";}
  print OUT "$gene\t$H1_ratio\t$H2_ratio\t$H3_ratio\t$E1_ratio\t$E2_ratio\t$E3_ratio\t$rate\t$rate1\t$rate2\t$rate3\n";
}

close(IN1);
close(IN2);
close(OUT);
