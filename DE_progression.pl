#!/usr/bin/perl -w
use strict;

# Created on 8/24/2018
# determine differential expression between WT and evolved strain

my $usage = 'Usage: DE.pl <WT_FILE> <EVOLVED_FILE> <OUT>';
my $wildtype = shift or die $usage;
my $evolved = shift or die $usage;
my $output = shift or die $usage;
open(WT,"<$wildtype") || die "Unable to open $wildtype: $!";
open(EV,"<$evolved") || die "Unable to open $evolved: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my $line_ev="";
my $chr="";
my $type="";
my $id="";
my $start=0;
my $end=0;
my $len=0;
my $strand="";
my $rpkm_wt=0;
my $rpkm_ev=0;
my $de=0;

print OUT "Chrom\tType\tID\tStart\tEnd\tLength\tStrand\tDE\n";
$line=<WT>;	# remove header
$line=<EV>;	# remove header

while($line=<WT>) {
  chomp $line;
  $chr=(split(/\t/,$line))[0];
  $type=(split(/\t/,$line))[1];
  $id=(split(/\t/,$line))[2];
  $start=(split(/\t/,$line))[3];
  $end=(split(/\t/,$line))[4];
  $len=(split(/\t/,$line))[5];
  $strand=(split(/\t/,$line))[6];
  $rpkm_wt=(split(/\t/,$line))[7];
  $line_ev=<EV>;
  chomp $line_ev;
  $rpkm_ev=(split(/\t/,$line_ev))[7];
  if ($rpkm_ev!=0 && $rpkm_wt!=0) {
    $de=log(($rpkm_ev)/($rpkm_wt))/log(2);
  }
  elsif ($rpkm_ev==0 && $rpkm_wt==0) {
    $de="NA";
  }
  elsif ($rpkm_ev==0 && $rpkm_wt!=0) {
    $de="-Inf";
  }
  elsif ($rpkm_ev!=0 && $rpkm_wt==0) {
    $de="Inf";
  }
  else {
    die "What happened to the rpkm: EV: $rpkm_ev WT: $rpkm_wt\n";
  }
  print OUT "$chr\t$type\t$id\t$start\t$end\t$len\t$strand\t$de\n";
}

close(WT);
close(EV);
close(OUT);
