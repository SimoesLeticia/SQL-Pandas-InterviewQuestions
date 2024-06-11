# Desafios - Nível: Fácil

## Índice

1. [Desafio: Segundo maior salário](#desafio-01-segundo-maior-salário)
2. [Desafio: Localizações vazias](#desafio-02-localizações-vazias)
3. [Desafio: Última transação bancária](#desafio-03-última-transação-bancária)
4. [Desafio: Distância percorrida](#desafio-04-distância-percorrida)
5. [Desafio: Tamanhos das Equipes dos Gerentes](#desafio-05-tamanhos-das-equipes-dos-gerentes)

### Desafio 01. Segundo maior salário

Escreva uma consulta SQL para selecionar o segundo maior salário no departamento de Engenharia.

_Observações:_ 
- Se mais de uma pessoa tiver o maior salário, a consulta deve selecionar o próximo salário mais alto.

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

| Column_name | Type |
| ----------- | ---- |
| salario     | int  |

### Desafio 02. Localizações vazias

Escreva uma consulta SQL que retorne todas as localizações que possuem 0 usuários. Ou seja, localizações que não possuem usuários vinculados.

**Entradas:**

**Tabela: `usuarios`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| nome            | varchar  |
| data_criacao    | datetime |
| localizacao_id  | int      |
| email           | varchar  |

**Tabela: `localizacoes`**

| Column_name | Type    |
| ----------- | ------- |
| id          | int     |
| nome        | varchar |
| cidade_id   | int     |

**Saída:**

| Column_name | Type    |
| ----------- | ------- |
| nome        | varchar |

### Desafio 03. Última transação bancária

Escreva uma consulta SQL para obter a última transação de cada dia de uma tabela de transações bancárias. O resultado desta consulta deve incluir o id da transação, a data e hora da transação e o valor da transação, ordenados por data e hora.

**Entradas:**

**Tabela: `transacoes_bancarias`**

| Column_name     | Type     |
| --------------- | -------  |
| id              | int      |
| data_criacao    | datetime |
| valor_transacao | float    |

**Saída:**

| Column_name     | Type     |
| --------------- | -------  |
| data_criacao    | datetime |
| valor_transacao | float    |
| id              | int      |

### Desafio 04. Distância percorrida

Escreva uma consulta SQL que retorne a distância percorrida por cada usuário, ordenada de forma decrescente.

**Entradas:**

**Tabela: `usuarios`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| nome            | varchar  |
| data_criacao    | datetime |
| localizacao_id  | int      |
| email           | varchar  |

**Tabela: `viagens`**

| Column_name           | Type     |
| --------------------- | -------- |
| id                    | int      |
| passageiro_usuario_id | int      |
| distancia             | float    |

**Saída:**

| Column_name          | Type    |
| ---------------------| ------- |
| nome                 | varchar | 
| distancia_percorrida | float   |

### Desafio 05. Tamanhos das Equipes dos Gerentes

Escreva uma consulta SQL que retorne qual gerente lidera a equipe com o maior número de membros.

_Observações:_ 
- Suponha que haja apenas um gerente cuja equipe seja a maior

**Entradas:**

**Tabela: `funcionarios_equipes`**

| Column_name    | Type    |
| -------------- | ------- |
| id             | int     |
| nome           | varchar |
| gerente_id     | int     |

**Tabela: `gerentes`**

| Column_name | Type    |
| ------------| ------- |
| id          | int     |
| nome        | varchar |
| equipe      | varchar |

**Saída:**

| Column_name    | Type    |
| -------------- | ------- |
| nome_gerente   | varchar |
| tamanho_equipe | int     |