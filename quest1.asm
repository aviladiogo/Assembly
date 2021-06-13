.text
	
	proc1: ## recebe: matriz[]=$a4; vetor[]=$a3; i= $a1; j= $a0
		addi $t0, $t0, $zero
		addi $t1, $t1, 8
		addi $sp, $sp, -8 #pilha
		
		multiplição: #faz i*8 e armazena no $t2
			beq $t0, $t1, prepara
			addi $t2, $t2, $a1 
			addi $t0, $t0, 1
			j multiplicação
     			prepara: #reseta os contadores
				addi $t0, $t0, $zero
				addi $t1, $t1, 3	
				multiplicação2: #faz j*3 e armazena no $t3
					beq $t0, $t1, prepara2
					addi $t3, $t3, $a0
					addi $t0, $t0, 1
					j multiplicação2
			prepara2:  #reseta os contadores
					addi $t0, $t0, $zero
					addi $t1, $t1, 4
					multiplica3:  #faz j*4 e armazena no $t4
					beq $t0, $t1, prepara3
					addi $t4, $t4, $a0
					addi $t0, $t0, 1
					j multiplicação2
			prepara3: #carrega os vetores
	
					sw $t4, matriz($t2)#vetor na posição zero recebe (j*4)

					add $t4, $t2, $t3 # (i*8+j*3)
					addi $t2, $t2, $zero
					sw $t4, vetor($t2) #vetor na posição zero recebe (i*8+j*3)
		
		
					lw $a2, vetor($t2) #extrai o valor do vetor
					lw $t3, matriz($t2)			
				while:
					gt $t0, $t3, saida #While (Vetor[8i+3j] &gt; Matriz[4j])
					
					sw $a0, 0($sp)#Empilha
					sw $a1, 4($sp)
					sw $t0, 8($sp)
                                   
               				la $a2, process2 #Proc2(Vetor[8i+3j]) 
               				add $t
                			add $t3, $zero, $v0 #Matriz[4j]= Proc2(Vetor[8i+3j]) 
                			
                			lw $t0, 8($sp)#Desempilha
                			lw $a1, 4($sp)
                			lw $a0, 0($sp)
					
                
                			la $a0, process3 #Proc2(Vetor[8i+3j])
                			add $a0, $a1, $v0 #j = i + Proc3(j)(proc3 retorna $v0)
					j while
				
				saida:
				addi $sp, $sp, 8 #quebra a pilha
				jr $ra
 
	
