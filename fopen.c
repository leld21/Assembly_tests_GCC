#include <stdio.h>
#include <stdlib.h>

void bubblesort(int *vetor, int n){
int aux;
for(int i=0;i<n;i++){
    for(int j=i+1;j<n;j++){
        if(vetor[i]>vetor[j]){
            aux=vetor[i];
            vetor[i]=vetor[j];
            vetor[j]=aux;
        }
    }
}

}

int main(int argc, char *argv[]){

FILE * filePointer;
FILE * filePointer2;
filePointer = fopen(argv[1], "r");
filePointer2 = fopen(argv[2], "w");

int quant;
fscanf(filePointer, "%i", &quant);
for(int i=0;i<quant;i++){
    int n;
    int *vetor;
    fscanf(filePointer, "%i", &n);
    vetor=malloc(sizeof(int)*n);
    fprintf(filePointer2,"[%d] ",i);
    for(int j=0;j<n;j++){
        fscanf(filePointer,"%i",&vetor[j]);
    }
    bubblesort(vetor,n);
    for(int j=0;j<n;j++){
        if(j==n-1){
            fprintf(filePointer2,"%d\n",vetor[j]);
        }else{
            fprintf(filePointer2,"%d ",vetor[j]);
        }
    }     
}
fclose(filePointer);
fclose(filePointer2);

}