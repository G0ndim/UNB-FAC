.data
	invalida: .string "Entrada invalida."
	final:	.string "\n"
.text
main:
	li a7, 5	# syscall setada para ler um inteiro 
	ecall		# syscall para ler o numero a ser testado
	mv t0, a0	# to = a0  --> entrada "a"
	mv a2, t0
	ecall		
	mv t1, a0	# t1 = a0  --> entrada "b"
	mv a3, t1
	li t2, 2	# t2 = 1
	blt t0, t2, entrada_invalida # if(a <= 1) --> entrada invalida
	blt t1, t2, entrada_invalida # if(b <= 1) --> entrada invalida
while_MDC:
	# loop para calcular o MDC
	beqz t1, done	# if(b == 0) --> termina o loop
	mv t3, t1	# temp = b
	rem t1, t0, t1	# b = a % b
	mv t0, t3	# a = temp
	j while_MDC
done:
	# o resultado do MDC esta em t0 (entrada "a")
	# calculo do MMC
	mul t4, a2, a3	# t4 = a * b
	div t4, t4, t0	# t4 = (a * b) / MDC
	# o resultado do MMC esta em t4
	j entrada_valida
entrada_invalida:
	la a0, invalida
	li a7, 4
	ecall
	j fim
entrada_valida:
	li a7, 1	# syscall setada para imprimir um inteiro
	mv a0, t0	# a0 = MDC
	ecall		# syscall para imprimir o MDC
	la a0, final	# a0 = "\n"
	li a7, 4	# syscall setada para imprimir string
	ecall		# syscall para inprimir uma quebra de linha
	li a7, 1	# syscall setada para imprimir um inteiro
	mv a0, t4	# a0 = MMC
	ecall 		# syscall para imprimir MMC
fim:
	la a0, final	# a0 = "\n"
	li a7, 4	# syscall setada para imprimir string
	ecall		# syscall para inprimir uma quebra de linha
	
	
	
	
	
	
	