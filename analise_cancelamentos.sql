--Top 15 lojas com maior número de cancelamentos e impacto financeiro

SELECT 
	  lojas15.id_vendedor,
SUM(itens.preco) AS valor_cancelados
FROM itens_pedido itens
INNER JOIN pedidos p
   	ON p.id_pedido = itens.id_pedido
INNER JOIN
    	(SELECT v.id_vendedor,
        COUNT(DISTINCT p.id_pedido) AS total_cancelados
    	FROM vendedores v
    	INNER JOIN itens_pedido itens
       	 	ON itens.id_vendedor = v.id_vendedor
    	INNER JOIN pedidos p
       		ON p.id_pedido = itens.id_pedido
  	    WHERE p.status_pedido = 'canceled'
   	    GROUP BY v.id_vendedor
        ORDER BY total_cancelados DESC
    	LIMIT 15) lojas15 
		    ON lojas15.id_vendedor = itens.id_vendedor
   	    WHERE p.status_pedido = 'canceled'
		GROUP BY lojas15.id_vendedor
		ORDER BY valor_cancelados DESC);

--Quais produtos apresentam o maior número de cancelamentos, 
--a quais categorias pertencem e qual o impacto financeiro desses cancelamentos?

SELECT proc.id_produto,proc.nome_categoria_produto,total_cancelados,
	SUM(itens.preco) AS valor_cancelados
FROM itens_pedido itens
INNER JOIN pedidos p
   	ON p.id_pedido = itens.id_pedido
INNER JOIN
	(SELECT 
	   pro.nome_categoria_produto,itens.id_produto,
		COUNT (itens.id_produto) as total_cancelados
	FROM itens_pedido itens 
	INNER JOIN produtos pro 
		ON itens.id_produto=pro.id_produto
	INNER JOIN pedidos p
		ON itens.id_pedido=p.id_pedido
	WHERE status_pedido = 'canceled'
	GROUP BY pro.nome_categoria_produto,itens.id_produto
	 ) proc
		ON proc.id_produto=itens.id_produto
	WHERE status_pedido = 'canceled'	
	GROUP BY proc.id_produto,proc.nome_categoria_produto,total_cancelados
	ORDER BY valor_cancelados desc, proc.total_cancelados desc 

--Quais estados dos vendedores tiveram a maior quantidade de pedidos cancelados,
--suas respectivas cidades e o valor total dos cancelamentos?

SELECT vaestados.estado_vendedor,
	   vaestados.cidade_vendedor,
	   vaestados.qtd_cancelados,
	   vaestados.id_vendedor,
	 SUM (itens.preco) valor_total_cancelados
FROM itens_pedido itens
INNER JOIN pedidos p 
	 ON itens.id_pedido=p.id_pedido
INNER JOIN 	
  (SELECT v.id_vendedor,
          cidade_vendedor,
          v.estado_vendedor,
     COUNT(Distinct p.id_pedido)AS qtd_cancelados
   FROM itens_pedido itens
   INNER JOIN vendedores v
	 ON itens.id_vendedor=v.id_vendedor
   INNER JOIN pedidos p 
	 ON itens.id_pedido=p.id_pedido
   WHERE status_pedido = 'canceled'
   GROUP BY estado_vendedor, cidade_vendedor, v.id_vendedor
   ORDER BY qtd_cancelados desc) vaestados
  	 ON itens.id_vendedor=vaestados.id_vendedor
   WHERE status_pedido = 'canceled'
   GROUP BY vaestados.id_vendedor,
            vaestados.cidade_vendedor,
            vaestados.estado_vendedor,
	        vaestados.qtd_cancelados        
   ORDER BY valor_total_cancelados desc 		
         	
  


