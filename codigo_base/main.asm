# main.asm

.include "macros.asm"

.globl main
.text

main:
    # Alocar espaço na pilha para as matrizes A, B e C
    addi $sp, $sp, -192  # Alocar espaço para 3 matrizes 4x4 de inteiros (3 * 4 * 4 * 4 bytes)

    # Obter os endereços base das matrizes na pilha
    move $s0, $sp        # Endereço base da matriz A
    addi $s1, $sp, 64    # Endereço base da matriz B (após a matriz A)
    addi $s2, $sp, 128   # Endereço base da matriz C (após a matriz B)

    # Preencher a matriz A com números aleatórios
    move $a0, $s0
    jal preencheMat
    
    # Preencher a matriz A com números aleatórios
    move $a0, $s1
    jal preencheMat
    
    # Calcular o produto das matrizes A e B
    move $a0, $s0
    move $a1, $s1
    move $a2, $s2
    jal produtoMat

    # Imprimir a matriz resultado C
    move $a0, $s2
    jal printMat

    # Liberar o espaço alocado na pilha
    addi $sp, $sp, 192

    # Terminar o programa
    li $v0, 10        # Syscall para sair
    syscall
