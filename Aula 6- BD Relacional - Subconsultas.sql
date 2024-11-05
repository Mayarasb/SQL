CREATE DATABASE SUBCONSULTA;
go
use SUBCONSULTA;

-- Criação das tabelas
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY,
    NomeCategoria NVARCHAR(50)
);

CREATE TABLE Produto (
    ProdutoID INT PRIMARY KEY,
    NomeProduto NVARCHAR(50),
    CategoriaID INT,
	Preco decimal(10,2),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY,
    DataPedido DATE,
    ProdutoID INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

-- Inserção de dados nas tabelas
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES
    (1, 'Eletrônicos'),
    (2, 'Roupas'),
    (3, 'Alimentos');

INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES
    (1, 'Smartphone', 1, 4000),
    (2, 'Camiseta', 2, 50);


INSERT INTO Pedido (PedidoID, DataPedido, ProdutoID)
VALUES
    (1, '2023-01-15', 1),
    (2, '2023-02-20', 2);
  
-- Tabela Categoria
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES
    (4, 'Móveis'),
    (5, 'Livros'),
    (6, 'Jogos'),
    (7, 'Cosméticos'),
    (8, 'Informatica'),
    (9, 'Esportes'),
    (10, 'Brinquedos');

-- Tabela Produto
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES
    (3, 'Sofá', 4, 2000),
    (4, 'Livro de Romance', 5, 40),
    (5, 'Xbox', 6, 2500),
    (6, 'Perfume', 7, 80),
    (7, 'Laptop', 8, 7000),
    (8, 'Bola de Futebol', 9, 20),
    (9, 'Quebra-Cabeça', 10, 120),
    (10, 'Chapéu', 2, 200);

-- Tabela Pedido
INSERT INTO Pedido (PedidoID, DataPedido, ProdutoID)
VALUES
    (3, '2023-03-10', 5),
    (4, '2023-04-05', 2),
    (5, '2023-05-12', 7),
    (6, '2023-06-25', 1),
    (7, '2023-07-03', 10),
    (8, '2023-08-18', 3),
    (9, '2023-09-09', 8),
    (10, '2023-10-22', 4);


	--Subconsulta

	--subconsulta com all: pega o valor da principal e compara com as aninhadas a ele (fazer comparações)

	-- traz todos os produtos cujo o preço é maior do que o preço do chapéu  (select interno retorna o preço do chapéu na tabela)
	Select NomeProduto from Produto
	where Preco > all (select Preco from Produto where NomeProduto = 'Chapéu')

	-- seleciona todos os produtos cujo o preço é maior  do que o preço de todos os produtos da categoria eletrônicos

	select NomeProduto from Produto	where Preco > all
		(select preco from Produto where CategoriaID = 
			(select CategoriaID from Categoria where NomeCategoria = 'Eletrônicos'));

	--subconsulta com any e some(são equivalentes): verifica se um dos resultados é verdadeiro

	--listar todos os produtos cujo preço seja menor do que o preço de pelo menos um produto da categoria 'Eletrônico', cujo o código é 1 no exemplo.

	--Any

	select NomeProduto
	from Produto
	where Preco < any (select Preco from Produto where CategoriaID = 1);

	-- some

	select NomeProduto
	from Produto
	where Preco < some (select Preco from Produto where CategoriaID = 1);
	
	--Exists

	-- encontrar todos os produtos que forma pedidos pelo menos uma vez

	select NomeProduto
	from Produto
	where exists (select * from Pedido where Pedido.ProdutoID = Produto.ProdutoID);

	-- in: verifica se um valor esta presnete em um conjunto de valores 

	-- encontrar todos os produtos que estão no pedido 1 e 3
	-- interna retorna ids dos produtos pedidos no 1 e 3 , consulta principal seleciona nome dos produtos que estão presentes nessa lista.

	select NomeProduto
	from Produto
	where ProdutoID in (select ProdutoID from Pedido where PedidoID in (1,3));


	-- 1: listar nomes dos produtos que pertencem a categoria 'Eletrônicos'

	select NomeProduto
	from Produto
	where CategoriaID = (select CategoriaID from Categoria
	where NomeCategoria = 'Eletrônicos');

	--2: Listar os nomes dos produtos comprados e pedidos realizados em janeiro de 2023;

	select NomeProduto
	from Produto
	where ProdutoID in (select ProdutoID from Pedido
	where YEAR (dataPedido) = 2023 and MONTH (datapedido) = 1);

	--4- Listar os produtos que ainda não foram vendidos 

	select NomeProduto
	from Produto
	where ProdutoID not in (select ProdutoID from Pedido);