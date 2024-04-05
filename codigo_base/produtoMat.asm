# produtoMat.asm

.include "macros.asm"

.globl produtoMat

produtoMat:
    save_context

    # Carregar os endereços base das matrizes A, B e C passadas como parâmetros
    move $s0, $a0   # Endereço base da matriz A
    move $s1, $a1   # Endereço base da matriz B
    move $s2, $a2   # Endereço base da matriz C

    # Loop para calcular o produto das matrizes
    li $s5, 0       # i = 0
    loop_i:
	bge $s5, 4, fim_i
        li $s6, 0   # j = 0
        loop_j:
            bge $s6, 4, fim_j
            li $s7, 0   # k = 0
            li $t7, 0   # acc = 0
            loop_mult:
                bge $s7, 4, fim_mult
            	# Calcular endereço em A
  	    	sll $t1, $s5, 4
  	    	sll $t2, $s7, 2 
  	    	add $t1, $t1, $t2
            	add $t1, $t1, $s0	
            	
            	# Calcular endereço em B
  	    	sll $t3, $s7, 4 
  	    	sll $t4, $s6, 2 
  	    	add $t2, $t3, $t4
            	add $t2, $t2, $s1	
            	
                lw $t3, 0($t1)   	# a = A[i][k]
                lw $t4, 0($t2)   	# b = B[k][j]
                mul $t3, $t3, $t4   	# c = a * b
                add $t7, $t7, $t3   	# acc += c
                
                addi $s7, $s7, 1
                j loop_mult  
            
            fim_mult:
            	# Calcular endereço em C  
            	sll $t1, $s5, 4 
  	    	sll $t2, $s6, 2 
  	    	add $t1, $t1, $t2
            	add $t1, $t1, $s2
            
            	sw $t7, ($t1)   # C[i][j] = acc
            	
            addi $s6, $s6, 1
            j loop_j  
            
        fim_j:
        	addi $s5, $s5, 1
        	j loop_i
	
	fim_i:
    		restore_context
    		jr $ra
