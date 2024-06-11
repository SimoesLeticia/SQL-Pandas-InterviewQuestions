# Desafios - Nível: Difícil

## Índice

1. [Desafio: Média móvel para transações bancárias](#desafio-01-média-móvel-para-transações-bancárias)
2. [Desafio: Sobreposição de assinaturas](#desafio-02-sobreposição-de-assinaturas)
3. [Desafio: Rotas de voo](#desafio-03-rotas-de-voo)
4. [Desafio: Promoções cruzadas](#desafio-04-promoções-cruzadas)
5. [Desafio: Primeira conversão por usuário](#desafio-05-primeira-conversão-por-usuário)


### Desafio 01. Média móvel para transações bancárias

Dada uma tabela de transações bancárias com três colunas:  `id`, `data_criacao` e `valor_transacao` (com valores positivos indicando **depósitos** e valores negativos indicando **retiradas**). Escreva uma consulta SQL para calcular a média móvel de três dias para os depósitos.

_Observações:_
- Em estatística, a média móvel é utilizada para identificar tendências em dados de séries temporais, como aqueles encontrados em transações financeiras. 
- Na saída, o campo data deve ser formatado no padrão dd/mm/yyyy.

**Entradas:**

**Tabela: `transacoes_bancarias`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| data_criacao    | datetime |
| valor_transacao | float    |

**Saída:**

| Column_name    | Type  |
| -------------- | ----- |
| data_transacao | date  |
| media_movel    | float |

### Desafio 02. Sobreposição de assinaturas

Dada uma tabela de assinaturas de serviços. Escreva uma consulta SQL para determinar se cada usuário tem um intervalo de datas de assinatura que se sobrepõe a qualquer outra assinatura concluída. Considere retornar 0 para falso e 1 para verdadeiro. 

_Observações:_
- As assinaturas concluídas são aquelas com a data de término registrada.

**Entradas:**

**Tabela: `assinaturas`**

| Column_name     | Type |
| --------------- | ---- |
| usuario_id      | int  |
| data_inicio     | date |
| data_termino    | date |

**Saída:**

| Column_name    | Type  |
| -------------- | ----- |
| usuario_id     | int   |
| sobreposicao   | int   |

### Desafio 03. Rotas de voo

Escreva uma consulta SQL para selecionar todas as rotas de voos possíveis, isto é, que mostre pares únicos de duas localidades.

_Observações:_
- Pares duplicados da tabela de `voos`, como São Paulo para Rio de Janeiro e Rio de Janeiro para São Paulo, devem ter apenas uma entrada no resultado da consulta.
- Considere como localidades as colunas `local_origem` e `local_destino`.

**Entradas:**

**Tabela: `voos`**

| Column_name       | Type    |
| ----------------- | ------- |
| id                | int     |
| aeroporto_origem  | varchar |
| loca_origem       | varchar |
| aeroporto_destino | varchar |
| local_destino     | varchar |

**Saída:**

| Column_name    | Type    |
| -------------- | ------- |
| localidade_01  | varchar |
| localidade_02  | varchar |

### Desafio 04. Promoções cruzadas

Cross Merchandising, ou promoções cruzadas, é uma estratégia que consiste em posicionar produtos de diferentes categorias lado a lado a fim de impulsionar as vendas. Para explorar esse conceito, escreva uma consulta SQL que identifique os produtos frequentemente adquiridos juntos pelo mesmo usuário, como vinho e abridores de garrafa, batatas fritas e cerveja, entre outros. O resultado da consulta deve retornar as cinco principais combinações de produtos, ordenadas alfabeticamente pelo nome do primeiro produto.

_Observações:_
- Na saída a coluna `quantidade` indica quantas vezes esses produtos foram adquiridos juntos.
- Considere apenas pedidos realizados a partir de 2022.

**Tabela: `pedidos`**

| Column_name     | Type     |
| --------------- | -------- |
| id              | int      |
| usuario_id      | int      |
| data_criacao    | datetime |
| produto_id      | int      |
| quantidade      | int      |

**Tabela: `produtos`**

| Column_name  | Type     |
| ------------ | -------- |
| id           | int      |
| nome         | varchar  |
| preco        | float    |

**Saída:**

| Column_name | Type    |
| ----------- | ------- |
| produto_01  | varchar |
| produto_02  | varchar |
| quantidade  | int     |

### Desafio 05. Primeira conversão por usuário

O modelo a seguir representa um e-commerce e é composto por duas tabelas.

- **`atribuicoes`**: Cada linha representa uma visita ao site, esta visita é chamada de sessão. Se a coluna conversão for verdadeira, significa que o usuário realizou uma compra nesta sessão.
- **`usuarios_sessoes`**: Cada linha representa uma sessão iniciada pelo usuário.

A _primeira interação_ é definida como o canal pelo qual o usuário se identificou quando descobriu o site pela primeira vez. Escreva uma consulta SQL que calcule a atribuição da primeira interação para cada usuário que realizou uma conversão.

_Observações:_
- Para a coluna `conversao`, 1 representa verdadeiro e 0 representa falso.

**Tabela: `atribuicoes`**

| Column_name     | Type     |
| --------------- | -------- |
| sessao_id       | int      |
| canal           | varchar  |
| conversao       | bit      |

**Tabela: `usuarios_sessoes`**

| Column_name  | Type     |
| ------------ | -------- |
| sessao_id    | int      |
| usuario_id   | int      |
| data_criacao | datetime |

**Saída:**

| Column_name | Type    |
| ----------- | ------- |
| usuario_id  | int     |
| canal       | varchar |