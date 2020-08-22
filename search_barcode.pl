#!/usr/bin/perl -w
use strict;
# Created 2/11/2018
# Search for 20-nt barcode from YKO and put barcode into separate file
# Also put lines with no barcode found into another file

my $usage = 'Usage: search_barcode.pl <fastq file> <barcode> <no barcode>';
my $input = shift or die $usage;
my $out_bar = shift or die $usage;
my $out_no = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(OUT1,">$out_bar") || die "Unable to write to $out_bar: $!";
open(OUT2,">$out_no") || die "Unable to write to $out_no: $!";

my $line="";
my $prev_line="";
my $L1="";
my $L2="";
my $indx=0;

while($line=<IN>) {
  chomp $line;
  if ($line=~/\@NS/) {
    $prev_line=$line;
    $line=<IN>;
    chomp $line;
    if ((rindex($line,"CGTAC") - index($line,"TCTCT") <= 26) && (rindex($line,"CGTAC") - index($line,"TCTCT") >= 19)) {
      $L1=substr($line,index($line,"TCTCT")+5,20);
      print OUT1 "$prev_line\n$L1\n";
      $prev_line=<IN>;
      chomp $prev_line;
      print OUT1 "$prev_line\n";
      $prev_line=<IN>;
      chomp $prev_line;
      $L2=substr($prev_line,index($line,"TCTCT")+5,20);
      print OUT1 "$L2\n";
    }
    elsif (index($line,"TCTCT") >= 19 && index($line,"TCTCT") <= 24) {
      $indx=index($line,"TCTCT");
      $L1=substr($line,$indx+5);
      print OUT2 "\@$L1\tNO_DNTAG\t$indx\n$L1\n";
      $prev_line=<IN>;
      chomp $prev_line;
      print OUT2 "$prev_line\n";
      $prev_line=<IN>;
      chomp $prev_line;
      $L2=substr($prev_line,$indx+5);
      print OUT2 "$L2\n";
    }
    elsif (rindex($line,"CGTAC") >= 43 && rindex($line,"CGTAC") <= 48) {
      $indx=rindex($line,"CGTAC");
      $L1=substr($line,0,$indx);
      print OUT2 "\@$L1\tNO_UPTAG\t$indx\n$L1\n";
      $prev_line=<IN>;
      chomp $prev_line;
      print OUT2 "$prev_line\n";
      $prev_line=<IN>;
      chomp $prev_line;
      $L2=substr($prev_line,0,$indx);
      print OUT2 "$L2\n";
    }
    else {
      print OUT2 "\@$line\tNO_TAG\n$line\n";
      $line=<IN>;
      chomp $line;
      print OUT2 "$line\n";
      $line=<IN>;
      chomp $line;
      print OUT2 "$line\n";
    }
  }
  else {
    die "Wrong line placement";
  }
}

close(IN);
close(OUT1);
close(OUT2);
