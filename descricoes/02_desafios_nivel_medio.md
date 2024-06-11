# Desafios - Nível: Médio

## Índice

1. [Desafio: Histograma de comentários](#desafio-01-histograma-de-comentários)
2. [Desafio: Salários dos funcionários](#desafio-02-salários-dos-funcionários)
3. [Desafio: Estudantes com pontuações mais próximas](#desafio-03-estudantes-com-pontuações-mais-próximas)
4. [Desafio: Pedidos de usuários](#desafio-04-pedidos-de-usuários)
5. [Desafio: Três maiores salários por departamento](#desafio-05-três-maiores-salários-por-departamento)

### Desafio 01. Histograma de comentários

Escreva uma consulta SQL para gerar um histograma representando o número de comentários por usuário durante o mês de janeiro de 2020.

_Observações:_
- Considere que os intervalos dos bins são de um.
- Os comentários feitos fora do período de janeiro de 2020 devem ser incluídos em um bucket designado como "0".

**Entradas:**

**Tabela: `usuarios`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| nome            | varchar  |
| data_criacao    | datetime |
| localizacao_id  | int      |
| email           | varchar  |

**Tabela: `comentarios`**

| Column_name     | Type     |
| --------------- | -------- |
| usuario_id      | int      |
| corpo           | varchar  |
| data_criacao    | datetime |

**Saída:**

| Column_name            | Type |
| ---------------------- | ---- |
| quantidade_comentarios | int  |
| frequencia             | int  |

### Desafio 02. Salários dos funcionários

Escreva uma consulta SQL para selecionar os três departamentos com pelo menos três funcionários e classifique-os conforme a porcentagem de funcionários que recebem salários superiores a 4 mil.

**Entradas:**

**Tabela: `funcionarios`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| nome            | varchar  |
| sobrenome       | varchar  |
| salario         | int      |
| departamento_id | int      |

**Tabela: `departamentos`**

| Column_name | Type    |
| ----------- | ------- |
| id          | int     |
| nome        | varchar |

**Saída:**

| Column_name             | Type    |
| ----------------------- | ------- |
| porcentagem_acima_4000  | float   |
| departamento_nome       | varchar |
| quantidade_funcionarios | int     |

### Desafio 03. Estudantes com pontuações mais próximas

Escreva uma consulta SQL para identificar os dois estudantes com as pontuações mais próximas no ENEM. A consulta deve retornar os nomes dos estudantes e a diferença entre suas pontuações.

_Observações:_
- Se houver vários estudantes com a mesma pontuação mínima, selecione a combinação de nomes alfabeticamente mais próxima.

**Entradas:**

**Tabela: `pontuacoes`**

| Column_name | Type    |
| ----------- | ------- |
| id          | int     |
| estudante   | varchar |
| pontuacao   | int     |

**Saída:**

| Column_name         | Type    |
| ------------------- | ------- |
| estudante_1         | varchar |
| estudante_2         | varchar |
| pontuacao_diferenca | varchar |

### Desafio 04. Pedidos de usuários

Escreva uma consulta SQL para identificar os usuários que realizaram mais de três pedidos nos anos de 2019 e 2020 simultaneamente.

**Entradas:**

**Tabela: `usuarios`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| nome            | varchar  |
| data_criacao    | datetime |
| localizacao_id  | int      |
| email           | varchar  |

**Tabela: `pedidos`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| usuario_id      | int      |
| data_criacao    | datetime |
| produto_id      | int      |
| quantidade      | int      |

**Saída:**

| Column_name  | Type    |
| -------------| ------- |
| usuario_nome | varchar |

### Desafio 05. Três maiores salários por departamento

Escreva uma consulta SQL para obter os três maiores salários de funcionários por departamento. Caso um departamento tenha menos de três funcionários, a consulta deve listar os salários de todos os funcionários do departamento. A saída deve incluir o nome completo do funcionário, o nome do departamento e o salário do funcionário. O resultado deve ser ordenado pelo nome do departamento em ordem crescente e pelo salário em ordem decrescente.

_Observações:_
- Considere que cada departamento possui pelo menos um funcionário.

**Entradas:**

**Tabela: `funcionarios`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| nome            | varchar  |
| sobrenome       | varchar  |
| salario         | int      |
| departamento_id | int      |

**Tabela: `departamentos`**

| Column_name | Type    |
| ----------- | ------- |
| id          | int     |
| nome        | varchar |

**Saída:**

| Column_name       | Type    |
| ------------------| ------- |
| departamento_nome | varchar |
| salario           | int     |
| nome_funcionario  | varchar |