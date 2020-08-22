#!/usr/bin/perl -w
use strict;

# Created 7/17/2018
# Track how up or down each GO term in negative (bin 0) or positive (bin 1) YKO data

my $usage = 'Usage: perl track_YKO_pos_neg.pl <MASTER GO LIST> <H_avg> <> <H1> <H2> <H3> <E_avg> <E2> <E3> <OUT>';
my $list = shift or die $usage;
my $h1 = shift or die $usage;
my $h2 = shift or die $usage;
my $h3 = shift or die $usage;
my $e2 = shift or die $usage;
my $e3 = shift or die $usage;
my $h_avg = shift or die $usage;
my $e_avg = shift or die $usage;
my $out = shift or die $usage;

open(LIST,"<$list") || die "Unable to open $list: $!";
open(H1,"<$h1") || die "Unable to open $h1: $!";
open(H2,"<$h2") || die "Unable to open $h2: $!";
open(H3,"<$h3") || die "Unable to open $h3: $!";
open(E2,"<$e2") || die "Unable to open $e2: $!";
open(E3,"<$e3") || die "Unable to open $e3: $!";
open(H_AVG,"<$h_avg") || die "Unable to open $h_avg: $!";
open(E_AVG,"<$e_avg") || die "Unable to open $e_avg: $!";
open(OUT,">$out") || die "Unable to write to $out: $!";

my $line="";
my @H1_go=();
my @H1_score=();
my @H2_go=();
my @H2_score=();
my @H3_go=();
my @H3_score=();
my @E2_go=();
my @E2_score=();
my @E3_go=();
my @E3_score=();
my @H_avg_go=();
my @H_avg_score=();
my @E_avg_go=();
my @E_avg_score=();

my $i=0;
my $num1;
my $num2;
my $flag=0;

# Save H1 file into memory
<H1>;
while($line=<H1>) {
  chomp $line;
  push @H1_go, (split(/\t/,$line))[0];
  $num1=(split(/\//,(split(/\t/,$line))[1]))[0];
  $num2=(split(/\//,(split(/\t/,$line))[1]))[1];
  if ($num1 =~ /0\.000/ && $num2 !~ /0\.000/) {
    push @H1_score, $num2;
  }
  elsif ($num2 =~ /0\.000/ && $num1 !~ /0\.000/) {
    push @H1_score, -1*$num1;
  }
  else {
    die "NUM1: $num1 and NUM2: $num2 from file H1: $!\n";
  }
}

# Save H2 file into memory
<H2>;
while($line=<H2>) {
  chomp $line;
  push @H2_go, (split(/\t/,$line))[0];
  $num1=(split(/\//,(split(/\t/,$line))[1]))[0];
  $num2=(split(/\//,(split(/\t/,$line))[1]))[1];
  if ($num1 =~ /0\.000/ && $num2 !~ /0\.000/) {
    push @H2_score, $num2;
  }
  elsif ($num2 =~ /0\.000/ && $num1 !~ /0\.000/) {
    push @H2_score, -1*$num1;
  }
  else {
    die "NUM1: $num1 and NUM2: $num2 from file H2: $!\n";
  }
}

# Save H3 file into memory
<H3>;
while($line=<H3>) {
  chomp $line;
  push @H3_go, (split(/\t/,$line))[0];
  $num1=(split(/\//,(split(/\t/,$line))[1]))[0];
  $num2=(split(/\//,(split(/\t/,$line))[1]))[1];
  if ($num1 =~ /0\.000/ && $num2 !~ /0\.000/) {
    push @H3_score, $num2;
  }
  elsif ($num2 =~ /0\.000/ && $num1 !~ /0\.000/) {
    push @H3_score, -1*$num1;
  }
  else {
    die "NUM1: $num1 and NUM2: $num2 from file H3: $!\n";
  }
}

# Save E2 file into memory
<E2>;
while($line=<E2>) {
  chomp $line;
  push @E2_go, (split(/\t/,$line))[0];
  $num1=(split(/\//,(split(/\t/,$line))[1]))[0];
  $num2=(split(/\//,(split(/\t/,$line))[1]))[1];
  if ($num1 =~ /0\.000/ && $num2 !~ /0\.000/) {
    push @E2_score, $num2;
  }
  elsif ($num2 =~ /0\.000/ && $num1 !~ /0\.000/) {
    push @E2_score, -1*$num1;
  }
  else {
    die "NUM1: $num1 and NUM2: $num2 from file E2: $!\n";
  }
}

# Save E3 file into memory
<E3>;
while($line=<E3>) {
  chomp $line;
  push @E3_go, (split(/\t/,$line))[0];
  $num1=(split(/\//,(split(/\t/,$line))[1]))[0];
  $num2=(split(/\//,(split(/\t/,$line))[1]))[1];
  if ($num1 =~ /0\.000/ && $num2 !~ /0\.000/) {
    push @E3_score, $num2;
  }
  elsif ($num2 =~ /0\.000/ && $num1 !~ /0\.000/) {
    push @E3_score, -1*$num1;
  }
  else {
    die "NUM1: $num1 and NUM2: $num2 from file E3: $!\n";
  }
}

# Save H_avg file into memory
<H_AVG>;
while($line=<H_AVG>) {
  chomp $line;
  push @H_avg_go, (split(/\t/,$line))[0];
  $num1=(split(/\//,(split(/\t/,$line))[1]))[0];
  $num2=(split(/\//,(split(/\t/,$line))[1]))[1];
  if ($num1 =~ /0\.000/ && $num2 !~ /0\.000/) {
    push @H_avg_score, $num2;
  }
  elsif ($num2 =~ /0\.000/ && $num1 !~ /0\.000/) {
    push @H_avg_score, -1*$num1;
  }
  else {
    die "NUM1: $num1 and NUM2: $num2 from file H_AVG: $!\n";
  }
}

# Save E_avg file into memory
<E_AVG>;
while($line=<E_AVG>) {
  chomp $line;
  push @E_avg_go, (split(/\t/,$line))[0];
  $num1=(split(/\//,(split(/\t/,$line))[1]))[0];
  $num2=(split(/\//,(split(/\t/,$line))[1]))[1];
  if ($num1 =~ /0\.00/ && $num2 !~ /0\.00/) {		# changed because -0.001
    push @E_avg_score, $num2;
  }
  elsif ($num2 =~ /0\.00/ && $num1 !~ /0\.00/) {	# changed because -0.001
    push @E_avg_score, -1*$num1;
  }
  else {
    die "NUM1: $num1 and NUM2: $num2 from file E_AVG: $!\n";
  }
}

close(H1);
close(H2);
close(H3);
close(E2);
close(E3);
close(H_AVG);
close(E_AVG);

# Loop through each of the files
print OUT "GO\tH_avg\tH1\tH2\tH3\tE_avg\tE2\tE3\n";

while ($line=<LIST>) {
  chomp $line;
  print OUT "$line\t";

  $flag=0;
  for ($i=0;$i<scalar(@H_avg_go);$i++) {
    if ($H_avg_go[$i] eq $line) {
      print OUT "$H_avg_score[$i]\t";
      splice(@H_avg_go,$i,1);
      splice(@H_avg_score,$i,1);
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "0\t";
  }

  $flag=0;
  for ($i=0;$i<scalar(@H1_go);$i++) {
    if ($H1_go[$i] eq $line) {
      print OUT "$H1_score[$i]\t";
      splice(@H1_go,$i,1);
      splice(@H1_score,$i,1);
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "0\t";
  }

  $flag=0;
  for ($i=0;$i<scalar(@H2_go);$i++) {
    if ($H2_go[$i] eq $line) {
      print OUT "$H2_score[$i]\t";
      splice(@H2_go,$i,1);
      splice(@H2_score,$i,1);
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "0\t";
  }

  $flag=0;
  for ($i=0;$i<scalar(@H3_go);$i++) {
    if ($H3_go[$i] eq $line) {
      print OUT "$H3_score[$i]\t";
      splice(@H3_go,$i,1);
      splice(@H3_score,$i,1);
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "0\t";
  }

  $flag=0;
  for ($i=0;$i<scalar(@E_avg_go);$i++) {
    if ($E_avg_go[$i] eq $line) {
      print OUT "$E_avg_score[$i]\t";
      splice(@E_avg_go,$i,1);
      splice(@E_avg_score,$i,1);
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "0\t";
  }

  $flag=0;
  for ($i=0;$i<scalar(@E2_go);$i++) {
    if ($E2_go[$i] eq $line) {
      print OUT "$E2_score[$i]\t";
      splice(@E2_go,$i,1);
      splice(@E2_score,$i,1);
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "0\t";
  }

  $flag=0;
  for ($i=0;$i<scalar(@E3_go);$i++) {
    if ($E3_go[$i] eq $line) {
      print OUT "$E3_score[$i]\n";
      splice(@E3_go,$i,1);
      splice(@E3_score,$i,1);
      $flag=1;
    }
  }
  if ($flag==0) {
    print OUT "0\n";
  }
}

close(LIST);
close(OUT);
