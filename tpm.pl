#!/usr/bin/perl -w
use strict;

# Created on 4/27/2018
# count RNA-seq abundance for each annotated element and determine TPM

my $usage = 'Usage: tpm.pl <OUT.MATCHED> <OUT.TPM>';
my $input = shift or die $usage;
my $output = shift or die $usage;
open(IN1,"<$input") || die "Unable to open $input: $!";
open(IN2,"<$input") || die "Unable to open $input: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my $chr="";
my $type="";
my $id="";
my $start=0;
my $end=0;
my $len=0;
my $strand="";
my $count;
my $count_anti=0;
my $tpm=0;
my $tot=0;

print OUT "Chrom\tType\tID\tStart\tEnd\tLength\tStrand\tTPM\n";
$line=<IN1>;	# remove header
$line=<IN2>;	# remove header

while($line=<IN1>) {
  $len=(split(/\t/,$line))[5];
  $strand=(split(/\t/,$line))[6];
  $count=(split(/\t/,$line))[7];
  $count_anti=(split(/\t/,$line))[8];
  if ($strand =~ /\+/ || $strand =~ /-/) {
    $tot+=$count/$len*1000;
  }
  elsif ($strand =~ /\./) {
    $tot+=($count+$count_anti)/$len*1000;
  }
  else {die "Wrong strand information: $strand\n";}
}

while($line=<IN2>) {
  chomp $line;
  $chr=(split(/\t/,$line))[0];
  $type=(split(/\t/,$line))[1];
  $id=(split(/\t/,$line))[2];
  $start=(split(/\t/,$line))[3];
  $end=(split(/\t/,$line))[4];
  $len=(split(/\t/,$line))[5];
  $strand=(split(/\t/,$line))[6];
  $count=(split(/\t/,$line))[7];
  $count_anti=(split(/\t/,$line))[8];
  if ($strand =~ /\+/ || $strand =~ /-/) {
    $tpm=$count/$len*1000000000/$tot;
  }
  elsif ($strand =~ /\./) {
    $tpm=($count+$count_anti)/$len*1000000000/$tot;
  }
  else {die "Wrong strand information: $strand\n";}
  print OUT "$chr\t$type\t$id\t$start\t$end\t$len\t$strand\t$tpm\n";
}

close(IN1);
close(IN2);
close(OUT);
