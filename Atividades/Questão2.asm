.text
	
	procedimento: ## recebe: A = $a1, B = $a2
		addi $t0, $zero, 0
		addi $t3, $t3, 396 #maximo das array
		addi $t5, $zero, 0 #qtd de C
		add $t4, $zero, $t3 #salva o numero maximo para fazer o decrescente
		addi $t1, $t1, 5  #condição de parada 1
		addi $t2, $t2,100 #condição de parada 2
		
		loop: #faz i*8 e armazena no $t2
			lw $a1, A($t0) #carrega a1 com o valor a ser comparado
			lw $a2, B($t4) 
			
			beq $t0, $t3, saida   # se qtd = 396 para o programa pois leu toda array
			
			beq $a1, $t1, saida #se A ou B for igual a 5 parar
			beq $a2, $t1, saida
			
			bgt $a1, $a2, insereA #se  A > B insere A em C
			blt $a1, $a2, insereb #se  B > A insere B em C
			
			subi $t4, $t4, 4
			addi $t0, $t0, 4
			j loop
	
	insereA:
		sw $a1, C($t5) #armazena A na posição respectiva em C
		addi $t5, $t5, 4
		
		subi $t4, $t4, 4
		addi $t0, $t0, 4
		j loop
	
	insereB:
		sw $a2, C($t5) #armazena B na posição respectiva em C
		addi $t5, $t5, 4
		
		subi $t4, $t4, 4
		addi $t0, $t0, 4
		j loop
	
     			
	saida:
		add $v0, $zero, $t5 #retorna quantos elementos foram copiados para o banco C
		
 
	
