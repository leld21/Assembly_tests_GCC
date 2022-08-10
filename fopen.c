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

int main(int argc, char **argv[]){

FILE * filePointer; 
filePointer = fopen("entrada.txt", "r");

int quant;
fscanf(filePointer, "%i", &quant);
for(int i=0;i<quant;i++){
    int n;
    int *vetor;
    fscanf(filePointer, "%i", &n);
    vetor=malloc(sizeof(int)*n);
    printf("[%d] ",i);
    for(int j=0;j<n;j++){
        fscanf(filePointer,"%i",&vetor[j]);
    }
    bubblesort(vetor,n);
    for(int j=0;j<n;j++){
        if(j==n-1){
            printf("%d\n",vetor[j]);
        }else{
            printf("%d ",vetor[j]);
        }
    }     
}
fclose(filePointer);

}