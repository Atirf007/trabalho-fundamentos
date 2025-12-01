#!/bin/bash  
# a linha acima declara o bin que executará o script
start=$(date +%s)
#estou atribuindo o resultado numérico do parenteses para a variável start que é o tempo em seg desde a Unix Epoch(muito tempo)

printf "Digite o nome do diretório que será utilizado para instalação:  "
read rep_choice

# read é como o 'scanf' em C, ele pode ser usado para receber valores de uma variável.


if [ -d "$rep_choice" ]; then
	if [ -x "$rep_choice" ] && [ -w "$rep_choice" ] && [ -r "$rep_choice" ]; then
	# Os comparadores verificam respectivamente se o o usuário logado tem permissão de executar, escrever e ler o arquivo selecionado.
		printf "\nSucesso! O usuário tem todas as permissões necessárias.\n\n"
	else
		printf "Atenção! O usuário não tem todas as permissões necessárias.\n\n"
	fi

	printf "Tamanho total do diretório $rep_choice: "  
du -sh "$rep_choice" 2>/dev/null | awk '{print $1}'  
printf "\n"
#du é disk usage vendo quanto espaço o dir ocupa em disco, 2> manda os possíveis erros para dev/null sem exibi-los, prep envia a saída de du para awk e awk faz parecido com grep, mas mais robusto.
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
       
	numProcessos=$(ps aux --no-headers | wc -l)

	printf "\nAtualmente há $numProcessos processos sendo executados\n\n"

	printf "Processos que mais consomem memória: \n"

	for i in {1..5}
	do
		printf "$i |"
		ps -e -o pid,comm --sort=-%mem --no-headers|awk -v i=$i 'NR==i{print; exit}'
	done

	printf "\n"

else
    printf "\nErro! O diretório não existe.\n\n"
    exit 1
fi

end=$(date +%s)
#a end agora recebe a mesma coisa que a start, mas acrescido os segundos desde que a start foi acionada

echo "Tempo total: $((end - start)) segundos"

#Mostra o tempo total tirando da end o que tinha na start
