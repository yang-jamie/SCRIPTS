#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Created on 2/12/2018
// Exact match for 20-nt barcode with YKO reference barcodes

int main(int argc,char *argv[]) {
  if (argc!=6) {
    fprintf(stderr,"Usage: %s <INPUT> <REFERENCE> <OUT> <REFERENCE # LINE> <UNMATCHED>\n",argv[0]);
    return 1;
  }
  FILE *input=fopen(argv[1],"r");
  FILE *ref=fopen(argv[2],"r");
  FILE *out=fopen(argv[3],"w");
  FILE *unmatch=fopen(argv[5],"w");
  if (input==NULL) {
    fprintf(stderr,"Cannot open input file: %s\n",argv[1]);
    return 1;
  }
  if (ref==NULL) {
    fprintf(stderr,"Cannot open reference file: %s\n",argv[2]);
    return 1;
  }
  if (out==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[3]);
    return 1;
  }
  if (unmatch==NULL) {
    fprintf(stderr,"Cannot write to unmatch file: %s\n",argv[5]);
    return 1;
  }
// Define variables
  unsigned int NUMLINE=0,i=0,copy=0,flag=0;
  sscanf(argv[4],"%u",&NUMLINE);
  char line[10000]="",*gene_array=calloc(NUMLINE,20),*bar_array=calloc(NUMLINE,30),bar[30]="";

// Save reference gene and barcode to memory
  fprintf(stderr,"Starting to read reference barcodes into memory...\n");
  fgets(line,10000,ref);
  fgets(line,10000,ref);
  for (i=0;i<NUMLINE;i++) {
    fgets(line,10000,ref);
    sscanf(line,"%s %s",gene_array+20*i,bar_array+30*i);
  }
  fprintf(stderr,"Finished reading reference barcodes into memory...\n");

// Scan input files
  while(fgets(line,10000,input)!=NULL) {
    flag=0;
    sscanf(line,"%u %s",&copy,bar);
    for (i=0;i<NUMLINE;i++) {
      if (strstr(bar_array+30*i,bar)!=NULL && strstr(bar,bar_array+30*i)!=NULL) {
        fprintf(out,"%s\t%u\t%s\n",gene_array+20*i,copy,bar);
        flag=1;
        continue;
      }
    }
    if (flag==0) {
      fprintf(unmatch,"%s",line);
    }
  }
  fclose(input);
  fclose(ref);
  fclose(out);
}
