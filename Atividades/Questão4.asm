.data
    save:
        .align 2
        .space 80 #aloca 20 spaços no array (por bytes)
    test:
        .align 2
        .space 80 #aloca 20 spaços no array (por bytes)
.text
	
	procedimento: ## recebe: i = $a0, j = $a1, save = $a3, test= $a4
		addi $t0, $zero, 0
	
		while: #faz i*8 e armazena no $t2
			lw $t1, save($a0) #carrega a0 com o valor a ser comparado
			lw $t2, test($a1) #carrega a1 com o valor a ser comparado
			
			beq $t1, $t2, saida   # se save[1] for diferente de test[j] o programa continua 

			beq $a0, $a1, atualiza+ #se I for igual a J
			bne $a0, $a1, atualiza- #else I for diferente a J
		
			j loop
	
	atualizar+:
		add $t3, $t1, 1 #save[i+1]
		add $t1, $t3, 2 #save[i+1]+2
		
		lw $t1, save($a0) #save na posição i vai ser igual a save[i+1]+2
		
		add $a0, $a0, $a1 # i = i+j
		j loop
	
	atualizar-:
		add $t3, $t1, 1 #save[i+1]
		sub $t1, $t3, 2 #save[i+1]-2
		
		lw $t1, save($a0) #save na posição i vai ser igual a save[i+1]-2
		
		add $a0, $a0, $a1 # i = i+j
		j loop
     			
	saida:
		jr $ra
		
 
	
