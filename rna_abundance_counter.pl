#!/usr/bin/perl -w
use strict;

# Created on 3/29/2018
# count RNA-seq abundance for each annotated element

my $usage = 'Usage: rna_abundance_counter.pl <REF> <INPUT> <OUT> <DUP> <NONE>';
my $reference = shift or die $usage;
my $input = shift or die $usage;
my $output = shift or die $usage;
my $duplicate = shift or die $usage;
my $no_match = shift or die $usage;
open(REF,"<$reference") || die "Unable to open $reference: $!";
open(IN,"<$input") || die "Unable to open $input: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";
open(DUP,">$duplicate") || die "Unable to write to $duplicate: $!";
open(NONE,">$no_match") || die "Unable to write to $no_match: $!";

my $line="";
my $wc="";
my $chr="";
my $start=0;
my $end=0;
my @ref_chr;
my @ref_type;
my @ref_start;
my @ref_end;
my @ref_wc;
my @count;
my @count_anti;
my @ref_len;
my @ref_ID;
my $i=0;
my $temp="";
my $flag=0;
my $ID="";
my @array;

# Read in reference data
while($line=<REF>) {
  chomp $line;
  push @ref_chr, (split(/\t/,$line))[0];
  push @ref_type, (split(/\t/,$line))[2];
  push @ref_start, (split(/\t/,$line))[3];
  push @ref_end, (split(/\t/,$line))[4];
  push @ref_len, (split(/\t/,$line))[4]-(split(/\t/,$line))[3]+1;
  push @ref_wc, (split(/\t/,$line))[6];
  $temp=(split(/Name=/,$line))[1];
  push @ref_ID, (split(/;/,$temp))[0];
  push @count, 0;
  push @count_anti, 0;
}
close(REF);

while($line=<IN>) {
  chomp $line;
  $ID=(split(/\t/,$line))[0];
  $wc=(split(/\t/,$line))[1];
  $chr=(split(/\t/,$line))[2];
  $start=(split(/\t/,$line))[3];
  $end=(split(/\t/,$line))[3]+length((split(/\t/,$line))[9])-1;
  $flag=0;
  @array=();
  for ($i=0;$i<@ref_chr;$i++) {
    if ($ref_chr[$i] eq $chr) {
      if (($start<=$ref_start[$i] && $end>=$ref_start[$i]) || ($start<=$ref_end[$i] && $end>=$ref_end[$i]) || ($start>=$ref_start[$i] && $end<=$ref_end[$i])) {
        if ($ref_wc[$i] =~ /\+/ || $ref_wc[$i] =~ /\./) {
          if ($wc==16) {
            $count[$i]++;
          }
          elsif ($wc==0) {
            $count_anti[$i]++;
          }
          else {die "Unrecognized wc: $wc\n";}
        }
        elsif ($ref_wc[$i] =~ /-/) {
          if ($wc==16) {
            $count_anti[$i]++;
          }
          elsif ($wc==0) {
            $count[$i]++;
          }
          else {die "Unrecognized wc: $wc\n";}
        }
        else {die "Unrecognized ref_wc: $ref_wc[$i]\n";}
        $flag++;
        push @array, $ref_ID[$i];
      }
    }
  }
  if ($flag==0) {
    print NONE "$line\n";
  }
  if ($flag>1) {
    print DUP "$ID\t@array\n";
  }
}
close(REF);

print OUT "Chrom\tType\tID\tStart\tEnd\tLength\tStrand\tCount\tCount_anti\n";
for ($i=0;$i<@ref_chr;$i++) {
  print OUT "$ref_chr[$i]\t$ref_type[$i]\t$ref_ID[$i]\t$ref_start[$i]\t$ref_end[$i]\t$ref_len[$i]\t$ref_wc[$i]\t$count[$i]\t$count_anti[$i]\n";
}
close(OUT);
close(DUP);
close(NONE);
