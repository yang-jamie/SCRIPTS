#!/usr/bin/perl -w
use strict;

# Created 4/30/2018
# Compare 

my $usage = 'perl prog_avg_RNA.pl <PROGRESSION> <GENE LIST>  <OUT>';
my $input = shift or die $usage;
my $gene_list = shift or die $usage;
my $output = shift or die $usage;
open(IN,"<$input") || die "Unable to open $input: $!";
open(LIST,"<$gene_list") || die "Unable to open $gene_list: $!";
open(OUT,">$output") || die "Unable to write to $output: $!";

my $line="";
my @gene_array;
my $gene="";

$line=<LIST>;
while($line=<LIST>) { 
  chomp $line;
  push @gene_array, (split(/\t/,$line))[3];
} 
close(LIST);

$line=<IN>;
chomp $line;
print OUT "$line\n";

while($line=<IN>) {
  chomp $line;
  $gene=(split(/\t/,$line))[0];
  foreach $_ (@gene_array) {
    if ($_ eq $gene) {
      print OUT "$line\n";
    }
  }
}

close(IN);
close(OUT);
