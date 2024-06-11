# Desafios - SQL e Pandas (Perguntas de Entrevista)
Este repositório é dedicado à prática e aprimoramento em SQL e Pandas através de desafios inspirados em perguntas de entrevistas, disponibilizados pelo site [Interview Query](https://www.interviewquery.com/). Os exercícios são categorizados por nível de dificuldade. 

O repositório também contém um arquivo com as **10 Perguntas de Entrevista mais comuns sobre Consultas SQL e SQL Server** e suas respostas.

## Índice
- [Como Funciona](#como-funciona)
- [Banco de Dados](#banco-de-dados)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Contribuições](#contribuições)
- [Referências](#referências)
  
## Como Funciona
- O repositório contém 15 desafios, organizados por nível de dificuldade: fácil, médio e difícil.
- Cada desafio possui uma descrição detalhada, disponível no diretório `descricoes`.
- Os desafios utilizam a base de dados **PraticasBD**, desenvolvida especificamente para este propósito. O SGBD utilizado é o **SQL Server**.
- Para cada desafio, são fornecidas duas soluções:
  - Uma **consulta SQL** para execução no SQL Server.
  - Uma implementação em **Python**, utilizando a biblioteca **Pandas**.

## Banco de Dados
- O backup do banco de dados usado nos desafios está disponível no diretório `data`, com o nome **`PraticasBD.bak`**. Para restaurá-lo no SQL Server, siga o passo a passo [neste link](https://learn.microsoft.com/pt-br/sql/relational-databases/backup-restore/quickstart-backup-restore-database?view=sql-server-ver16&tabs=ssms).
- Se encontrar dificuldades para restaurar o backup, o diretório também contém o arquivo **`PraticasBD_esquemas.sql`** com o esquema completo de criação do banco de dados.
- Além disso, os dados de todas as tabelas estão disponíveis em formato `.csv` no diretório `data/csvs` para quem desejar praticar apenas os desafios em Python.
- Existe um módulo chamado `funcoesconexao` responsável pela conexão e rotinas de interação com o banco. Este módulo é utilizado nos notebooks para facilitar o acesso aos dados. Caso opte por importar os dados diretamente dos arquivos `.csv`, você pode ignorar ou remover as células relacionadas a este módulo. No entanto, se preferir extrair os dados do banco, será necessário modificar o código no arquivo `funcoesconexao.py` conforme indicado abaixo:
```python
def conectar_bd():
    # Substitua 'server', 'username' e 'password' pelas suas credenciais
    dados_conexao = (
        "Driver={SQL Server};"
        "Server=server;"
        "Database=PraticasBD;"
        "UID=username;"
        "PWD=password"
    )
```

## Estrutura do Repositório
```
SQL-Pandas-InterviewQuestions/
├── data/
│   ├── PraticasBD.bak               # Backup do banco usado nos desafios
│   ├── PraticasBD_esquemas.sql      # Esquemas do banco de dados
│   └── .csvs/                       # Contém todas as tabelas do banco no formato .csv
├── notebooks/
│   ├── 01_facil/                    # Resolução dos desafios de nível fácil em Python
│   ├── 02_medio/                    # Resolução dos desafios de nível médio em Python
│   └── 03_dificil/                  # Resolução dos desafios de nível difícil em Python
├── scripts/
│   ├── 01_facil/                    # Resolução dos desafios de nível fácil em SQL
│   ├── 02_medio/                    # Resolução dos desafios de nível médio em SQL
│   └── 03_dificil/                  # Resolução dos desafios de nível difícil em SQL
└── descricoes/                      # Descrições detalhadas dos desafios + 10 Perguntas de Entrevista
```

## Contribuições
Contribuições são sempre bem-vindas! Se você tem sugestões de melhorias, encontrou algum bug ou simplesmente quer dizer "olá 👋🏽", sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Referências
- [Interview Query](https://www.interviewquery.com)
- [41 Essential SQL Interview Questions](https://www.toptal.com/sql/interview-questions)
- [SQL Server Common Questions](https://www.indiabix.com/technical/sql-server-common-questions)
- [SQL Server General Questions](https://www.indiabix.com/technical/sql-server-general-questions)
- [SQL Interview Questions](https://www.tutorialspoint.com/sql/sql_interview_questions.htm)

**Divirta-se resolvendo os desafios!** 🚀👩🏽‍💻
