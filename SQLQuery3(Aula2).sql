Use bdaula

Select * from Cliente

--Criação tabela NotaFiscal
Create Table NotaFiscal
(
Num_Nota int not null,
Cod_Cli int not null,
Serie_Nota varchar(10) not null,
Emissao_Nota smalldatetime null,
Vtot_Nota SmallMoney not null,

Constraint PK_NotaFiscal primary Key(Num_Nota),
Constraint FK_Cliente Foreign Key(Cod_Cli) References Cliente(Cod_Cli)
)

Select * from NotaFiscal

--Criação tabela Cidade

Create table Cidade
(Codcidade varchar(2) not null,
Nomecidade varchar(40))

--Criação tabela Empregado

Create table Empregado
(Nrmatricula int,
Nome varchar(50),
Data_demissao datetime,
Salario float)

--Criação tabela estado

Create table estado
(cdestado varchar(2) not null,
Nomeestado varchar(30))

--Alterar tabela cidade: adicionar chave primária

Alter table cidade
Add primary key (codcidade);

-- Alterar tabela cidade: adicionar campos novos

Alter table cidade
Add cdestado char(2) not null,
teste varchar(1) null;

Select * from Cidade

-- Alterar tabela cidade: excluir coluna teste

Alter table cidade
drop column teste;

Select * from Cidade

-- Alterar tabela cidade: modifica tipo de dado da coluna

Alter table cidade
Alter column cdestado varchar(2);

Select * from Cidade

--Alterar tabela cidade: remover chave primaria

Alter table cidade
Drop constraint pk__Cidade__9ED2CA96D2DD12A9;

--Adicionar chave primaria

Alter table cidade
Add constraint pk_codcidade primary key(codcidade);

Alter table estado
Add primary key (cdestado);

-- Adiciona chave estrangeira ligando tabela estado com cidade

Alter table cidade
Add foreign key(cdestado) references estado (cdestado);

--Inserir dados nas tabelas

Insert into estado
values
('SP','São Paulo');

Insert into cidade
values
('1','Votorantim','SP');

Insert into cidade (Codcidade,Nomecidade,cdestado)
Values('2','Sorocaba','SP')

Select * from estado
Select * from cidade

Insert into estado
values
('RJ','Rio de Janeiro');

Insert into cidade
values
('3','Itu','SP');

Insert into cidade (Codcidade,Nomecidade,cdestado)
Values('4','Salto','SP')

Select * from estado
Select * from cidade

Insert into cidade
values
('5','Angra dos Reis','RJ');

Insert into cidade (Codcidade,Nomecidade,cdestado)
Values('6','Arraial do Cabo','RJ')

Select * from estado
Select * from cidade

Insert into estado
values
('MG','Minas Gerais');

Insert into cidade
values
('7','Belo Horizonte','MG');

Select * from estado
Select * from cidade

Insert into estado
values
('NN','Não Cadastrado');

Insert into cidade (Codcidade, Nomecidade,cdestado)
Values ('8','Itu','NN');

Insert into cidade(Codcidade,Nomecidade,Cdestado)
Values('9','Itapira','NN');

Select * from Cidade
Select * from estado

--Atualizando dados da tabela Cidade

Update Cidade
Set cdestado='SP'
Where cdestado='NN'

Select * from Cidade
Select * from estado

Update estado
Set Nomeestado='Nao Cadadastrado'
Where Nomeestado='Não Cadastrado'

Create Table Tbl_Clientes(
	Codigo Int identity (1,1) primary key,
	Nome Varchar(100),
	Uf Varchar(2));

	Select * from Tbl_Clientes

	Insert into Tbl_Clientes
		(nome,Uf)
	Values
		('Nicholas','RS');

Select IDENT_CURRENT('Tbl_Clientes') as Ultimo_registro;