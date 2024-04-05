# printMat.asm

.include "macros.asm"

.globl printMat

printMat:
    save_context

    # Carregar o endereço base da matriz passada como parâmetro
    move $s0, $a0   

    # Loop para imprimir a matriz
    li $s6, 0       # Inicializar índice de linha
    loop_i:
    	bge $s6, 4, fim_i
        li $s7, 0   # Inicializar índice de coluna
        loop_j:
            bge $s7, 4, fim_j
            # Calcular endereço
  	    sll $t1, $s6, 4 
  	    sll $t2, $s7, 2 
  	    add $t0, $t1, $t2
            add $t0, $t0, $s0	# endereço base + i * 8 + j
            lw $a0, 0 ($t0)
            li $v0, 1   # Syscall para imprimir inteiro
            syscall

            # Imprimir espaço após cada elemento (exceto último)
            li $a0, 32   # ASCII para espaço
            li $v0, 11   # Syscall para imprimir caractere
            syscall

            # Verificar se o loop interno deve continuar
            addi $s7, $s7, 1  
            j loop_j 
            
        fim_j:
        	addi $s6, $s6, 1
        	li $a0, 10   # ASCII para nova linha
        	li $v0, 11   # Syscall para imprimir caractere
        	syscall
        	
        	j loop_i
	
	
	fim_i:
		restore_context
    		jr $ra
 
 	

    
