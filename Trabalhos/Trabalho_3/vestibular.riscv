.data 
	str: .space 100
	str2: .space 100
	fim: .string "\n"
.text 
main:
	
	li a7 , 5	# syscall flag setada para ler inteiro
	ecall 		# syscall para ler o tamanho da string
	mv t0 , a0	# t0 = a0
	
	addi t0, t0, 1	# t0 = t0 + 1 --> "\0"
	la a0 , str  	# a0 = &str --> string do gabarito
	mv a1,t0 	# a1 = t0 (seta o tamanho da string a ser lida)
	li a7,8  	# sysflag setada para ler string de tamanho a1 
	ecall		# syscall para ler o gabarito
	
	la a0 , fim 	# a0 = &fim ("\n")
	li a7 , 4	# syscall setada para escrever a string em a0 no terminal
	ecall		# syscall para pular linha
	
	la a0 , str2	# a0 = &str2 --> string das respostas
	mv a1, t0	# a1 = t0 (seta o tamanho da string a ser lida) 
	li a7 , 8	# sysflag setada para ler string de tamanho a1 
	ecall		# syscall para ler as respostas
	
	la a0 , fim 	# a0 = &fim ("\n")
	li a7 , 4	# syscall setada para escrever a string em a0 no terminal
	ecall		# syscall para pular linha
	
	li t1 ,0 	# t1 = 0 (contador setado para 0)
	
	la a0, str      # a0 = &str (endereço da string do gabarito)
    	la a1, str2     # a1 = &str2 (endereço da string das respostas)
    	
 loop:
 	
    	lbu t2, 0(a0) 	# t2 = a0[0] (primeiro caratere da string em a0)
    	lbu t3, 0(a1) 	# t3 = a1[0] (primeiro caratere da string em a1)
     
   	# verificacao de igualdade entre os caracteres
    	beqz t2, fim_comparacao   	# Se t2 = 0 --> chegamos ao final da primeira string
    	beqz t3, fim_comparacao   	# Se t3 = 0 --> chegamos ao final da segunda string
    	bne t2, t3, proximo_caractere  	# Se t1 != t2 --> avança para os proximos caracteres das strings
    
    	addi t1, t1, 1 	# t1 = t1 + 1 (aumentando o contador)
    
proximo_caractere:
    	# Avanca para os proximos caracteres das strings
    	addi a0, a0, 1	# a0++
    	addi a1, a1, 1	# a1++
    	
    	j loop		# volta para o loop de comparacao dos próximos caracteres
    
fim_comparacao:
    	mv a0, t1	# a0 = t1 (numero de caracteres iguais)
    	li a7, 1        # syscall setada para escrever inteiro
    	ecall           # syscall para escrever o numero de caracteres iguais no terminal 
    
    	la a0 , fim 	# a0 = &fim ("\n")
	li a7 , 4	# syscall setada para escrever a string em a0 no terminal
	ecall		# syscall para pular linha
    
    
    		

	
	
		
	
	
	
	
