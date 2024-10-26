use FBD

--Left Outer Join (lados esquerdo) - intersec��o mais tabela a

Select c.Nome_cliente,p.num_pedido
from cliente c
left outer join pedido p on c.Cod_cliente = p.cod_cliente


--Left excluding join traz os dados que est�o a esquerda (tabela a)

Select c.Nome_cliente,p.num_pedido
from cliente c
left outer join pedido p on c.Cod_cliente = p.cod_cliente
where p.cod_cliente is null

-- right outer join traz tabelas do lado direito (intersec��o mais tabela b)

--Full join pega tudo que tem na tabela a e na b e a intersec��o
select c.Nome_cliente,p.Num_pedido
from cliente c
full outer join pedido p on c.Cod_cliente = p.cod_cliente

-- full excluding : tabela a e tabela b sem a intersec��o

select c.Nome_cliente,p.Num_pedido
from cliente c
full outer join pedido p on c.Cod_cliente = p.cod_cliente
where c.Cod_cliente is null or p.cod_cliente is null

-- Group by : formar grupos

