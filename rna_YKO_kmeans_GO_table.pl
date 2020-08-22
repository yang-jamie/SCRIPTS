#!/usr/bin/perl -w
#use strict;

# Create table of RNA-seq WT and YKO GO terms
# Created 8/8/2018

my $usage = 'Usage: rna_YKO_all_GO_table.pl <FILE LIST> <# FILES> <GO TERMS> <OUT>';
my $input = shift or die $usage;
my $num_file = shift or die $usage;
my $go_term = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(GO,"<$go_term") || die "Unable to open $go_term: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my @name_array=();
my @file_array=();
my @GO_array=();
my $i=0;
my $line="";
my $line2="";
my $temp_name="";
my $temp_file="";
my $temp_array="";
my $flag=0;
my $go_go="";

print OUT "GO";	# start printing header

while($line=<IN>) {
  chomp $line;
  $temp_name=(split(/\t/,$line))[0];
  push @name_array, $temp_name;
  print OUT "\t$temp_name";	# continue printing header
  $temp_file=(split(/\t/,$line))[1];
  push @file_array, $temp_file;
  push @GO_array, (split(/\t/,$line))[2];
}

open(A1,"<$file_array[0]") || die "Unable to open $file_array[0]: $!";
open(A2,"<$file_array[1]") || die "Unable to open $file_array[1]: $!";
open(A3,"<$file_array[2]") || die "Unable to open $file_array[2]: $!";
open(A4,"<$file_array[3]") || die "Unable to open $file_array[3]: $!";
open(A5,"<$file_array[4]") || die "Unable to open $file_array[4]: $!";
open(A6,"<$file_array[5]") || die "Unable to open $file_array[5]: $!";
open(A7,"<$file_array[6]") || die "Unable to open $file_array[6]: $!";
open(A8,"<$file_array[7]") || die "Unable to open $file_array[7]: $!";
open(A9,"<$file_array[8]") || die "Unable to open $file_array[8]: $!";

close(IN);
print OUT "\n";	# end printing header

<GO>;	# Skip header

while($line=<GO>) {
  chomp $line;
  print OUT "$line";

  seek A1, 0, 0;
  while($line2=<A1>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A2, 0, 0;
  while($line2=<A2>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A3, 0, 0;
  while($line2=<A3>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A4, 0, 0;
  while($line2=<A4>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A5, 0, 0;
  while($line2=<A5>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A6, 0, 0;
  while($line2=<A6>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A7, 0, 0;
  while($line2=<A7>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A8, 0, 0;
  while($line2=<A8>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  seek A9, 0, 0;
  while($line2=<A9>) {
    chomp $line2;
    $go_go=(split(/\s/,$line2))[0];
    if ($line eq $go_go) {
      $flag=1;
      print OUT "\tY";
    }
  }
  if ($flag==0) {
    print OUT "\tN";
  }
  $flag=0;

  print OUT "\n";
} 

close(GO);
close(OUT);
