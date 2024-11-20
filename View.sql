--View

--mostrar todos os produtos com preços superiores a 1000

Create View ProdutosCaros as 
select NomeProduto, Preco
from Produto
where Preco > 1000;

select * from ProdutosCaros;

--mostrar produtos mais caros em cada categoria

Create View ProdutosMaisCarosPorCategoria as 
select Categoria.NomeCategoria, Produto.NomeProduto,Produto.Preco
from Categoria
inner join Produto on Categoria.CategoriaID = Produto.CategoriaID
where Produto.Preco = 
	(select MAX(preco)
	from Produto as P
	where p.CategoriaID = Categoria.CategoriaID);

	select * from ProdutosMaisCarosPorCategoria


	--Variaveis: armazenar informacoes ou resultado de um select

	--set: um set para cada variavel

	--declara variavel chamada minpreco para armazenar preco minimo de produtos em uma categora especifica.

	declare @MinPreco decimal(10,2); --Declaração da variavel
	set @MinPreco = 50; -- Definição do valor da variavel

	--consultando a variavel

	select NomeProduto, Preco
	from Produto
	where Preco >= @MinPreco;

	-- declarar variavel totalpedidos armazenar o numero total de pedidos

	declare @TotalPedidos int;

	--definição do valor da variável usando Select
	select @TotalPedidos = COUNT(*)
	from Pedido;

	print 'O total de pedidos é: ' + Cast(@TotalPedidos as nvarchar(10));

	-- declarar uma variavel chamada mediaPreco para calcular a media de preço de produtos em uma categiria especifica

	declare @MediaPreco decimal(10,2);

	set @MediaPreco = (
	select AVG(preco)
	from Produto
	where CategoriaID = 1);

	print 'A média de preço na categoria de Eletrônicos é: ' + Cast(@MediaPreco as Nvarchar(10));

	-- Top: limitar o número de linhas que uma consulta retorn

	--10 produtos mais caros

	select top 10 NomeProduto,Preco
	from Produto
	order by Preco Desc;

	-- atualizar os preços de varios produtos em uma única transação

	begin transaction;
-- Aumenta os preços de todos os produtos em 10%

	update Produto
	set Preco = Preco *1.1;

	-- confirma a transação
	commit;


	--

	begin transaction;

	--Atualização com erro

	update Produto set CategoriaID = 100 where ProdutoID = 3;
	if @@ERROR = 0
	commit
	else 
	rollback -- Detectou erro, então desfaz as operações
	print 'Atualização na Tabela foi Cancelada';