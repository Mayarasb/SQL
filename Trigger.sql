use SUBCONSULTA
-- Incrementar o valor campo em cada linha da tabela


declare @Counter INT
Set @Counter =1

while @Counter <= 10
begin
update Produto
set Preco =Preco + 100
Where ProdutoID = @Counter
Set @Counter = @Counter + 1

End

-- Atualiza��o Condicional em um loop verificando condi��es em uma tabela

Declare @Counter2 INT
Set @Counter2 = 1

while @Counter2 <= (Select COUNT(*) from Produto)
begin
	declare @PrecoAtual Decimal(10,2)
	select @PrecoAtual = Preco From Produto where ProdutoID = @Counter2

	if @PrecoAtual > 1000
	begin
		update Produto
		Set Preco = Preco * 1.1 
		where ProdutoID = @Counter2
	end

	set @Counter2 = @Counter2 + 1
end

select * from Produto

-- Registrar altera�oes de pre�o em um log

Create table LogPreco(
ProdutoId Int,
NovoPreco decimal (10,2),
DataAlteracao Date);


create trigger trg_LogPrecoAlterado
on Produto
after Update
as 
begin
	insert into LogPreco(ProdutoId,NovoPreco,DataAlteracao)
	select ProdutoId, Preco, GETDATE()
	from inserted
end

update Produto set Preco = 4100 where ProdutoID = 1

select * from LogPreco

--Impedir a adi��o de produtos com pre�os acima de um limite

create Trigger trg_LimitePreco
on Produto
instead of insert
as 
begin
	if exists (select 1 from inserted where Preco > 10000)
	begin
		raiserror ('O pre�o do produto n�o pode exceder $10.000', 16,1)
		rollback transaction
	end
	else
		insert into Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
		select ProdutoId, NomeProduto, CategoriaID, Preco
		from inserted
	end

	insert into Produto Values (14, 'Ultrabook', 8,15800)
