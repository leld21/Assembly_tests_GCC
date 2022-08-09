#include <stdio.h>
#include <stdlib.h>
/*
int* ordena (int a*[],int n){

}
*/

int main(int argc, char **argv[]){

FILE * filePointer; 
filePointer = fopen("entrada.txt", "r");

int numero;
fscanf(filePointer, "%i", &numero);
    
    for(int i=0;i<numero;i++){
        int n;
        char valores[30];
        fscanf(filePointer, "%i", &n);
        int *vetor;
        vetor=malloc(sizeof(int)*n);
        fgets(valores,sizeof(valores), filePointer);
        for(int j=0;j<(n*2)-1;j++){
            if(j%2==0){
                vetor[(j/2)]=((int)valores[j])-'0';
            }
        }
        for(int i=0;i<n;i++){
            printf("%d\n",vetor[i]);
        }
    }

/*
char x[36];
fgets(x, sizeof(x), filePointer);
int numero=atoi(x);
char y[10];

for(int i=0;i<numero;i++){
    fgets(y, sizeof(y), filePointer);
    int n=atoi(y);
    int *vetor;
    vetor = malloc(sizeof(int)*n);
    char elementos[50];
    fgets(elementos, sizeof(elementos), filePointer);
    printf("%s\n",elementos);
}
*/
/*
char y[10];
fgets(y, sizeof(y), filePointer);
printf("%c\n",y[0]);
char z[10];
fgets(y, sizeof(y), filePointer);
printf("%i\n",atoi(y));
*/
/*
while (fgets(line, sizeof line, file) != NULL) 
{
    if (count == lineNumber)
    {
        //use line or in a function return it
        //in case of a return first close the file with "fclose(file);"
    }
    else
    {
        count++;
    }
}
*/
fclose(filePointer);

}