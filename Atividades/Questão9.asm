.data
    msg: .asciiz "Insira a opção: 1- adicionar azul | 2- adcionar amarelo | 3- adicionar verde | 0- sair"
    branco: .asciiz " "
.text
	addi $t0, $zero, 0 #total de grana
  	addi $t1, $zero, 0 #total azuis
  	addi $t2, $zero, 0 #total amarelos
  	addi $t3, $zero, 0 #total verdes
    	dowhile:
    		li $v0, 4 #imprimir uma String
    		la $a0, msg
    		syscall
    		
    		li $v0, 5 #le inteiros
    		syscall

    		beq $v0, 0, finaliza
    		beq $v0, 1, adicionarAz
    		beq $v0, 2, adicionarAm
    		beq $v0, 3, adicionarVe
    		j dowhile
    	adicionarAz:
    		addi $t0, $t0, 500 #mais 500 reais
    		addi $t1, $t1, 1 #mais uma unidade de azul 
    		j dowhile

    	adicionarAm:
    		addi $t0, $t0, 500 #mais 500 reais
    		addi $t2, $t2, 1 #mais uma unidade de amarelo  
    		j dowhile
    		  	
    	adicionarVe:
    		addi $t0, $t0, 500 #mais 500 reais
    		addi $t3, $t3, 1 #mais uma unidade de verde
    		j dowhile
    	
    	finaliza:
    		li $v0, 1 #imprimir um inteiro
        	add $a0, $zero, $t1 #imprime os azuis
            	syscall 
            	
            	li $v0, 4  #imprime espaço em branco para estetica no terminal
                la $a0, branco
            	syscall
            	
            	li $v0, 1 #imprimir um inteiro
        	add $a0, $zero, $t2 #imprime os amarelos
            	syscall
            	
            	li $v0, 4  #imprime espaço em branco para estetica no terminal
           	la $a0, branco
            	syscall
            	
            	li $v0, 1 #imprimir um inteiro
        	add $a0, $zero, $t3 #imprime os verdes
            	syscall
            	
            	li $v0, 4  #imprime espaço em branco para estetica no terminal
           	la $a0, branco
            	syscall
            	
            	li $v0, 1 #imprimir um inteiro
        	add $a0, $zero, $t0 #imprime o total de dineheiro
           	syscall    		
