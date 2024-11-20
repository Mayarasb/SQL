--PROCEDURES: funções para Banco de dados.

Create Proc consulta_produto
as
select * from produto
where nomeproduto like '%a%'


--executar--

exec consulta_produto

--alterar procedure

alter proc consulta_produto
as
select NomeProduto,Preco from Produto

--apagar procedure

drop proc consulta_produto

--Procedures com Váriaveis:

create procedure InserirNovoProduto
@IDProd int,
@Nome Nvarchar(50),
@CategoriaID int,
@Preco Decimal(10,2)

as 
begin
	insert into Produto (ProdutoID,NomeProduto,CategoriaID,Preco)
	values (@IDProd,@Nome,@CategoriaID,@Preco)
end

--execuçaõ

exec InserirNovoProduto 13,'SmartWatch',1,2200

--consultar

select * from Produto

--atualizar preços

create procedure AtualizarPrecoProduto
	@ProdutoId int,
	@NovoPreco Decimal(10,2)
as
begin
	update Produto
	set Preco = @NovoPreco
	where ProdutoID = @ProdutoId
end

--execução

exec AtualizarPrecoProduto 14,2500 
exec AtualizarPrecoProduto @Produtoid = 13, @NovoPreco = 2500

--consultar

select * from Produto

--Listar produtos

Create Procedure ListarProdutosPorCategoria
	@Categoria nvarchar(50)
as
begin
	select ProdutoID, NomeProduto, Preco
	from Produto
	where CategoriaID = (
		Select CategoriaID from Categoria
		where NomeCategoria = @Categoria)
end

exec ListarProdutosPorCategoria 'Roupas'
