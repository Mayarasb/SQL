-- Lista de Exercicio 3 (Mayara Souza Barros)

use Exercicio3

-- Exercicio 1

Create table Setor
(
Cod_Setor int identity (1,1) not null,
Nome_Setor varchar(30),

Constraint Pk_ICodSetor primary key(Cod_Setor)
)

-- Exercício 2

Create table Funcionario
(
NrMatricula int identity (1,1) not null,
Primeiro_Nome varchar(20),
Ultimo_Nome varchar(50),
Email varchar(200),
Telefone varchar(20),
data_admissão datetime,
salario float,
Cod_Setor int

Constraint Pk_Matricula primary key (NrMatricula)
Constraint FK_ Foreign Key(Cod_Setor) references Setor
)

--Exercicio 3 (já foi feito nas anteriores)

--Exercício 4

Insert into Setor (Nome_Setor)
Values
('Recursos Humanos'),
('Produção'),
('TI'),
('Manutenção'),
('Qualidade')

-- Exercício 5

Insert into Funcionario (Primeiro_Nome,Ultimo_Nome,Email,Telefone,data_admissão,salario,Cod_Setor)
Values
('Julia','Cristina','julia.cristina@email,com','1234-5678','08-09-2004',3500.00,'1'),
('Igor','Silva','igor.silva@email.com','1011-1213','09-09-2010',1500.00,'2'),
('Mayara','Barros','mayara.barros@email.com','1415-1617','03-04-2014',3800.00,'3'),
('Vinicius','Pereira','vinicius.pereira@email.com','1819-2021','05-06-2024',2800.00,'4'),
('Patricia','Batista','patricia.batista@email.com','2223-2425','27-08-2024',3000.00,'5')

--Exercício 6

--A

select distinct Nome_Setor
from Setor

--B

Select 'Empregado e Setor: '+ Ultimo_Nome  +', ' + Convert(varchar,cod_setor),Cod_Setor
from Funcionario

--Exercício 7

select primeiro_nome,ultimo_nome,salario
from Funcionario
where Salario > 2500

--Exercício 8

select primeiro_nome,ultimo_nome,Cod_Setor
from Funcionario
where NrMatricula = 5

--Exercício 9

select primeiro_nome,ultimo_nome,salario
from Funcionario
where salario < 1500 or salario > 3000

--Exercício 10

select primeiro_nome,Ultimo_nome,cod_setor,data_admissão
from Funcionario
where data_admissão > '2009'
order by data_admissão

--Exercício 11 

select Primeiro_Nome,Cod_Setor
from Funcionario
where Cod_Setor in (1,3)
order by Cod_Setor

-- exibindo setores (conferir)

select * from Setor
where Nome_Setor in ('TI','Recursos Humanos')

--Exercício 12

select primeiro_nome 
from Funcionario
where Primeiro_Nome like '_a%'

--Exercício 13 

select primeiro_nome
from Funcionario
where Primeiro_Nome like '%a%' or Primeiro_Nome like '%e%'

--Não contem nomes com "a" e "e" na tabela


-- Exercício 14

select * from Funcionario
where Cod_Setor = 2
order by Primeiro_Nome

--Exercício 15

select Primeiro_nome,Ultimo_nome,Cod_Setor
from Funcionario
where Cod_Setor = 2 or Cod_Setor = 5

-- Exercício 16 

select primeiro_nome,Ultimo_nome,salario,Cod_Setor
from Funcionario
where salario > 2300 and Cod_Setor = 3



Select * from Funcionario
Select * from Setor