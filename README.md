 #📊 Análise de Cancelamentos - E-commerce Olist

 #📌 Para que serve este projeto?

Este projeto tem como objetivo analisar os cancelamentos de pedidos em uma base de dados de e-commerce.

A análise busca identificar quais lojas, produtos, categorias e estados concentram a maior quantidade de cancelamentos, gerando informações que podem auxiliar na tomada de decisão do negócio.

---

# 📊 Análise Descritiva — O que aconteceu?

Nesta etapa, o objetivo foi entender o cenário dos cancelamentos e identificar onde eles estão concentrados.

Foram analisados:

* As 15 lojas com maior quantidade de cancelamentos;
* Os produtos e categorias com maior número de cancelamentos;
* Os estados com maior quantidade de cancelamentos.

---

## 🏪 Lojas com maior concentração de cancelamentos

### Objetivo da análise:

Identificar quais lojas possuem a maior quantidade de pedidos cancelados.

### Código SQL:

SELECT
    v.id_vendedor,
    COUNT(Distinct p.id_pedido) AS total_cancelados
FROM vendedores v
INNER JOIN itens_pedido ip
    ON ip.id_vendedor = v.id_vendedor
INNER JOIN pedidos p
    ON p.id_pedido = ip.id_pedido
WHERE p.status_pedido = 'canceled'
GROUP BY v.id_vendedor
order by  total_cancelados desc
limit 15; 

### Resultado:

📌 Inserir print da consulta ou gráfico aqui.

---

## 📦 Produtos e categorias com maior número de cancelamentos

### Objetivo da análise:

Identificar quais produtos e categorias possuem maior concentração de cancelamentos.

### Código SQL:

SELECT pro.nome_categoria_produto,
	COUNT(Distinct p.id_pedido) As qtd_total_cancelados
FROM itens_pedido itens 
INNER JOIN produtos pro 
	ON itens.id_produto=pro.id_produto
INNER JOIN pedidos p
	ON itens.id_pedido=p.id_pedido
WHERE status_pedido ='canceled' 	
GROUP BY pro.nome_categoria_produto,
		itens.id_produto 
ORDER BY qtd_total_cancelados desc		
LIMIT 15 ;

### Resultado:

📌 Inserir print da consulta ou gráfico aqui.

---

## 🌎 Estados com maior quantidade de cancelamentos

### Objetivo da análise:

Identificar quais estados apresentam maior quantidade de pedidos cancelados.

### Código SQL:

SELECT v.estado_vendedor,
	COUNT(Distinct p.id_pedido)AS qtd_cancelados
FROM itens_pedido itens
INNER JOIN vendedores v
	on itens.id_vendedor=v.id_vendedor
INNER JOIN pedidos p 
	ON itens.id_pedido=p.id_pedido
WHERE status_pedido = 'canceled'
GROUP BY estado_vendedor
ORDER BY qtd_cancelados desc

### Resultado:

📌 Inserir print da consulta ou gráfico aqui.

---

# 💡 Análise Prescritiva — O que pode ser feito?

Com base nos resultados encontrados, algumas ações podem ser avaliadas:

* Verificar os produtos com maiores índices de cancelamento;
* Avaliar as lojas e estados com maior concentração de cancelamentos;
* Buscar entender os motivos dos cancelamentos nessas regiões;
* Criar estratégias para reduzir cancelamentos e melhorar a experiência do cliente.

---

# 🗂️ Sobre os dados utilizados

Os dados utilizados pertencem à base pública Olist.

Foram utilizadas informações de:

* **Pedidos:** informações das compras realizadas e seus status;
* **Vendedores:** cadastro das lojas que realizaram as vendas;
* **Produtos:** informações dos produtos e suas categorias;
* **Itens do pedido:** relação entre pedidos e produtos vendidos.

---

# 🛠️ Tecnologias utilizadas

* PostgreSQL
* SQL
* GitHub

---

# 📚 Conceitos aplicados

* SELECT → seleção dos dados;
* JOIN → ligação entre tabelas relacionadas;
* WHERE → filtro dos dados;
* GROUP BY → agrupamento das informações;
* COUNT → contagem dos registros;
* ORDER BY → organização dos resultados.

---

# 📌 Conclusão

A análise permitiu identificar os principais pontos de concentração dos cancelamentos, mostrando quais lojas, produtos, categorias e estados precisam de maior atenção.

Essas informações podem auxiliar na busca por melhorias e estratégias para reduzir cancelamentos.
