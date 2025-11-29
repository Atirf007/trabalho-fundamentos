#!/bin/sh  
# a linha acima declara o bin que executará o script
                          
echo "Digite qual repositório acessar: "
 read rep_choice

# read é como o 'scanf' em C, ele pode ser usado para receber valores de uma variável.

if [ -d "$rep_choice" ]; then
    printf "Sucesso! Diretório existe.\n"
    if [ -x "$rep_choice" ] && [ -w "$rep_choice" ] && [ -r "$rep_choice" ]; then
   	 echo "Sucesso! Você tem todas as permissões necessárias nesse diretório.\n"
     	uso_porcentagem=$(df -h / | grep / | awk '{print $5}' | tr -d '%')
	if [ "$uso_porcentagem" -gt 90 ]; then
		 printf "Situação crítica! Mais de 90% do espaço usado\n"
    elif [ "$uso_porcentagem" -gt 75 ]; then
	printf "Atenção! Mais de 75% de uso de memória\n"
    else
	printf "Memória em uso normal!\n"
    fi	



         else
       echo "Aviso! Você não tem todas as permissões necessárias nesse diretório."
    fi
       
else
    echo "Erro! O diretório não existe."
    exit 1
fi

