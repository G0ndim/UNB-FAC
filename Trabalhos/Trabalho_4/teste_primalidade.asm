.data
	sim: .string	"sim"
	nao: .string	"nao"
	invalida: .string "Entrada invalida."
	final: .string	"\n"
.text
main:
	li a7, 5	# syscall setada para ler um inteiro 
	ecall		# syscall para ler o numero a ser testado
	mv t0, a0	# to = a0
	li t1, 1	# t1 = 1
	blt t0, t1, entrada_invalida # if(input <= 0) --> entrada invalida
	beq t0, t1, nao_primo # if(input == 1) --> nao_primo
	li t1, 2	# t1 = 2  --> counter para o loop inicializado em 2 (int i = 2)
loop:	
	# for(int i = 2; i < input; i++) {if(input % i == 0) --> nao primo; else --> primo}
	bge t1, t0, done # if(i >= input)  --> sai do loop
	rem t3, t0, t1	# t3 = input % i
	beqz t3, nao_primo # if(input % i == 0)  --> nao primo
	addi t1, t1, 1	# i++
	j loop
nao_primo:
	la a0, nao	# resposta = "nao"
	j fim		# vai para o fim do codigo
entrada_invalida:
	la a0, invalida	# resposta = "Entrada invalida."
	j fim		# vai para o fim do codigo
done:
	la a0, sim	# resposta = "sim"
fim:
	li a7, 4	# syscall setada para inprimir uma string
	ecall		# imprime a resposta
	la a0, final	# a0 = "\n"
	ecall		# "\n"
	