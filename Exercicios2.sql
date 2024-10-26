
--Lista de Exercício 02 (Mayara Souza Barros)

Use Exercicio2

--Exercício 1

Create table Tbl_Clientes
(
Id int identity (1,1) not null,
Nome varchar(50),
Email varchar(100),
Telefone varchar(15),

Constraint Pk_IdTblClientes primary key(Id)
)

--Exercício 2

Insert into Tbl_Clientes(Nome,Email,Telefone)
Values
('João Silva','joao@email.com','(11) 1234-5678');


--Exercício 3

Insert into Tbl_Clientes(Nome,Email,Telefone)
Values
('José Abreu','jose@email.com','(11) 91011-1213'),
('Carla Silva','carla@email.com','(11) 1415-1617'),
('Larissa Barros','larissa@email.com','(12) 1819-2022'),
('Lucas Barbosa','lucas@email.com','(12) 2324-2526'),
('Lauana Pedrosa','lauana@email.com','(13) 2728-2930'),
('Leticia Lima','leticia@email.com','(13) 3132-3334'),
('Roberta Santos','roberta@email.com','(14) 3536-3738'),
('Rubens Silveira','rubens@email.com','(14) 3940-4142'),
('Mauro Almeida','mauro@email.com','(15) 4344-4546'),
('Lorena Santana','lorena@email.com','(15) 4748-4950');

--Exercício 4

update Tbl_Clientes
set Telefone = '(11) 8765-4321'
where telefone = '(11) 1234-5678'

--Exercício 5

Create table Tbl_Produtos
(
Id int identity (1,1) not null,
Nome varchar(50),
Preco decimal(5,2),
Estoque int,

Constraint Pk_IdTbl_Produtos primary key(Id)
)

--Exercício 6

Insert into Tbl_Produtos(Nome,Preco,Estoque)
Values
('Camiseta','29.99','100');

--Exercício 7

Insert into Tbl_Produtos(Nome,Preco,Estoque)
Values
('Jaqueta','79.99','80'),
('Vestido Midi','49.99','100'),
('Saia','35.50','50'),
('Calça jeans','69.99','100'),
('Calça Leggin','40.00','90'),
('Moletom','89.99','70'),
('Regata','19.99','60'),
('Vestido Longo','79.99','40'),
('Camiseta','35.00','100'),
('Short jeans','59.99','60');

--Exercício 8

update Tbl_Produtos
set Preco = '39.99'
where Preco = '29.99'

-- Exercício 9

Create table Tbl_Pedidos
(
Id int identity (1,1) not null,
ClienteId int,
ProdutoId int,
Quantidade int,
DataPedido date,

Constraint Pk_IdTbl_Pedidos primary key(Id),
Constraint FK_PedClienteId Foreign Key(ClienteId) references Tbl_Clientes,
Constraint FK_PedProdutoId Foreign Key(ProdutoId) references Tbl_Produtos
)


--Exercício 10

Insert into Tbl_Pedidos(ClienteId,ProdutoId,Quantidade,DataPedido)
Values
('1','1','2','03-09-2024');

--Exercício 11

update Tbl_Pedidos
set Quantidade= '3'
where Quantidade = '2'

--Exercício 12

Insert into Tbl_Pedidos(ClienteId,ProdutoId,Quantidade,DataPedido)
Values
('2','2','2','01-09-2024'),
('3','3','4','29-08-2024'),
('4','4','5','28-08-2024'),
('5','5','6','27-08-2024'),
('6','6','7','26-08-2024'),
('7','7','8','25-08-2024'),
('8','8','9','24-08-2024'),
('9','9','10','23-08-2024'),
('10','10','11','23-08-2024'),
('11','11','1','23-08-2024');

--Exercício 13

Create table Tbl_Funcionarios
(
Id int identity (1,1) not null,
Nome varchar(50),
Cargo varchar(50),
Salario decimal (8,2)

Constraint Pk_IdTbl_Funcionarios primary key(Id),
)

-- Exercício 14

Insert into Tbl_Funcionarios(Nome,Cargo,Salario)
Values
('Maria Santos','Gerente',5000.00);

-- Exercício 15

update Tbl_Funcionarios
set Salario = 6000.00
where Salario = 5000.00

-- Exercício 16

Insert into Tbl_Funcionarios(Nome,Cargo,Salario)
Values
('Roger Almeida','Vendedor',3000.00),
('Carla Miranda','Vendedora',3200.00),
('Leticia Coutinho','Operadora de Caixa',1800.00),
('Pamela Brito','Vendedora',3300.00),
('Maria Souza','Auxiliar de Limpeza',1800.00),
('Lurdes Silva','Auxiliar de Limpeza',1700.00),
('Rafael Santos','Estoquista',2100.00),
('Rodrigo Lima','Estoquista',2200.00),
('Marcia Batista','Vendedora',3100.00),
('Lorena bastos','Vendedora',3250.00);

-- Exercício 17

Create table Tbl_Vendas
(
Id int identity (1,1) not null,
ProdutoId int,
Quantidade int,
ValorTotal decimal (8,2),
DataVenda date,

Constraint Pk_IdTbl_Vendas primary key(Id),
Constraint FK_ProdutoIdVendas Foreign Key(ProdutoId) references Tbl_Produtos
)

-- Exercício 18

Insert into Tbl_Vendas(ProdutoId,Quantidade,ValorTotal,DataVenda)
Values
(1,2,79.98,'10/09/2024');

-- Exercício 19

Insert into Tbl_Vendas(ProdutoId,Quantidade,ValorTotal,DataVenda)
Values
(2,3,90.00,'09/09/2024'),
(3,4,180.00,'08/09/2024'),
(4,5,190.00,'08/09/2024'),
(5,6,250.00,'06/09/2024'),
(6,7,500.00,'05/09/2024'),
(7,8,330.0,'05/09/2024'),
(8,9,70.00,'04/09/2024'),
(9,10,490.0,'03/09/2024'),
(10,11,90.00,'02/09/2024'),
(11,1,50.0,'01/09/2024');

-- Exercício 20

delete Tbl_Vendas
where id='1'

Select * from Tbl_Clientes
Select * from Tbl_Produtos
Select * from Tbl_Pedidos
Select * from Tbl_Funcionarios
Select * from Tbl_Vendas


