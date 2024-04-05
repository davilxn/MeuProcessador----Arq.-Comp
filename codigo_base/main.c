#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define LINHAS 4
#define COLUNAS 4

// Função para preencher uma matriz com números aleatórios
void preencheMat(int mat[LINHAS][COLUNAS]) {
    for (int i = 0; i < LINHAS; i++) {
        for (int j = 0; j < COLUNAS; j++) {
            mat[i][j] = rand() % 10; // Gera números aleatórios entre 0 e 9
        }
    }
}

// Função para imprimir uma matriz
void printmat(int mat[LINHAS][COLUNAS]) {
    for (int i = 0; i < LINHAS; i++) {
        for (int j = 0; j < COLUNAS; j++) {
            printf("%d ", mat[i][j]);
        }
        printf("\n");
    }
}

// Função para calcular o produto de duas matrizes
void produtoMat(int A[LINHAS][COLUNAS], int B[LINHAS][COLUNAS], int C[LINHAS][COLUNAS]) {
    for (int i = 0; i < LINHAS; i++) {
        for (int j = 0; j < COLUNAS; j++) {
            C[i][j] = 0;
            for (int k = 0; k < LINHAS; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

int main() {
    // Inicializa o gerador de números aleatórios com o tempo atual
    srand(time(NULL));

    // Declara as matrizes A, B e C
    int matA[LINHAS][COLUNAS];
    int matB[LINHAS][COLUNAS];
    int matC[LINHAS][COLUNAS];

    // Preenche as matrizes A e B com números aleatórios
    preencheMat(matA);
    preencheMat(matB);

    // Imprime as matrizes A e B
    printf("Matriz A:\n");
    printmat(matA);
    printf("\nMatriz B:\n");
    printmat(matB);

    // Calcula o produto das matrizes A e B e armazena em C
    produtoMat(matA, matB, matC);

    // Imprime a matriz resultante C
    printf("\nProduto das matrizes A e B (Matriz C):\n");
    printmat(matC);

    return 0;
}
