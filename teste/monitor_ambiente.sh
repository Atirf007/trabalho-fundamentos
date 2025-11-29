#!/bin/sh  
# a linha acima declara o bin que executará o script
                          
echo "Digite qual repositório acessar: "
 read rep_choice

# read é como o 'scanf' em C, ele pode ser usado para receber valores de uma variável.

if [ -d "$rep_choice" ]; then
    echo "Sucesso! Diretório existe."
    if [ -x "$rep_choice" ] & [ -w "$rep_choice" ] & [ -r "$rep_choice" ]; then
   	 echo "Sucesso! Você tem todas as permissões necessárias nesse diretório."
     	df -h / | grep / | awk '{print $5}' | tr -d '%' = uso_porcentagem
	if [ Uso_porcentagem > 90]; then
		 echo "Situação crítica! Mais de 90% do espaço usado"
    elif [ Uso_porcentagem > 75]; then
	echo "Atenção! Mais de 75% de uso de memória"
    else
	echo "Memória em uso normal!"
    fi	



         else
       echo "Aviso! Você não tem todas as permissões necessárias nesse diretório."
    fi
       
else
    echo "Erro! O diretório não existe."
    exit 1
fi

