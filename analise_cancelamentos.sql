--As 15 primeiras lojas que concentra uma quantidade maior de cancelamentos?  

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

--OS 15 produtos e sua categoria mais cancelados? 
 
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

-- Quais Estados teve maiores cancelamentos  

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


