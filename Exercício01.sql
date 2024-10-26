--Mayara Barros
--Lista de Exerc�cio 1

Use Exercicios

-- Exerc�cio 1

Create Table Professores
(
Id int identity (1,1) not null,
Nome varchar(50),
Disciplina varchar(15),

Constraint Pk_Professores primary key(Id)
)

--Exerc�cio 2

Insert into Professores (Nome,Disciplina)
Values
('Ana Oliveira','Portugu�s');

--Exerc�cio 3

Update Professores 
set Nome= 'Ana Silva'
where Nome= 'Ana Oliveira'

--Exerc�cio 4

Insert into Professores (Nome,Disciplina)
Values
('Carlos Alexandre','Matem�tica'),
('Lucas Souza','Biologia'),
('Julia Rodrigues','Filosofia'),
('Laura Pedroso','Sociologia'),
('Mauro Silva','Geografia'),
('Roberto Bastos','Hist�ria'),
('Carmem Batista','Artes'),
('Roberval Santos','Educa��o F�sica'),
('Bruna Carvalho','F�sica'),
('Antonio Veiga','Portugu�s');

--Exerc�cio 5

delete Professores
where id='2'

--Exerc�cio 6

Create table Turmas
(
id int identity(1,1) not null,
Nome varchar(50),
professorResponsavel int

Constraint PK_Turmas primary Key(id),
Constraint FK_Turmas Foreign Key(professorResponsavel) references Professores
)

--Exerc�cio 7

Insert into Turmas (Nome,professorResponsavel)
Values
('9A','1');

--Exerc�cio 8

Insert into Turmas (Nome,professorResponsavel)
Values
('9B','1'),
('8A','3'),
('8B','4'),
('7A','5'),
('7B','6'),
('6B','7'),
('6A','8'),
('5B','9'),
('5A','10'),
('4B','11');

--Exercicio 9

Create table Alunos
(
id int identity(1,1) not null,
Nome varchar(50),
DataNascimento date,
TurmaId int, 


Constraint PK_Alunos primary Key(id),
Constraint FK_Alunos Foreign Key(TurmaId) references Turmas
)

--Exerc�cio 10

Insert into Alunos (Nome,DataNascimento,TurmaId)
Values
('Maria Souza','2005-10-15','1');

--Exerc�cio 11

Update Alunos 
set Nome= 'Maria da Silva'
where Nome= 'Maria Souza'


--Exerc�cio 12

Insert into Alunos(Nome,DataNascimento,TurmaId)
Values
('Ana Crsitina', '2006-02-12','3'),
('Carla Rodrigues','2006-05-22','4'),
('Enzo Fernandez','2007-08-05','5'),
('Rodrigo Batista','2007-09-03','6'),
('Maria Bastos','2008-11-25','7'),
('Marcus Vinicius','2008-08-17','8'),
('Vitoria Souza', '2009-09-18','9'),
('Jo�o Santos','2009-11-24','10'),
('Sabrina Almeida','2010-10-10','11'),
('Luana Pires','2011-11-14','4');

--Exerc�cio 13

delete Alunos
where id='2'

--Exerc�cio 14

Create table Notas
(
id int identity(1,1) not null,
AlunoId int ,
Disciplina varchar(15),
Nota decimal(5,2),

Constraint PK_Notas primary Key(id),
Constraint FK_Notas Foreign Key(AlunoId) references Alunos
)

--Exerc�cio 15

--Altera��o pois Professor de Id 2 tinha disciplina como Matem�tica, e estava dando erro para executar o execicio 15
update Professores
set Disciplina = 'Matem�tica'
where Disciplina = 'Sociologia'

insert into Notas (AlunoId,Disciplina,Nota)
Values
('1','Matem�tica','8.5')

--Exerc�cio 16

update Notas
set Nota = '9.0'
where Nota = '8.5'

-- Exerc�cio 17

Insert into Notas(AlunoId,Disciplina,Nota)
Values
('3','Portugu�s','7.0'),
('4','Biologia','10.0'),
('5','Filosofia','6.5'),
('6','Geografia','5.0'),
('7','Hist�ria','9.5'),
('8','Artes','7.5'),
('9','Educa��o F�sica','8.5'),
('10','F�sica','4.0'),
('11','Matem�tica','6.5');

--Exerc�cio 18

delete Notas
where id='1'

--Exerc�cio 19

Create table Matriculas
(
id int identity(1,1) not null,
AlunoId int ,
TurmaId int,
DataMatricula date,

Constraint PK_Matriculas primary Key(id),
Constraint FK_MatriculaAluno Foreign Key(AlunoId) references Alunos,
Constraint FK_MatriculaTurma Foreign Key(TurmaId) references Turmas
)

--Exerc�cio 20

Insert into Matriculas(AlunoId,TurmaId,DataMatricula)
Values
('1','1','2022-02-15')

--Exerc�cio 21

Insert into Matriculas(AlunoId,TurmaId,DataMatricula)
Values
('3','3','2022-05-22'),
('4','4','2022-11-29'),
('5','5','2022-10-03'),
('6','6','2022-08-21'),
('7','7','2022-04-11'),
('8','8','2022-06-20'),
('9','9','2022-07-04'),
('10','10','2022-09-26'),
('11','11','2022-02-13'),
('3','3','2022-05-21');


Select * from Turmas
Select * from Professores
Select * from Alunos
Select * from Notas
Select * from Matriculas
