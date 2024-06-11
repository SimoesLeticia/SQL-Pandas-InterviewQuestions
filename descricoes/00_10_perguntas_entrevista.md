# 10 Perguntas de Entrevista mais comuns sobre Consultas SQL e SQL Server

**1. Qual é a diferença entre SQL, MySQL e SQL Server?**
>**SQL** *(Structured Query Language)* é uma linguagem usada para se comunicar com bancos de dados relacionais, permitindo a criação e manipulação do banco de dados. **MySQL** e **SQL Server** são sistemas de gerenciamento de banco de dados (*SGBDs*) que utilizam SQL como a linguagem padrão para operações em bancos de dados relacionais.

**2. Qual é a diferença entre SQL, PL/SQL e T-SQL?**
>**SQL** é a linguagem padrão para gerenciamento de bancos de dados, utilizada para realizar consultas e manipulação de dados.
>
>**PL/SQL** (*Procedural Language/Structured Query Language*) é uma extensão da linguagem padrão SQL desenvolvida pela *Oracle*, que incorpora elementos de programação procedural ao SQL.
>
>**T-SQL** (*Transact-SQL*) é a extensão da *Microsoft* para SQL, oferecendo recursos adicionais, como programação procedural semelhante ao PL/SQL, armazenamento de procedimentos, gatilhos e funções definidas pelo usuário, especialmente utilizados em ambientes do *Microsoft SQL Server* e *Azure SQL Database*.
>
>Resumidamente, SQL é a base para consultar e gerenciar bancos de dados relacionais, enquanto PL/SQL e T-SQL são extensões que possibilitam o desenvolvimento de aplicativos mais complexos, cada um dentro de seu respectivo ambiente.

**3. Qual é a diferença entre um índice clusterizado e um índice não clusterizado?**
>Os **índices clusterizados** ordenam e armazenam fisicamente os registros da tabela com base nos valores das colunas-chave definidas no índice. Já os **índices não clusterizados** possuem uma estrutura independente das linhas de dados, e a ordem lógica do índice não corresponde à ordem física das linhas no disco.
>
>Tanto os índices clusterizados quanto os não clusterizados podem ser exclusivos. Com um índice exclusivo, duas linhas não podem ter o mesmo valor para a chave do índice. 

**4. Quais são os comandos DML em SQL?**
>Os comandos **DML** (*Data Manipulation Language*) em SQL são utilizados para manipular os dados armazenados no banco. Esses são os principais comandos DML e seus propósitos:
>- `SELECT`: Recupera registros de uma ou mais tabelas com base em critérios especificados.
>- `INSERT`: Insere novos registros em uma tabela.
>- `UPDATE`: Modifica registros existentes em uma tabela.
>- `DELETE`: Remove registros de uma tabela.

**5. Quais são os comandos DDL em SQL?**
>Os comandos **DDL** (*Data Definition Language*) em SQL são usados para definir e gerenciar estruturas de banco de dados. Esses são os principais comandos DDL e seus propósitos:
>- `CREATE`: Cria novos objetos no banco de dados, como tabelas, visões (views) ou outros objetos.
>- `ALTER`: Modifica objetos já existentes no banco de dados, como adicionar ou alterar colunas em uma tabela.
>- `DROP`: Remove objetos do banco de dados, como tabelas ou visões, deletando-os completamente.

**6. Explique os diferentes tipos de cláusulas JOIN.**
>- `INNER JOIN`: Retorna apenas as linhas que têm correspondência em ambas as tabelas envolvidas. Se não houver correspondência, a linha não será incluída no resultado.
>- `LEFT JOIN`: Retorna todas as linhas da tabela à esquerda e as correspondências da tabela à direita. Se não houver correspondência, as colunas da tabela à direita serão preenchidas com NULL. Ou seja, os resultados terão todos os registros da tabela esquerda, mesmo que a condição JOIN não encontre nenhum registro correspondente na tabela direita.
>- `RIGHT JOIN`: É o contrário do LEFT JOIN, isso é, retorna todas as linhas da tabela à direita e as correspondências da tabela à esquerda. Se não houver correspondência, as colunas da tabela à esquerda serão preenchidas com NULL.
>- `FULL JOIN`: Retorna todas as linhas para as quais há uma correspondência em QUALQUER uma das tabelas. Inclui registros de ambas as tabelas, preenchendo com NULL onde não há correspondência.
>- `CROSS JOIN`: Retorna o produto cartesiano das duas tabelas, combinando cada linha da primeira tabela com cada linha da segunda tabela.

**7. O que faz a operação UNION? Qual é a diferença entre UNION e UNION ALL?**
>A operação `UNION` combina o conteúdo de duas consultas que retornam conjuntos de dados estruturalmente compatíveis em uma única tabela combinada. A principal diferença entre `UNION` e `UNION ALL` é que `UNION` remove registros duplicados, enquanto `UNION ALL` inclui todos os registros, inclusive os duplicados.
>
>Em termos de desempenho, `UNION ALL` geralmente é mais eficiente, pois não exige a remoção de duplicatas. Portanto, se você sabe que não há duplicatas nos conjuntos de dados ou se as duplicatas não são problemáticas, o uso de `UNION ALL` é recomendado por motivos de desempenho.

**8. Qual é a diferença entre as funções RANK() e DENSE_RANK()?**
>A diferença entre `RANK()` e `DENSE_RANK()` ocorre quando há casos de empates, ou seja, valores iguais em um conjunto de dados. Nesses casos, `RANK()` atribui classificações não consecutivas, criando lacunas nos valores inteiros de classificação. Já `DENSE_RANK()` atribui classificações consecutivas, sem lacunas.
>
>Por exemplo, considere o conjunto `{25, 25, 50, 75, 75, 100}`. Para este conjunto:
>- `RANK()` retornará `{1, 1, 3, 4, 4, 6}` (os valores 2 e 5 são ignorados devido aos empates).
>- `DENSE_RANK()` retornará `{1, 1, 2, 3, 3, 4}` (as classificações são consecutivas, sem lacunas).

**9. O que é um plano de execução? Quando e como usá-lo?**
>Um plano de execução é uma maneira simples do `Query Optimizer` calcular o caminho mais eficiente para implementar uma requisição. Um roteiro gráfico ou textual que mostra os métodos de recuperação de dados do `SQL Server` para uma consulta ou procedimento armazenado. Ele ajuda a entender e analisar o desempenho de consultas.
>
>No `Microsoft SQL Server`, o `Query Analyzer` possui uma opção chamada “Mostrar Plano de Execução” (localizada no menu suspenso Consulta). Se a opção estiver habilitada, ela mostrará os planos de execução da consulta em uma janela separada.

**10. Como encontrar registros duplicados em uma tabela?**
>Para identificar registros duplicados você pode usar consultas específicas dependendo de quantos campos deseja considerar:
>```sql
>- Registros duplicados com um campo -
>SELECT 
>	campo, 
>	COUNT(*)
>FROM 
>	tabela
>GROUP BY 
>	campo
>HAVING 
>	COUNT(*) > 1;
>```
>```sql
>- Registros duplicados com mais de um campo: -
>SELECT 
>	campo_1, 
>	campo_2, 
>	COUNT(*)
>FROM 
>	tabela
>GROUP BY 
>	campo_1, 
>	campo_2
>HAVING 
>	COUNT(*) > 1;
>```

