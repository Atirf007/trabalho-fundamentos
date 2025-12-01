# trabalho-fundamentos

### Aviso: Usei IA para fazer o README, mas o código nós fizemos manualmente. Só verificar o histórico de commit

## 📋 Descrição do Projeto

Este projeto implementa um script de **monitoramento de ambiente** desenvolvido em Bash que fornece informações essenciais sobre o estado do sistema operacional, incluindo:

- Permissões e acesso a diretórios
- Uso de espaço em disco
- Processos em execução
- Consumo de memória

## 🚀 Funcionalidades

O script `monitor_ambiente.sh` executa as seguintes análises:

### 1. **Validação de Diretório**
- Solicita ao usuário o caminho de um diretório
- Verifica se o diretório existe
- Valida permissões de execução, escrita e leitura

### 2. **Análise de Espaço em Disco**
- Calcula o tamanho total do diretório selecionado
- Exibe o percentual de uso do espaço do servidor
- Fornece alertas baseados em níveis de ocupação:
  - ✅ **OK**: Menos de 75% ocupado
  - ⚠️ **Atenção**: Entre 75% e 90% ocupado
  - 🔴 **Crítico**: Acima de 90% ocupado

### 3. **Monitoramento de Processos**
- Conta o número total de processos em execução
- Lista os 5 processos que mais consomem memória RAM
- Exibe PID e nome do comando para cada processo

## 📋 Pré-requisitos

- Sistema operacional: Linux/Unix
- Shell: Bash
- Ferramentas disponíveis: `date`, `du`, `df`, `ps`, `awk`, `grep`, `tr`, `wc`

## 💻 Como Usar

1. **Conceder permissão de execução:**
   ```bash
   chmod +x monitor_ambiente.sh
   ```

2. **Executar o script:**
   ```bash
   ./monitor_ambiente.sh
   ```

3. **Inserir o diretório:** Quando solicitado, digite o caminho do diretório desejado (ex: `/home`, `/var`, etc.)

## 📁 Estrutura do Projeto

```
trabalho-fundamentos/
├── README.md                  # Este arquivo
├── monitor_ambiente.sh        # Script principal de monitoramento
└── teste/                     # Diretório para testes
```

## 🔧 Conceitos Técnicos Utilizados

- **Variáveis de Ambiente**: Captura de tempo do sistema e dados de sistema
- **Condicionais**: Verificação de permissões e limiares de uso
- **Pipelines**: Encadeamento de comandos com `|`
- **Loops**: Iteração para listar processos
- **Redirecionamento**: Tratamento de erros com `2>/dev/null`

## 📊 Exemplo de Saída

```
Digite o nome do diretório que será utilizado para instalação: /home

Sucesso! O usuário tem todas as permissões necessárias.

Tamanho total do diretório /home: 125G

Situação ok! 65% de espaço do servidor ocupado.

Atualmente há 248 processos sendo executados

Processos que mais consomem memória: 
1 |2841 firefox
2 |3102 chrome
3 |1945 java
4 |2156 python
5 |1678 node
```

## 📝 Notas Técnicas

- O script utiliza comandos Unix/Linux padrão para máxima compatibilidade
- Tratamento de erros implementado para evitar exibição de mensagens de erro desnecessárias
- Uso de `awk` para processamento de texto avançado
- Formatação de saída com `printf` para melhor controle

## 👨‍💻 Autores

- Gabriel Rosa
- Gustavo Breder
- Pedro Féola

