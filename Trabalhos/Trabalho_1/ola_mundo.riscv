
.data	
	output: .string "Ola Mundo\n" # char output[] = "Ola Mundo\n" (aloca espaco na memoria ram para a string)
.text 	
main:
	la	a0, output	# a0 = &output (coloca o endereco de output em a0)
	li	a7, 4	# a7 = 4 -> instrucao 4 utilizada como flag na chamada de sitema do rars
	ecall	# chamada de sistema que recebe a intrucao do a7, imprimir na tela uma string
	li	a7, 10	# a7 = 10 -> instrucao 10 utilizada como flag na chamada de sitema do rars
	ecall	#chamada de sistema para retornar 0 e finalizar o programa
 