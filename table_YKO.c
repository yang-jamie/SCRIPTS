#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Created on 2/18/2018
// Put all 24 YKO normalized reads into a table

int main(int argc,char *argv[]) {
  if (argc!=51) {
    fprintf(stderr,"Usage: %s <INPUT> <OUTPUT> <S1> <wc> <S2> <wc> ...\n",argv[0]);
    return 1;
  }
  FILE *input=fopen(argv[1],"r");
  FILE *output=fopen(argv[2],"w");
  FILE *S1=fopen(argv[3],"r");
  FILE *S2=fopen(argv[5],"r");
  FILE *S3=fopen(argv[7],"r");
  FILE *S4=fopen(argv[9],"r");
  FILE *S5=fopen(argv[11],"r");
  FILE *S6=fopen(argv[13],"r");
  FILE *S7=fopen(argv[15],"r");
  FILE *S8=fopen(argv[17],"r");
  FILE *S9=fopen(argv[19],"r");
  FILE *S10=fopen(argv[21],"r");
  FILE *S11=fopen(argv[23],"r");
  FILE *S12=fopen(argv[25],"r");
  FILE *S13=fopen(argv[27],"r");
  FILE *S14=fopen(argv[29],"r");
  FILE *S15=fopen(argv[31],"r");
  FILE *S16=fopen(argv[33],"r");
  FILE *S17=fopen(argv[35],"r");
  FILE *S18=fopen(argv[37],"r");
  FILE *S19=fopen(argv[39],"r");
  FILE *S20=fopen(argv[41],"r");
  FILE *S21=fopen(argv[43],"r");
  FILE *S22=fopen(argv[45],"r");
  FILE *S23=fopen(argv[47],"r");
  FILE *S24=fopen(argv[49],"r");
  if (input==NULL) {
    fprintf(stderr,"Cannot open input file: %s\n",argv[1]);
    return 1;
  }
  if (output==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[2]);
    return 1;
  }
  if (S1==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[3]);
    return 1;
  }
  if (S2==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[5]);
    return 1;
  }
  if (S3==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[7]);
    return 1;
  }
  if (S4==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[9]);
    return 1;
  }
  if (S5==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[11]);
    return 1;
  }
  if (S6==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[13]);
    return 1;
  }
  if (S7==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[15]);
    return 1;
  }
  if (S8==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[17]);
    return 1;
  }
  if (S9==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[19]);
    return 1;
  }
  if (S10==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[21]);
    return 1;
  }
  if (S11==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[23]);
    return 1;
  }
  if (S12==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[25]);
    return 1;
  }
  if (S13==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[27]);
    return 1;
  }
  if (S14==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[29]);
    return 1;
  }
  if (S15==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[31]);
    return 1;
  }
  if (S16==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[33]);
    return 1;
  }
  if (S17==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[35]);
    return 1;
  }
  if (S18==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[37]);
    return 1;
  }
  if (S19==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[39]);
    return 1;
  }
  if (S20==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[41]);
    return 1;
  }
  if (S21==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[43]);
    return 1;
  }
  if (S22==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[45]);
    return 1;
  }
  if (S23==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[47]);
    return 1;
  }
  if (S24==NULL) {
    fprintf(stderr,"Cannot open S1 file: %s\n",argv[49]);
    return 1;
  }

// Define variables
  unsigned int N1=0,N2=0,N3=0,N4=0,N5=0,N6=0,N7=0,N8=0,N9=0,N10=0,N11=0,N12=0;
  unsigned int N13=0,N14=0,N15=0,N16=0,N17=0,N18=0,N19=0,N20=0,N21=0,N22=0,N23=0,N24=0;
  unsigned int f1=0,f2=0,f3=0,f4=0,f5=0,f6=0,f7=0,f8=0,f9=0,f10=0,f11=0,f12=0,i=0,flag=0;
  unsigned int f13=0,f14=0,f15=0,f16=0,f17=0,f18=0,f19=0,f20=0,f21=0,f22=0,f23=0,f24=0;
  char line[10000]="",gene[20]="";
  sscanf(argv[4],"%u",&N1);
  sscanf(argv[6],"%u",&N2);
  sscanf(argv[8],"%u",&N3);
  sscanf(argv[10],"%u",&N4);
  sscanf(argv[12],"%u",&N5);
  sscanf(argv[14],"%u",&N6);
  sscanf(argv[16],"%u",&N7);
  sscanf(argv[18],"%u",&N8);
  sscanf(argv[20],"%u",&N9);
  sscanf(argv[22],"%u",&N10);
  sscanf(argv[24],"%u",&N11);
  sscanf(argv[26],"%u",&N12);
  sscanf(argv[28],"%u",&N13);
  sscanf(argv[30],"%u",&N14);
  sscanf(argv[32],"%u",&N15);
  sscanf(argv[34],"%u",&N16);
  sscanf(argv[36],"%u",&N17);
  sscanf(argv[38],"%u",&N18);
  sscanf(argv[40],"%u",&N19);
  sscanf(argv[42],"%u",&N20);
  sscanf(argv[44],"%u",&N21);
  sscanf(argv[46],"%u",&N22);
  sscanf(argv[48],"%u",&N23);
  sscanf(argv[50],"%u",&N24);
  char *G1=calloc(N1,20);
  char *G2=calloc(N2,20);
  char *G3=calloc(N3,20);
  char *G4=calloc(N4,20);
  char *G5=calloc(N5,20);
  char *G6=calloc(N6,20);
  char *G7=calloc(N7,20);
  char *G8=calloc(N8,20);
  char *G9=calloc(N9,20);
  char *G10=calloc(N10,20);
  char *G11=calloc(N11,20);
  char *G12=calloc(N12,20);
  char *G13=calloc(N13,20);
  char *G14=calloc(N14,20);
  char *G15=calloc(N15,20);
  char *G16=calloc(N16,20);
  char *G17=calloc(N17,20);
  char *G18=calloc(N18,20);
  char *G19=calloc(N19,20);
  char *G20=calloc(N20,20);
  char *G21=calloc(N21,20);
  char *G22=calloc(N22,20);
  char *G23=calloc(N23,20);
  char *G24=calloc(N24,20);
  double *R1=calloc(N1,sizeof(double));
  double *R2=calloc(N2,sizeof(double));
  double *R3=calloc(N3,sizeof(double));
  double *R4=calloc(N4,sizeof(double));
  double *R5=calloc(N5,sizeof(double));
  double *R6=calloc(N6,sizeof(double));
  double *R7=calloc(N7,sizeof(double));
  double *R8=calloc(N8,sizeof(double));
  double *R9=calloc(N9,sizeof(double));
  double *R10=calloc(N10,sizeof(double));
  double *R11=calloc(N11,sizeof(double));
  double *R12=calloc(N12,sizeof(double));
  double *R13=calloc(N13,sizeof(double));
  double *R14=calloc(N14,sizeof(double));
  double *R15=calloc(N15,sizeof(double));
  double *R16=calloc(N16,sizeof(double));
  double *R17=calloc(N17,sizeof(double));
  double *R18=calloc(N18,sizeof(double));
  double *R19=calloc(N19,sizeof(double));
  double *R20=calloc(N20,sizeof(double));
  double *R21=calloc(N21,sizeof(double));
  double *R22=calloc(N22,sizeof(double));
  double *R23=calloc(N23,sizeof(double));
  double *R24=calloc(N24,sizeof(double));

// Save all inputs to memory
  fprintf(stderr,"Starting to read input files into memory...\n");
  for (i=0;i<N1;i++) {
    fgets(line,10000,S1);
    sscanf(line,"%lf %s",&R1[i],G1+20*i);
  }
  for (i=0;i<N2;i++) {
    fgets(line,20000,S2);
    sscanf(line,"%lf %s",&R2[i],G2+20*i);
  }
  for (i=0;i<N3;i++) {
    fgets(line,30000,S3);
    sscanf(line,"%lf %s",&R3[i],G3+20*i);
  }
  for (i=0;i<N4;i++) {
    fgets(line,40000,S4);
    sscanf(line,"%lf %s",&R4[i],G4+20*i);
  }
  for (i=0;i<N5;i++) {
    fgets(line,50000,S5);
    sscanf(line,"%lf %s",&R5[i],G5+20*i);
  }
  for (i=0;i<N6;i++) {
    fgets(line,60000,S6);
    sscanf(line,"%lf %s",&R6[i],G6+20*i);
  }
  for (i=0;i<N7;i++) {
    fgets(line,70000,S7);
    sscanf(line,"%lf %s",&R7[i],G7+20*i);
  }
  for (i=0;i<N8;i++) {
    fgets(line,80000,S8);
    sscanf(line,"%lf %s",&R8[i],G8+20*i);
  }
  for (i=0;i<N9;i++) {
    fgets(line,90000,S9);
    sscanf(line,"%lf %s",&R9[i],G9+20*i);
  }
  for (i=0;i<N10;i++) {
    fgets(line,100000,S10);
    sscanf(line,"%lf %s",&R10[i],G10+20*i);
  }
  for (i=0;i<N11;i++) {
    fgets(line,110000,S11);
    sscanf(line,"%lf %s",&R11[i],G11+20*i);
  }
  for (i=0;i<N12;i++) {
    fgets(line,120000,S12);
    sscanf(line,"%lf %s",&R12[i],G12+20*i);
  }
  for (i=0;i<N13;i++) {
    fgets(line,130000,S13);
    sscanf(line,"%lf %s",&R13[i],G13+20*i);
  }
  for (i=0;i<N14;i++) {
    fgets(line,140000,S14);
    sscanf(line,"%lf %s",&R14[i],G14+20*i);
  }
  for (i=0;i<N15;i++) {
    fgets(line,150000,S15);
    sscanf(line,"%lf %s",&R15[i],G15+20*i);
  }
  for (i=0;i<N16;i++) {
    fgets(line,160000,S16);
    sscanf(line,"%lf %s",&R16[i],G16+20*i);
  }
  for (i=0;i<N17;i++) {
    fgets(line,170000,S17);
    sscanf(line,"%lf %s",&R17[i],G17+20*i);
  }
  for (i=0;i<N18;i++) {
    fgets(line,180000,S18);
    sscanf(line,"%lf %s",&R18[i],G18+20*i);
  }
  for (i=0;i<N19;i++) {
    fgets(line,190000,S19);
    sscanf(line,"%lf %s",&R19[i],G19+20*i);
  }
  for (i=0;i<N20;i++) {
    fgets(line,200000,S20);
    sscanf(line,"%lf %s",&R20[i],G20+20*i);
  }
  for (i=0;i<N21;i++) {
    fgets(line,210000,S21);
    sscanf(line,"%lf %s",&R21[i],G21+20*i);
  }
  for (i=0;i<N22;i++) {
    fgets(line,220000,S22);
    sscanf(line,"%lf %s",&R22[i],G22+20*i);
  }
  for (i=0;i<N23;i++) {
    fgets(line,230000,S23);
    sscanf(line,"%lf %s",&R23[i],G23+20*i);
  }
  for (i=0;i<N24;i++) {
    fgets(line,240000,S24);
    sscanf(line,"%lf %s",&R24[i],G24+20*i);
  }
  fprintf(stderr,"Finished reading input files into memory...\n");

// Printer header line
  fprintf(output,"Gene\tS1\tS2\tS3\tS4\tS5\tS6\tS7\tS8\tS9\tS10\tS11\tS12\t");
  fprintf(output,"S13\tS14\tS15\tS16\tS17\tS18\tS19\tS20\tS21\tS22\tS23\tS24\n");

// Scan input file
  while(fgets(line,10000,input)!=NULL) {
    sscanf(line,"%s",gene);
    fprintf(output,"%s\t",gene);
    flag=0;
    for (i=f1;i<N1;i++) {
      if (strstr(gene,G1+20*i)!=NULL && strstr(G1+20*i,gene)!=NULL) {
        f1=i+1;
        flag=1;
        fprintf(output,"%f\t",R1[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f2;i<N2;i++) {
      if (strstr(gene,G2+20*i)!=NULL && strstr(G2+20*i,gene)!=NULL) {
        f2=i+1;
        flag=1;
        fprintf(output,"%f\t",R2[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f3;i<N3;i++) {
      if (strstr(gene,G3+20*i)!=NULL && strstr(G3+20*i,gene)!=NULL) {
        f3=i+1;
        flag=1;
        fprintf(output,"%f\t",R3[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f4;i<N4;i++) {
      if (strstr(gene,G4+20*i)!=NULL && strstr(G4+20*i,gene)!=NULL) {
        f4=i+1;
        flag=1;
        fprintf(output,"%f\t",R4[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f5;i<N5;i++) {
      if (strstr(gene,G5+20*i)!=NULL && strstr(G5+20*i,gene)!=NULL) {
        f5=i+1;
        flag=1;
        fprintf(output,"%f\t",R5[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f6;i<N6;i++) {
      if (strstr(gene,G6+20*i)!=NULL && strstr(G6+20*i,gene)!=NULL) {
        f6=i+1;
        flag=1;
        fprintf(output,"%f\t",R6[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f7;i<N7;i++) {
      if (strstr(gene,G7+20*i)!=NULL && strstr(G7+20*i,gene)!=NULL) {
        f7=i+1;
        flag=1;
        fprintf(output,"%f\t",R7[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f8;i<N8;i++) {
      if (strstr(gene,G8+20*i)!=NULL && strstr(G8+20*i,gene)!=NULL) {
        f8=i+1;
        flag=1;
        fprintf(output,"%f\t",R8[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f9;i<N9;i++) {
      if (strstr(gene,G9+20*i)!=NULL && strstr(G9+20*i,gene)!=NULL) {
        f9=i+1;
        flag=1;
        fprintf(output,"%f\t",R9[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f10;i<N10;i++) {
      if (strstr(gene,G10+20*i)!=NULL && strstr(G10+20*i,gene)!=NULL) {
        f10=i+1;
        flag=1;
        fprintf(output,"%f\t",R10[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f11;i<N11;i++) {
      if (strstr(gene,G11+20*i)!=NULL && strstr(G11+20*i,gene)!=NULL) {
        f11=i+1;
        flag=1;
        fprintf(output,"%f\t",R11[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f12;i<N12;i++) {
      if (strstr(gene,G12+20*i)!=NULL && strstr(G12+20*i,gene)!=NULL) {
        f12=i+1;
        flag=1;
        fprintf(output,"%f\t",R12[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f13;i<N13;i++) {
      if (strstr(gene,G13+20*i)!=NULL && strstr(G13+20*i,gene)!=NULL) {
        f13=i+1;
        flag=1;
        fprintf(output,"%f\t",R13[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f14;i<N14;i++) {
      if (strstr(gene,G14+20*i)!=NULL && strstr(G14+20*i,gene)!=NULL) {
        f14=i+1;
        flag=1;
        fprintf(output,"%f\t",R14[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f15;i<N15;i++) {
      if (strstr(gene,G15+20*i)!=NULL && strstr(G15+20*i,gene)!=NULL) {
        f15=i+1;
        flag=1;
        fprintf(output,"%f\t",R15[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f16;i<N16;i++) {
      if (strstr(gene,G16+20*i)!=NULL && strstr(G16+20*i,gene)!=NULL) {
        f16=i+1;
        flag=1;
        fprintf(output,"%f\t",R16[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f17;i<N17;i++) {
      if (strstr(gene,G17+20*i)!=NULL && strstr(G17+20*i,gene)!=NULL) {
        f17=i+1;
        flag=1;
        fprintf(output,"%f\t",R17[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f18;i<N18;i++) {
      if (strstr(gene,G18+20*i)!=NULL && strstr(G18+20*i,gene)!=NULL) {
        f18=i+1;
        flag=1;
        fprintf(output,"%f\t",R18[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f19;i<N19;i++) {
      if (strstr(gene,G19+20*i)!=NULL && strstr(G19+20*i,gene)!=NULL) {
        f19=i+1;
        flag=1;
        fprintf(output,"%f\t",R19[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f20;i<N20;i++) {
      if (strstr(gene,G20+20*i)!=NULL && strstr(G20+20*i,gene)!=NULL) {
        f20=i+1;
        flag=1;
        fprintf(output,"%f\t",R20[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f21;i<N21;i++) {
      if (strstr(gene,G21+20*i)!=NULL && strstr(G21+20*i,gene)!=NULL) {
        f21=i+1;
        flag=1;
        fprintf(output,"%f\t",R21[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f22;i<N22;i++) {
      if (strstr(gene,G22+20*i)!=NULL && strstr(G22+20*i,gene)!=NULL) {
        f22=i+1;
        flag=1;
        fprintf(output,"%f\t",R22[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f23;i<N23;i++) {
      if (strstr(gene,G23+20*i)!=NULL && strstr(G23+20*i,gene)!=NULL) {
        f23=i+1;
        flag=1;
        fprintf(output,"%f\t",R23[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\t");
    }
    flag=0;
    for (i=f24;i<N24;i++) {
      if (strstr(gene,G24+20*i)!=NULL && strstr(G24+20*i,gene)!=NULL) {
        f24=i+1;
        flag=1;
        fprintf(output,"%f\n",R24[i]);
        continue;
      }
    }
    if (flag==0) {
      fprintf(output,"0\n");
    }
    flag=0;
  }
  fclose(input);
  fclose(output);
}
