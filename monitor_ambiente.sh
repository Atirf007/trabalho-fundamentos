#!/bin/sh  
# a linha acima declara o bin que executará o script

printf "Digite o nome do repositório que será utilizado para instalação:  "
read rep_choice

# read é como o 'scanf' em C, ele pode ser usado para receber valores de uma variável.


if [ -d "$rep_choice" ]; then
	if [ -x "$rep_choice" ] && [ -w "$rep_choice" ] && [ -r "$rep_choice" ]; then
	# Os comparadores verificam respectivamente se o o usuário logado tem permissão de executar, escrever e ler o arquivo selecionado.
		printf "\nSucesso! O usuário tem todas as opções necessárias.\n\n"
	else
		printf "Atenção! O usuário não tem todas as permissões necessárias.\n\n"
	fi

uso_porcentagem=$(df -h / | grep / | awk '{print $5}' | tr -d '%')
# df -h extraí dados detalhados de uso de armazenamento | grep / extraí dados da partição raiz | awk '{printf $5}' extraí dados da quinta coluna da linha selecionada, no caso a coluna 'use%' | tr -d '%' remove o símbolo de porcentagem na hora de atribuir um valor a variável, facilitando na hora de fazer comparações.

	if [ "$uso_porcentagem" -gt 90 ]; then
	# '-gt' aqui como comparador, a sigla significa "greater than", ou seja, "maior que".
		printf "Situação crítica! $uso_porcentagem%% de espaço do servidor ocupado.\n\n"	 

	elif [ "$uso_porcentagem" -gt 75 ]; then
		printf "Atenção! $uso_porcentagem%% de espaço do  servidor ocupado.\n\n"
	else
		printf "Situação ok! $uso_porcentagem%% de espaço do servidor ocupado.\n\n"
	fi	
       
else
    printf "\nErro! O diretório não existe.\n\n"
    exit 1
fi

