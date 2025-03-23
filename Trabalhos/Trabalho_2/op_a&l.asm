.data
	_ADD:	.string "ADD: "
	_SUB:	.string	"SUB: "
	_AND:	.string	"AND: "
	_OR:	.string	"OR: "
	_XOR:	.string	"XOR: "
	_MASK:	.string	"MASK: "
	_SLL:	.string	"SLL("
	_SRL: 	.string "SRL("
	_SF:	.string "): "	
	fim:	.string	"\n"
.text
main:
	# Entrada dos inteiros
	li a7, 5	# syscall_flag = 5 (ler um inteiro)
	ecall		# syscall para ler um inteiro e salva-lo em a0
	mv t0, a0	# t0 = a0 (entrada A)
	li a7, 5	# syscall_flag = 5 (ler um inteiro)
	ecall		# syscall para ler um inteiro e salva-lo em a0
	mv t1, a0	# t1 = a0 (entrada B)
	li a7, 5	# syscall_flag = 5 (ler um inteiro)
	ecall		# syscall para ler um inteiro e salva-lo em a0
	mv t2, a0	# t2 = a0 (entrada C)
	
	# ADD A, B
	la a0, _ADD	# a0 = &_ADD	-->	"ADD: "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	add a0, t0, t1	# a0 = t0 + t1
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, fim	# a0 = &fim
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# SUB A, B
	la a0, _SUB	# a0 = &_SUB	-->	"SUB: "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	sub a0, t0, t1	# a0 = t0 - t1
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, fim	# a0 = &fim	-->	"\n"
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# AND A, B
	la a0, _AND	# a0 = &_AND	-->	"AND: "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	and a0, t0, t1	# a0 = t0 & t1
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, fim	# a0 = &fim	-->	"\n"
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# OR A, B
	la a0, _OR	# a0 = &_OR	-->	"OR: "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	or a0, t0, t1	# a0 = t0 | t1
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, fim	# a0 = &fim	-->	"\n"
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# XOR A, B
	la a0, _XOR	# a0 = &_XOR	-->	"XOR: "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	xor a0, t0, t1	# a0 = t0 ^ t1
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, fim	# a0 = &fim	-->	"\n"
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# MASK C, 31
	la a0, _MASK	# a0 = &_MASK	-->	"MASK: "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	andi a0, t2, 31	# a0 = t2 & 31
	mv t3, a0	# t3 = a0 (SALVA A MASCARA EM T3)
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, fim	# a0 = &fim	-->	"\n"
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# SLL(MASK) A
	la a0, _SLL	# a0 = &_SLL	-->	"SLL("
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever a string alocada em a0
	mv a0, t3	# a0 = t3	-->	"%d", mask
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, _SF	# a0 = &_SF	-->	"): "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	sll a0, t0, t3	# a0 = t0 << t3
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro em a0
	la a0, fim	# a0 = &fim	-->	"\n"
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# SRL(MASK) B
	la a0, _SRL	# a0 = &_SRL	-->	"SRL("
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever a string alocada em a0
	mv a0, t3	# a0 = t3	-->	"%d", mask
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro alocado em a0
	la a0, _SF	# a0 = &_SF	-->	"): "
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# sysacall para escrever a string alocada em a0
	srl a0, t1, t3	# a0 = t1 >> t3
	li a7, 1	# syscall_flag = 1 (escrever um inteiro)
	ecall		# syscall para escrever o inteiro em a0
	la a0, fim	# a0 = &fim	-->	"\n"
	li a7, 4	# syscall_flag = 4 (escrever uma string)
	ecall		# syscall para escrever uma quebra de linha
	
	# FIM
	la a0 , fim	# a0 = &fim	-->	"\n"
	li a7 , 4	# syscall_flag = 4 (escrever uma string)
	ecall		# chamada de sistema para escrever a string em a0
	li a7, 10	# syscall_flag = 10 (sair do programa retornando 0)
	ecall		# syscall para retornar 0
	
