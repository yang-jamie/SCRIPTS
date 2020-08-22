#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

// Created on 2/19/2018
// Take all values in table_norm and perform log2 on them

int main(int argc,char *argv[]) {
  if (argc!=3) {
    fprintf(stderr,"Usage: %s <TABLE_NORM> <TABLE_LOG2>\n",argv[0]);
    return 1;
  }
  FILE *input=fopen(argv[1],"r");
  FILE *output=fopen(argv[2],"w");
  if (input==NULL) {
    fprintf(stderr,"Cannot open input file: %s\n",argv[1]);
    return 1;
  }
  if (output==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[2]);
    return 1;
  }

  double R1=0,R2=0,R3=0,R4=0,R5=0,R6=0,R7=0,R8=0,R9=0,R10=0,R11=0,R12=0;
  double R13=0,R14=0,R15=0,R16=0,R17=0,R18=0,R19=0,R20=0,R21=0,R22=0,R23=0,R24=0;
  char line[10000]="",gene[20]="";

// retrieve and print header
  fgets(line,10000,input);
  fprintf(output,"%s",line);

  while(fgets(line,10000,input)!=NULL) {
    sscanf(line,"%s %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf %lf",gene,&R1,&R2,&R3,&R4,&R5,&R6,&R7,&R8,&R9,&R10,&R11,&R12,&R13,&R14,&R15,&R16,&R17,&R18,&R19,&R20,&R21,&R22,&R23,&R24);
    fprintf(output,"%s\t",gene);
    if (R1!=0) {
      fprintf(output,"%f\t",log2(R1));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R2!=0) {
      fprintf(output,"%f\t",log2(R2));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R3!=0) {
      fprintf(output,"%f\t",log2(R3));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R4!=0) {
      fprintf(output,"%f\t",log2(R4));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R5!=0) {
      fprintf(output,"%f\t",log2(R5));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R6!=0) {
      fprintf(output,"%f\t",log2(R6));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R7!=0) {
      fprintf(output,"%f\t",log2(R7));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R8!=0) {
      fprintf(output,"%f\t",log2(R8));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R9!=0) {
      fprintf(output,"%f\t",log2(R9));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R10!=0) {
      fprintf(output,"%f\t",log2(R10));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R11!=0) {
      fprintf(output,"%f\t",log2(R11));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R12!=0) {
      fprintf(output,"%f\t",log2(R12));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R13!=0) {
      fprintf(output,"%f\t",log2(R13));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R14!=0) {
      fprintf(output,"%f\t",log2(R14));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R15!=0) {
      fprintf(output,"%f\t",log2(R15));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R16!=0) {
      fprintf(output,"%f\t",log2(R16));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R17!=0) {
      fprintf(output,"%f\t",log2(R17));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R18!=0) {
      fprintf(output,"%f\t",log2(R18));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R19!=0) {
      fprintf(output,"%f\t",log2(R19));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R20!=0) {
      fprintf(output,"%f\t",log2(R20));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R21!=0) {
      fprintf(output,"%f\t",log2(R21));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R22!=0) {
      fprintf(output,"%f\t",log2(R22));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R23!=0) {
      fprintf(output,"%f\t",log2(R23));
    }
    else {
      fprintf(output,"0\t");
    }
    if (R24!=0) {
      fprintf(output,"%f\n",log2(R24));
    }
    else {
      fprintf(output,"0\n");
    }
  }
  fclose(input);
  fclose(output);
}
