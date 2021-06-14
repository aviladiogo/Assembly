.text
	#Escreva um programa em linguagem de montagem do Mips que execute o cálculo da média aritmética
        #de um vetor de inteiros com 10 números.
	procedimento: ## considera o vetor[] com 40 bytes (10 slots int)
		addi $t0, $zero, 10
		addi $t1, $zero, 40 #tamanho do vetor
		addi $t2, $zero, 0 
		addi $t4, $zero, 0	
		somatorio: #soma todos os valores do vetor
			lw $t3, save($t2) # carrega t3 com o valor a ser comparado
			
			beq $t2, $t1, dividir   # se cont = 10 programam pula para divisão
			add $t3, $zero, $t3
			
			addi $t2, $t2, 4
			j loop
	
	dividir:
		ble $t3, $zero, saida # $t3 possui a soma dos termos. e quando chegar em 0 saira do programa
		
		sub $t3, $zero, $t0 #subtrai 10 do total
		
		addi $t4, $t4, 1 #t4 conta quantas vezes houve a subtração (nosso quociente)
		j dividir
		
	saida:
		add $v0, $zero, $t4
		
 
	
