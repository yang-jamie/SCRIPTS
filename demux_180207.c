#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Created on 2/9/2018
// Demultiplex internal adapters
// ATCACG, TTAGGCG, ACTTGACG, GATCAGTAG, TAGCTTACAG, GGCTACGAGTG
// only use first for bases for exact match
// for unexact matches, add a 5th base with N

int main(int argc,char *argv[]) {
  if (argc!=9) {
    fprintf(stderr,"Usage: %s <INPUT> <OUT1> <OUT2> <OUT3> <OUT4> <OUT5> <OUT6> <OUT7>\n",argv[0]);
    return 1;
  }
  FILE *input=fopen(argv[1],"r");
  FILE *out1=fopen(argv[2],"w");
  FILE *out2=fopen(argv[3],"w");
  FILE *out3=fopen(argv[4],"w");
  FILE *out4=fopen(argv[5],"w");
  FILE *out5=fopen(argv[6],"w");
  FILE *out6=fopen(argv[7],"w");
  FILE *out7=fopen(argv[8],"w");
  if (input==NULL) {
    fprintf(stderr,"Cannot open input file: %s\n",argv[1]);
    return 1;
  }
  if (out1==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[2]);
    return 1;
  }
  if (out2==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[3]);
    return 1;
  }
  if (out3==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[4]);
    return 1;
  }
  if (out4==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[5]);
    return 1;
  }
  if (out5==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[6]);
    return 1;
  }
  if (out6==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[7]);
    return 1;
  }
  if (out7==NULL) {
    fprintf(stderr,"Cannot write to output file: %s\n",argv[8]);
    return 1;
  }
// Define variables
  char line[10000]="",line_prev[10000]="";
  char B1_1[20]="ATCA",B1_2[20]="TCAC",B1_3[20]="ANCAC",B1_4[20]="ATNAC",B1_5[20]="ATCNC";
  char B2_1[20]="TTAG",B2_2[20]="TAGG",B2_3[20]="TNAGG",B2_4[20]="TTNGG",B2_5[20]="TTANG";
  char B3_1[20]="ACTT",B3_2[20]="CTTG",B3_3[20]="ANTTG",B3_4[20]="ACNTG",B3_5[20]="ACTNG";
  char B4_1[20]="GATC",B4_2[20]="ATCA",B4_3[20]="GNTCA",B4_4[20]="GANCA",B4_5[20]="GATNA";
  char B5_1[20]="TAGC",B5_2[20]="AGCT",B5_3[20]="TNGCT",B5_4[20]="TANCT",B5_5[20]="TAGNT";
  char B6_1[20]="GGCT",B6_2[20]="GCTA",B6_3[20]="GNCTA",B6_4[20]="GGNTA",B6_5[20]="GGCNA";
  unsigned int flag=0;

// Scan lines for sequence
// A=65, C=67, G=71, T=84, N=78
// only need to match first 4 bases or first 5 bases with 1-bp mismatch
  while(fgets(line,10000,input)!=NULL) {
    strcpy(line_prev,line);
    fgets(line,10000,input);
    flag=0;
    if (strstr(line,B1_1)-line==0 || strstr(line,B1_2)-line==1 || strstr(line,B1_3)-line==0 || strstr(line,B1_4)-line==0 || strstr(line,B1_1)-line==0 ) {
      fprintf(out1,"%s",line_prev);
      fprintf(out1,"%s",line);
      fgets(line,10000,input);
      fprintf(out1,"%s",line);
      fgets(line,10000,input);
      fprintf(out1,"%s",line);
      flag=1;
    }
    else {
      B1_3[1]=65;
      B1_4[2]=65;
      B1_5[3]=65;
      if (strstr(line,B1_3)-line==0 || strstr(line,B1_4)-line==0 || strstr(line,B1_1)-line==0 ) {
        fprintf(out1,"%s",line_prev);
        fprintf(out1,"%s",line);
        fgets(line,10000,input);
        fprintf(out1,"%s",line);
        fgets(line,10000,input);
        fprintf(out1,"%s",line);
        flag=1;
      }
      else {
        B1_3[1]=67;
        B1_4[2]=67;
        B1_5[3]=67;
        if (strstr(line,B1_3)-line==0 || strstr(line,B1_4)-line==0 || strstr(line,B1_1)-line==0 ) {
          fprintf(out1,"%s",line_prev);
          fprintf(out1,"%s",line);
          fgets(line,10000,input);
          fprintf(out1,"%s",line);
          fgets(line,10000,input);
          fprintf(out1,"%s",line);
          flag=1;
        }
        else {
          B1_3[1]=71;
          B1_4[2]=71;
          B1_5[3]=71;
          if (strstr(line,B1_3)-line==0 || strstr(line,B1_4)-line==0 || strstr(line,B1_1)-line==0 ) {
            fprintf(out1,"%s",line_prev);
            fprintf(out1,"%s",line);
            fgets(line,10000,input);
            fprintf(out1,"%s",line);
            fgets(line,10000,input);
            fprintf(out1,"%s",line);
            flag=1;
          }
          else {
            B1_3[1]=84;
            B1_4[2]=84;
            B1_5[3]=84;
            if (strstr(line,B1_3)-line==0 || strstr(line,B1_4)-line==0 || strstr(line,B1_1)-line==0 ) {
              fprintf(out1,"%s",line_prev);
              fprintf(out1,"%s",line);
              fgets(line,10000,input);
              fprintf(out1,"%s",line);
              fgets(line,10000,input);
              fprintf(out1,"%s",line);
              flag=1;
            }
          }
        }
      }
    }
    B1_3[1]=78;
    B1_4[2]=78;
    B1_5[3]=78;
    if (flag==0) {
      if (strstr(line,B2_1)-line==0 || strstr(line,B2_2)-line==1 || strstr(line,B2_3)-line==0 || strstr(line,B2_4)-line==0 || strstr(line,B2_1)-line==0 ) {
        fprintf(out2,"%s",line_prev);
        fprintf(out2,"%s",line);
        fgets(line,10000,input);
        fprintf(out2,"%s",line);
        fgets(line,10000,input);
        fprintf(out2,"%s",line);
        flag=1;
      }
      else {
        B2_3[1]=65;
        B2_4[2]=65;
        B2_5[3]=65;
        if (strstr(line,B2_3)-line==0 || strstr(line,B2_4)-line==0 || strstr(line,B2_1)-line==0 ) {
          fprintf(out2,"%s",line_prev);
          fprintf(out2,"%s",line);
          fgets(line,10000,input);
          fprintf(out2,"%s",line);
          fgets(line,10000,input);
          fprintf(out2,"%s",line);
          flag=1;
        }
        else {
          B2_3[1]=67;
          B2_4[2]=67;
          B2_5[3]=67;
          if (strstr(line,B2_3)-line==0 || strstr(line,B2_4)-line==0 || strstr(line,B2_1)-line==0 ) {
            fprintf(out2,"%s",line_prev);
            fprintf(out2,"%s",line);
            fgets(line,10000,input);
            fprintf(out2,"%s",line);
            fgets(line,10000,input);
            fprintf(out2,"%s",line);
            flag=1;
          }
          else {
            B2_3[1]=71;
            B2_4[2]=71;
            B2_5[3]=71;
            if (strstr(line,B2_3)-line==0 || strstr(line,B2_4)-line==0 || strstr(line,B2_1)-line==0 ) {
              fprintf(out2,"%s",line_prev);
              fprintf(out2,"%s",line);
              fgets(line,10000,input);
              fprintf(out2,"%s",line);
              fgets(line,10000,input);
              fprintf(out2,"%s",line);
              flag=1;
            }
            else {
              B2_3[1]=84;
              B2_4[2]=84;
              B2_5[3]=84;
              if (strstr(line,B2_3)-line==0 || strstr(line,B2_4)-line==0 || strstr(line,B2_1)-line==0 ) {
                fprintf(out2,"%s",line_prev);
                fprintf(out2,"%s",line);
                fgets(line,10000,input);
                fprintf(out2,"%s",line);
                fgets(line,10000,input);
                fprintf(out2,"%s",line);
                flag=1;
              }
            }
          }
        }
      }
    }
    B2_3[1]=78;
    B2_4[2]=78;
    B2_5[3]=78;
    if (flag==0) {
      if (strstr(line,B3_1)-line==0 || strstr(line,B3_2)-line==1 || strstr(line,B3_3)-line==0 || strstr(line,B3_4)-line==0 || strstr(line,B3_1)-line==0 ) {
        fprintf(out3,"%s",line_prev);
        fprintf(out3,"%s",line);
        fgets(line,10000,input);
        fprintf(out3,"%s",line);
        fgets(line,10000,input);
        fprintf(out3,"%s",line);
        flag=1;
      }
      else {
        B3_3[1]=65;
        B3_4[2]=65;
        B3_5[3]=65;
        if (strstr(line,B3_3)-line==0 || strstr(line,B3_4)-line==0 || strstr(line,B3_1)-line==0 ) {
          fprintf(out3,"%s",line_prev);
          fprintf(out3,"%s",line);
          fgets(line,10000,input);
          fprintf(out3,"%s",line);
          fgets(line,10000,input);
          fprintf(out3,"%s",line);
          flag=1;
        }
        else {
          B3_3[1]=67;
          B3_4[2]=67;
          B3_5[3]=67;
          if (strstr(line,B3_3)-line==0 || strstr(line,B3_4)-line==0 || strstr(line,B3_1)-line==0 ) {
            fprintf(out3,"%s",line_prev);
            fprintf(out3,"%s",line);
            fgets(line,10000,input);
            fprintf(out3,"%s",line);
            fgets(line,10000,input);
            fprintf(out3,"%s",line);
            flag=1;
          }
          else {
            B3_3[1]=71;
            B3_4[2]=71;
            B3_5[3]=71;
            if (strstr(line,B3_3)-line==0 || strstr(line,B3_4)-line==0 || strstr(line,B3_1)-line==0 ) {
              fprintf(out3,"%s",line_prev);
              fprintf(out3,"%s",line);
              fgets(line,10000,input);
              fprintf(out3,"%s",line);
              fgets(line,10000,input);
              fprintf(out3,"%s",line);
              flag=1;
            }
            else {
              B3_3[1]=84;
              B3_4[2]=84;
              B3_5[3]=84;
              if (strstr(line,B3_3)-line==0 || strstr(line,B3_4)-line==0 || strstr(line,B3_1)-line==0 ) {
                fprintf(out3,"%s",line_prev);
                fprintf(out3,"%s",line);
                fgets(line,10000,input);
                fprintf(out3,"%s",line);
                fgets(line,10000,input);
                fprintf(out3,"%s",line);
                flag=1;
              }
            }
          }
        }
      }
    }
    B3_3[1]=78;
    B3_4[2]=78;
    B3_5[3]=78;
    if (flag==0) {
      if (strstr(line,B4_1)-line==0 || strstr(line,B4_2)-line==1 || strstr(line,B4_3)-line==0 || strstr(line,B4_4)-line==0 || strstr(line,B4_1)-line==0 ) {
        fprintf(out4,"%s",line_prev);
        fprintf(out4,"%s",line);
        fgets(line,10000,input);
        fprintf(out4,"%s",line);
        fgets(line,10000,input);
        fprintf(out4,"%s",line);
        flag=1;
      }
      else {
        B4_3[1]=65;
        B4_4[2]=65;
        B4_5[3]=65;
        if (strstr(line,B4_3)-line==0 || strstr(line,B4_4)-line==0 || strstr(line,B4_1)-line==0 ) {
          fprintf(out4,"%s",line_prev);
          fprintf(out4,"%s",line);
          fgets(line,10000,input);
          fprintf(out4,"%s",line);
          fgets(line,10000,input);
          fprintf(out4,"%s",line);
          flag=1;
        }
        else {
          B4_3[1]=67;
          B4_4[2]=67;
          B4_5[3]=67;
          if (strstr(line,B4_3)-line==0 || strstr(line,B4_4)-line==0 || strstr(line,B4_1)-line==0 ) {
            fprintf(out4,"%s",line_prev);
            fprintf(out4,"%s",line);
            fgets(line,10000,input);
            fprintf(out4,"%s",line);
            fgets(line,10000,input);
            fprintf(out4,"%s",line);
            flag=1;
          }
          else {
            B4_3[1]=71;
            B4_4[2]=71;
            B4_5[3]=71;
            if (strstr(line,B4_3)-line==0 || strstr(line,B4_4)-line==0 || strstr(line,B4_1)-line==0 ) {
              fprintf(out4,"%s",line_prev);
              fprintf(out4,"%s",line);
              fgets(line,10000,input);
              fprintf(out4,"%s",line);
              fgets(line,10000,input);
              fprintf(out4,"%s",line);
              flag=1;
            }
            else {
              B4_3[1]=84;
              B4_4[2]=84;
              B4_5[3]=84;
              if (strstr(line,B4_3)-line==0 || strstr(line,B4_4)-line==0 || strstr(line,B4_1)-line==0 ) {
                fprintf(out4,"%s",line_prev);
                fprintf(out4,"%s",line);
                fgets(line,10000,input);
                fprintf(out4,"%s",line);
                fgets(line,10000,input);
                fprintf(out4,"%s",line);
                flag=1;
              }
            }
          }
        }
      }
    }
    B4_3[1]=78;
    B4_4[2]=78;
    B4_5[3]=78;
    if (flag==0) {
      if (strstr(line,B5_1)-line==0 || strstr(line,B5_2)-line==1 || strstr(line,B5_3)-line==0 || strstr(line,B5_4)-line==0 || strstr(line,B5_1)-line==0 ) {
        fprintf(out5,"%s",line_prev);
        fprintf(out5,"%s",line);
        fgets(line,10000,input);
        fprintf(out5,"%s",line);
        fgets(line,10000,input);
        fprintf(out5,"%s",line);
        flag=1;
      }
      else {
        B5_3[1]=65;
        B5_4[2]=65;
        B5_5[3]=65;
        if (strstr(line,B5_3)-line==0 || strstr(line,B5_4)-line==0 || strstr(line,B5_1)-line==0 ) {
          fprintf(out5,"%s",line_prev);
          fprintf(out5,"%s",line);
          fgets(line,10000,input);
          fprintf(out5,"%s",line);
          fgets(line,10000,input);
          fprintf(out5,"%s",line);
          flag=1;
        }
        else {
          B5_3[1]=67;
          B5_4[2]=67;
          B5_5[3]=67;
          if (strstr(line,B5_3)-line==0 || strstr(line,B5_4)-line==0 || strstr(line,B5_1)-line==0 ) {
            fprintf(out5,"%s",line_prev);
            fprintf(out5,"%s",line);
            fgets(line,10000,input);
            fprintf(out5,"%s",line);
            fgets(line,10000,input);
            fprintf(out5,"%s",line);
            flag=1;
          }
          else {
            B5_3[1]=71;
            B5_4[2]=71;
            B5_5[3]=71;
            if (strstr(line,B5_3)-line==0 || strstr(line,B5_4)-line==0 || strstr(line,B5_1)-line==0 ) {
              fprintf(out5,"%s",line_prev);
              fprintf(out5,"%s",line);
              fgets(line,10000,input);
              fprintf(out5,"%s",line);
              fgets(line,10000,input);
              fprintf(out5,"%s",line);
              flag=1;
            }
            else {
              B5_3[1]=84;
              B5_4[2]=84;
              B5_5[3]=84;
              if (strstr(line,B5_3)-line==0 || strstr(line,B5_4)-line==0 || strstr(line,B5_1)-line==0 ) {
                fprintf(out5,"%s",line_prev);
                fprintf(out5,"%s",line);
                fgets(line,10000,input);
                fprintf(out5,"%s",line);
                fgets(line,10000,input);
                fprintf(out5,"%s",line);
                flag=1;
              }
            }
          }
        }
      }
    }
    B5_3[1]=78;
    B5_4[2]=78;
    B5_5[3]=78;
    if (flag==0) {
      if (strstr(line,B6_1)-line==0 || strstr(line,B6_2)-line==1 || strstr(line,B6_3)-line==0 || strstr(line,B6_4)-line==0 || strstr(line,B6_1)-line==0 ) {
        fprintf(out6,"%s",line_prev);
        fprintf(out6,"%s",line);
        fgets(line,10000,input);
        fprintf(out6,"%s",line);
        fgets(line,10000,input);
        fprintf(out6,"%s",line);
        flag=1;
      }
      else {
        B6_3[1]=65;
        B6_4[2]=65;
        B6_5[3]=65;
        if (strstr(line,B6_3)-line==0 || strstr(line,B6_4)-line==0 || strstr(line,B6_1)-line==0 ) {
          fprintf(out6,"%s",line_prev);
          fprintf(out6,"%s",line);
          fgets(line,10000,input);
          fprintf(out6,"%s",line);
          fgets(line,10000,input);
          fprintf(out6,"%s",line);
          flag=1;
        }
        else {
          B6_3[1]=67;
          B6_4[2]=67;
          B6_5[3]=67;
          if (strstr(line,B6_3)-line==0 || strstr(line,B6_4)-line==0 || strstr(line,B6_1)-line==0 ) {
            fprintf(out6,"%s",line_prev);
            fprintf(out6,"%s",line);
            fgets(line,10000,input);
            fprintf(out6,"%s",line);
            fgets(line,10000,input);
            fprintf(out6,"%s",line);
            flag=1;
          }
          else {
            B6_3[1]=71;
            B6_4[2]=71;
            B6_5[3]=71;
            if (strstr(line,B6_3)-line==0 || strstr(line,B6_4)-line==0 || strstr(line,B6_1)-line==0 ) {
              fprintf(out6,"%s",line_prev);
              fprintf(out6,"%s",line);
              fgets(line,10000,input);
              fprintf(out6,"%s",line);
              fgets(line,10000,input);
              fprintf(out6,"%s",line);
              flag=1;
            }
            else {
              B6_3[1]=84;
              B6_4[2]=84;
              B6_5[3]=84;
              if (strstr(line,B6_3)-line==0 || strstr(line,B6_4)-line==0 || strstr(line,B6_1)-line==0 ) {
                fprintf(out6,"%s",line_prev);
                fprintf(out6,"%s",line);
                fgets(line,10000,input);
                fprintf(out6,"%s",line);
                fgets(line,10000,input);
                fprintf(out6,"%s",line);
                flag=1;
              }
            }
          }
        }
      }
    }
    B6_3[1]=78;
    B6_4[2]=78;
    B6_5[3]=78;
    if (flag==0) {
      fprintf(out7,"%s",line_prev);
      fprintf(out7,"%s",line);
      fgets(line,10000,input);
      fprintf(out7,"%s",line);
      fgets(line,10000,input);
      fprintf(out7,"%s",line);
    }
  }
  fclose(input);
  fclose(out1);
  fclose(out2);
  fclose(out3);
  fclose(out4);
  fclose(out5);
  fclose(out6);
  fclose(out7);
}
