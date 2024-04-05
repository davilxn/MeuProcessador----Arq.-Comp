# PreencheMat

.include "macros.asm"

.globl preencheMat

preencheMat:
    save_context

    move $s0, $a0

    # Inicializar o gerador de números aleatórios com o tempo atual
    li $v0, 40    
    syscall

    li $s6, 0       # i = 0
    loop_i:
        li $s7, 0   # j = 0
        loop_j:
            # Gerar número aleatório entre 0 e 9
            li $v0, 42  
            li $a1, 10   
            syscall		# v0 = rand
            
            # Calcular endereço
  	    sll $t1, $s6, 4 
  	    sll $t2, $s7, 2 
  	    add $t0, $t1, $t2
            add $t0, $t0, $s0	# endereço base + i * 8 + j
            
            # Armazenar o número gerado na matriz
            sw $v0, ($t0)  # mat[i][j] = rand
           
            addi $s7, $s7, 1 		# j++
            blt $s7, 4, loop_j
        
        # Incrementar contador de linha
        addi $s6, $s6, 1		# i++
        blt $s6, 4, loop_i

    restore_context
    jr $ra
