 # 📊 Análise de Cancelamentos - E-commerce Olist

 # 📌 Para que serve este projeto?

Este projeto tem como objetivo analisar os cancelamentos de pedidos em uma base de dados de e-commerce.

A análise busca identificar quais lojas, produtos, categorias e estados concentram a maior quantidade de cancelamentos, gerando informações que podem auxiliar na tomada de decisão do negócio.

---

## 📊 Análise Descritiva — O que aconteceu?

Nesta etapa, o objetivo foi entender o cenário dos cancelamentos e identificar onde eles estão concentrados.

  Foram analisados:

-  As 15 lojas com maior quantidade de cancelamentos;
-  Os produtos e categorias com maior número de cancelamentos;
-  Os estados com maior quantidade de cancelamentos.

---

## 🏪 Lojas com maior concentração de cancelamentos

### Objetivo da análise:

 identificar quais lojas possuem a maior quantidade de pedidos cancelados e qual o impacto financeiro de cada uma.

### Código SQL:

![código SQL](imagens/vendedor/Screenshot%202026-08-11%20230336.png)

### Resultado:

![Resultado](imagens/vendedor/Screenshot%202026-08-11%20230525.png)

### Insight: 

Entre as 15 lojas com maior número de cancelamentos, as duas primeiras se destacam por concentrar o maior impacto financeiro. O vendedor no topo do ranking está localizada em Barueri, São Paulo (ID finalizado em 753a), e merece atenção especial — recomenda-se uma análise mais aprofundada dos produtos , frete e vendedor .

---

## 📦 Produtos e categorias com maior número de cancelamentos

### Objetivo da análise:

Identificar quais produtos e categorias possuem maior concentração de cancelamentos e impacto financeiro .

### Código SQL:

![codigo SQL](imagens/produtos/Screenshot%202026-08-11%20233400.png)

### Resultado:

![produtos](imagens/produtos/Screenshot%202026-08-11%20233537.png)

### Insight:

Nem sempre os produtos com maior número de cancelamentos são os que apresentam maior impacto financeiro. Ou seja, volume de cancelamentos e impacto monetário não estão necessariamente correlacionados. A categoria que demanda maior atenção é a cool-stuff, por apresentar impacto financeiro relevante nos cancelamentos.

---

## 🌎 Estados com maior quantidade de cancelamentos

### Objetivo da análise:

Identificar os vendedores com maior quantidade de pedidos cancelados, considerando estado, cidade e impacto financeiro.

### Código SQL:

![estados](imagens/estados/Screenshot%202026-08-11%20235542.png)

### Resultado:

![estados](imagens/estados/Screenshot%202026-08-11%20235622.png)

### Insight:

As regiões com maior volume de cancelamentos estão concentradas no estado de São Paulo, especialmente nas cidades de Barueri e Sorocaba.

---

# 💡 Análise Prescritiva — O que pode ser feito?


## Com base nos resultados encontrados, algumas ações podem ser avaliadas:

- Investigar a loja de Barueri (ID final 753a) e as demais entre as duas primeiras do ranking, dado seu maior impacto          financeiro em cancelamentos; 
- Dar atenção especial à categoria cool-stuff, que concentra maior impacto financeiro nos cancelamentos; 
- Avaliar as lojas e estados com maior concentração de cancelamentos, com foco em São Paulo, Barueri e Sorocaba; 
- Investigar possíveis causas dos cancelamentos, como valor do frete, atrasos na entrega e problemas relacionados aos          produtos; 
- Criar estratégias para reduzir cancelamentos e melhorar a experiência do cliente.

---
# 🗂️ Sobre os dados utilizados

Os dados utilizados pertencem à base pública Olist.

Foram utilizadas informações de:

-  **Pedidos:** informações das compras realizadas e seus status;
-  **Vendedores:** cadastro das lojas que realizaram as vendas;
-  **Produtos:** informações dos produtos e suas categorias;
-  **Itens do pedido:** relação entre pedidos e produtos vendidos.

---

# 🛠️ Tecnologias utilizadas

 -  PostgreSQL
 -  SQL
 -  GitHub

---

# 📚 Conceitos aplicados

-  SELECT → seleção dos dados;
-  JOIN → ligação entre tabelas relacionadas;
-  SUBQUERY → cálculo intermediário usado como filtro (ex: ranquear e limitar as lojas antes de somar o valor);
-  WHERE → filtro dos dados;
- GROUP BY → agrupamento das informações;
- COUNT → contagem dos registros;
- ORDER BY → organização dos resultados.
  

---

# 📌 Conclusão

A análise permitiu identificar os principais pontos de concentração dos cancelamentos, mostrando quais lojas, produtos, categorias e estados precisam de maior atenção.

Essas informações podem auxiliar na busca por melhorias e estratégias para reduzir cancelamentos.
