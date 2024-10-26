 
 use FBD


 --Max e min : máximo e menino 

 --menor e maior sálario dos vendedores

 Select min(salario_fixo) as 'MENOR SALARIO', max(salario_fixo) as 'MAIOR SALARIO'
 from vendedor

 -- sum : mostra soma 
 --Mostrar a quantidade total pedida para o produto de código '3'

 select sum(quantidade)
 from item_pedido
 where cod_produto = 3

 --AVG : média 
 -- média dos sálarios fixos dos vendedores

 select avg(salario_fixo) as media_salario
 from vendedor

 --count: conta uma quantidade

 --quantis vendedores ganham acima de 2500 de salario fixo

 select count (*) from vendedor
 where salario_fixo > 2500.00

 
 --Group By: formar grupos
 --Listar quantos produtos cada pedido contém

 select num_pedido,total_produtos = count(*)
 from item_pedido 
 group by num_pedido


 --listar um pedido que tem mais de um produto

 select num_pedido,total_produtos = count(*)
 from item_pedido 
 where quantidade > 5
 group by num_pedido
 having count(*)>1

 --update com select

 update produto
 set Valor_unitario = Valor_unitario * 1025
 where Valor_unitario <
	(select avg (Valor_unitario)
	from produto
	where Unidade = 'KG')

-- delete com select

--remover da tabela de pedidos os pedidos que contenham produtos que custem menos de 0.20

delete from pedido
where Num_pedido IN
	(Select Num_pedido
	 from produto P, item_pedido I
	 where P.cod_produto = I.cod_produto and Valor_unitario < 0.20)



 select * from vendedor