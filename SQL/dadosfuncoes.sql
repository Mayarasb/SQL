	use FBD

	--seleciona a data e o horario atual (sistema)

	--seleciona parte da data por extenso (mes escrito)

		select GETDATE()

	--Pega o ano atual(sistema)

		select datename(yy,getdate())

	--pega o mes atual(sistema)

		select datename(month,getdate())

	--Datepart: parte de uma data

	--mês (traz valor numerico do mes)

		select DATEPART(mm,getdate())
		select DATEPART(month,getdate())

	--Day: inteiro que representa a parte do dia especificada
		select Day (GETDATE())

	 --month : inteiro que represneta o mes
		select MONTH(getdate())

	 --Year: inteiro que representa o ano
		select YEAR(getdate())

	 --Datediff: diferença entre duas datas (número de limites)
	 --1 ano de diferença/2 anos diferença
		select DATEDIFF(yy,getdate(),getdate()+366)
		select DATEDIFF(yy,getdate(),getdate() + 720)

		select DATEDIFF(dd,'07/08/2001',getdate())

	 --DateADD(datepart,number,date) : adiciona um valor a parte de uma data
		select DATEADD(yy,1,getdate())
		select DATEname(month,(dateadd(month,3,getdate()))) -- soma 3 meses da data atual e retorna o nome do mes


	 --Isdate: verifica se a data é verdadeira ou não (1: valida, 0: inválida)
		select isdate('27-02-2023')
		Select ISDATE('30-02-2023')

	--Convert: converte para tipo de dado  --padrão mysql 103 113(tabela de conversão de data)
		select CONVERT(char,getdate(),103) 
		select CONVERT(char,getdate(),113)

	 --FUNÇÕES MATEMATICAS 

	 --ROUND: arredonda números 
		select ROUND(123.3467,3)
		select ROUND(123.3467,2)
		select ROUND(123.3467,1)
		select ROUND(123.3467,0)
		select ROUND(123.3467,-1)
		select ROUND(123.3467,-2)

	 --Floor: retorna parte inteiro mas não arredonda
		select FLOOR(123.45)

	 --Power: potencia de um numero
	 	select POWER(4,2)
		select POWER(2,2)

	 --ASCII: retorna o valor do codigo ascII (retorna o caractere mais a esquerda)
	 	 select ASCII('A'), ASCII('Amanda')

	 --Char: converte codigo ascII int em um caractere
	 	 select CHAR(65), char(66)

	 --Charindex: pesquisa expressao e retorna sua posição inicial
		select charindex ('Mundo','Ola Mundo Bonito')
		select charindex ('Mundo','Ola Mundo Bonito',3) --posição que começa a contar
		select charindex ('Mundo','Ola Mundo Bonito',6)

	 --Replace: substitui o caractere de uma cadeia
		select REPLACE('abcdefghicde','cde','xxx')
		select replace (Nome_cliente,'C','z') from cliente

	--Stuff (Expressaõ, Inicio, qnt de carcateres trocados, conjunto carcatere que irão substituir): 
	--insere uma cadeia de carcateres em outra cadeia de caracteres
		select STUFF('abcdef',2,3,'_ijklmn_')-- comeca na segunda posicao, troca 3 caracteres (bcd)

	--left: retorna a parte esquerda da cadeira de caracteres
		select left('abcdefgh',5)

	--right: parte direita de uma cadeia de caracteres
		select right('abcdefgh',5)

	--Replicate: repete um valor da cadeia de carcateres
		select REPLICATE('abc',3)

	--Substring: retorna a parte da expressão de caractere
		select SUBSTRING('ABCDEFGHIJ1',2,3)

	--Len: retorna numero de caracteres, excluindo espaços em branco a direita (esquerda conta)
	select len('ABCD')
	select len ('ABCD  ')

	--Reverse: retorna inverso de um valor da cadeia de carcateress
	select reverse ('ABCD')

	--Lower: converte para minusculo

	select lower('AbCD')
	select LOWER(Nome_cliente) from cliente

	--Upper: converte para maiusculo

	select UPPER('abCd')
	select Upper(Nome_cliente) from cliente

	--ltrim: remove espaços em branco a esquerda

	select '_' + LTRIM(' AbCD ') + '_'

	--rtrim: remove espaços em branco a direita
	select '_'+ rTRIM('  AbCD  ') +'_'