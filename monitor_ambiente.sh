#!/bin/sh  
# a linha acima declara o bin que executará o script
                          
printf "Digite qual repositório acessar: "
 read rep_choice

# read é como o 'scanf' em C, ele pode ser usado para receber valores de uma variável.

if [ -d "$rep_choice" ]; then
	if [ -x "$rep_choice" ] && [ -w "$rep_choice" ] && [ -r "$rep_choice" ]; then
		printf "\nSucesso! O usuário tem todas as opções necessárias.\n\n"
	else
		printf "Atenção! O usuário não tem todas as permissões necessárias.\n\n"
	fi

uso_porcentagem=$(df -h / | grep / | awk '{print $5}' | tr -d '%')
	if [ "$uso_porcentagem" -gt 90 ]; then
		printf "Situação crítica! Mais de 90%% de espaço do servidor ocupado\n\n"	 
	elif [ "$uso_porcentagem" -gt 75 ]; then
		printf "Atenção! Mais de 75%% de espaço do  servidor ocupado\n\n"
	else
		printf "Situação normal! Menos de 75% de espaço do servidor ocupado!\n\n"
	fi	
       
else
    printf "Erro! O diretório não existe."
    exit 1
fi

