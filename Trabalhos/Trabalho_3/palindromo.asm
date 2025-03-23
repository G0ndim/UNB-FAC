.data 
	str: .space 1000
	fim: .string "\n"
.text 
main:
	# LER O TAMANHO DA STRING
	li a7 , 5	# syscall flag setada para ler inteiro
	ecall 		# syscall para ler o tamanho da string
	mv t0 , a0	# t0 = a0 (t0 --> tamanho n da string)
	
	# LER A STRING
	addi t0, t0, 1	# t0 = t0 + 1 (incluindo o caractere nulo)
	la a0 , str  	# a0 = &str 
	mv a1,t0 	# a1 = t0 (seta o tamanho da string a ser lida)
	li a7,8  	# sysflag setada para ler string de tamanho a1 
	ecall		# syscall para ler a string
	
	# IMPRIMIR "\n" NO TERMINAL
	la a0 , fim 	# a0 = &fim ("\n")
	li a7 , 4	# syscall setada para escrever a string em a0 no terminal
	ecall		# syscall para pular linha
	
	# PREPARAR AS VARIAVEIS
	la t1, str      # t1 = &str[0] (endereço da string lida)
	la t2, str	# t2 = &str[0] (endereço da string lida)
	addi t0, t0, -2	# t0 = t0 - 2 
	add t2, t2, t0	# t2 = str[n-2] (desconsiderando o "\0")
	
	li a0, 1	# resultado inicial = 0
loop:
	# LOOP DE COMPARACAO
	beqz t0, end	# se t0 == 0 --> vai pro final do programa
    	lbu t3, 0(t1) 	# t3 = str[comecando do incio e aumentando]
    	lbu t4, 0(t2) 	# t4 = str[comecando do fim e diminuindo] 
    	
    	bne t3, t4, not_p # se t3 != t4 --> a0 = 1, e finaliza o programa
    
    	addi t1, t1, 1	# t1++
    	
    	addi t2, t2, -1	# t2--
    	addi t0, t0, -1	# t0--
	
	j loop
not_p:
	# BRANCH QUE TROCA A RESPOSTA CASO NAO SEJA PALINDROMO
	li a0, 0	# a0 = 0 (caso nao seja um palindromo)
end:
	# ESCREVE A RESPOSTA (0 ou 1) NO TERMINAL
    	li a7, 1        # syscall setada para escrever inteiro
    	ecall           # syscall para escrever o resultado no terminal 
    	
    	# IMPRIMIR "\n" NO TERMINAL
    	la a0 , fim 	# a0 = &fim ("\n")
	li a7 , 4	# syscall setada para escrever a string em a0 no terminal
	ecall		# syscall para pular linha
    
    
    		

	
	
		
	
	
	
	
