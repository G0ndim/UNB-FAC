.data
	fim:	.string	"\n"
.text
main:
	li a7, 5	# syscall_flag = 5 (ler um inteiro)
	ecall		# chamada de sistema para ler um inteiro e salva-lo em a0
	mv t0, a0	# t0 = a0	--> t0 = n (numero de entradas)
	li a7, 5	# syscall_flag = 5 (ler um inteiro)
	ecall		# chamada de sistema para ler um inteiro e salva-lo em a0
	mv t2, a0	# t2 = a0	--> t2 = resultado final (iniciado com a primeira entrada) 
	addi t0, t0, -1	# t0--
loop:
	li a7, 5	# flag da syscall setada para 5 (ler um inteiro)
	ecall		# chamada de sistema para ler um inteiro e salva-lo em a0
	mv t1, a0	# t1 = a0
	blt t2, t1, change_result # if(t2 < t1) --> result
	addi t0, t0, -1	# t0--
	beq t0, zero, end # if(t0 == 0) --> end
	j loop		# --> loop

# branch responsavel pela atualizacao do resultado final
change_result:
	mv t2, t1	# t2 = t1

# branch que atualiza o contador do loop no caso da atualizacao de resultado
sub_n:
	addi t0, t0, -1	# t0--
	bne t0, zero, loop # if(t0 != 0) --> loop

# branch que finaliza o codigo
end:
	li a7, 1	# flag da syscall setada para 1 (escrever inteiro)
	mv a0, t2	# a0 = t2	-->	a0 = resultado
	ecall		# chamada de sistema para escrever um inteiro registrado em a0
	
	la a0 , fim	# a0 = &fim	-->	"\n"
	li a7 , 4	# syscall_flag = 4 (escrever uma string)
	ecall		# chamada de sistema para escrever a string alocada em a0
	
	
	li a7, 10	# syscall_flag = 10 (sair do programa retornando 0)
	ecall		# syscall para return 0
	
