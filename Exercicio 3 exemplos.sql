use Exercicio3

--SELECT COM DUAS OU MAIS TABELAS

--selecionando nome e salario da tabela funcionario e nome do setor
--(repeti��o de dados (produto cartesiano) vinculou o funcionario a varios setores)

Select Funcionario.Primeiro_Nome,Funcionario.salario,Setor.Nome_Setor
from Funcionario,Setor

-- como corrigir: vincula chave estrangeira tabela funcionario com chave primeria da tabela setor
--utilizar Where para vincular 

Select Funcionario.Primeiro_Nome,Funcionario.salario,Setor.Nome_Setor
from Funcionario,Setor
where Funcionario.Cod_Setor = Setor.Cod_Setor

-- tabelas longas: referencia nome da tabela por um apelido

Select f.Primeiro_Nome,f.salario,s.Nome_Setor
from Funcionario f, Setor s
where f.Cod_Setor = s.Cod_Setor

-- metodos de jun��es : Inner Join retorna os valores em comum de ambas as tabelas(intersec��o)
--(chave estrangeira necess�ria)

Select f.Primeiro_Nome,f.salario,s.Nome_Setor
from Funcionario f
inner join Setor s on f.Cod_Setor = s.Cod_Setor

-- Left Outer Join usada para registros da tabela esquerda... 
-- exemplo no banco de dados FDB

--Left excluding join traz os dados que est�o a direita (tabela a - a intersec��o)

-- right outer join traz tabelas do lado direito (intersec��o mais tabela b)

Select f.Primeiro_Nome,f.salario,s.Nome_Setor
from Funcionario f
right outer join Setor s on f.Cod_Setor = s.Cod_Setor

-- inserir um setor que n�o tem pessoas cadastradas

insert into Setor (Nome_Setor) values ('Marketing')

-- right excluding join (dados que s� tem na tabela b sem a intersec��o)

Select f.Primeiro_Nome,f.salario,s.Nome_Setor
from Funcionario f
right outer join Setor s on f.Cod_Setor = s.Cod_Setor
where f.Cod_Setor is null

--Full join pega tudo que tem na tabela a e na b e a intersec��o

select f.Primeiro_Nome,f.salario,s.Nome_Setor
from Funcionario f
full outer join Setor s on f.Cod_Setor = s.Cod_Setor


-- full excluding : tabela a e tabela b sem a intersec��o


select f.Primeiro_Nome,f.salario,s.Nome_Setor
from Funcionario f
full outer join Setor s on f.Cod_Setor = s.Cod_Setor
where f.Cod_Setor is null or s.Cod_Setor is null

--cross join 

select f.Primeiro_Nome,f.salario,s.Nome_Setor
from Funcionario f
cross join Setor s
order by f.Primeiro_Nome

