.data
	input1:	.string	"\n"
.text
main:
	# lendo o primeiro inteiro
	li a7, 5	# flag da syscall setada para 5 (ler um inteiro)
	ecall		# chamada de sistema para ler um inteiro e salva-lo em a0
	mv t0, a0	# t0 = a0
	
	# lendo o segundo inteiro
	li a7, 5	# flag da syscall setada para 5 (ler um inteiro)
	ecall		# chamada de sistema para ler um inteiro e salva-lo em a0
	mv t1, a0	# t1 = a0
	
	# somando os dois inteiros
	add t2, t0, t1	# t2 = t0 + t1
	li a7, 1	# flag da syscall setada para 1 (escrever um inteiro)
	mv a0, t2	# a0 = t2
	ecall		# chamada de sistema para escrever um inteiro em a0
	
	la a0 , input1	# a0 = &input1
	li a7 , 4	# flag da syscall setada para escrever uma string
	ecall		# chamada de sistema para escrever a string em a0
	
	li a0 ,0	# a0 = 0
	li a7 , 93	# flag de syscall setada para sair do programa com o codigo em a0
	ecall		# return 0