-- 1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano 
	FROM Filmes;

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano
	FROM Filmes
	ORDER BY Ano;

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao 
	FROM Filmes
	WHERE LOWER(Nome) = 'de volta para o futuro';

-- 4 - Buscar os filmes lançados em 1997
SELECT * 
	FROM Filmes
	WHERE Ano = 1997;
-- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT * 
	FROM Filmes
	WHERE Ano > 2000;

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT * 
	FROM Filmes
	WHERE Duracao > 100 AND Duracao < 150
	ORDER BY Duracao ASC;

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(*) AS Quantidade 
	FROM Filmes
	GROUP BY Ano
	ORDER BY SUM(Duracao) DESC;

-- 7.1 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pelo ano em ordem decrescente
SELECT Ano, COUNT(*) AS Filmes 
	FROM Filmes
	GROUP BY Ano
	ORDER BY Ano DESC;

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome, UltimoNome 
	FROM Atores
	WHERE LOWER(Genero) = 'm';

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome, UltimoNome 
	FROM Atores
	WHERE LOWER(Genero) = 'f'
	ORDER BY PrimeiroNome;

-- 10 - Buscar o nome do filme e o gênero
SELECT F.Nome, G.Genero 
	FROM Filmes AS F
	INNER JOIN FilmesGenero AS FG
		ON F.Id = FG.IdFilme
	INNER JOIN Generos AS G
		ON G.Id = FG.IdGenero;

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT F.Nome, G.Genero 
	FROM Filmes AS F
	INNER JOIN FilmesGenero AS FG
		ON F.Id = FG.IdFilme
	INNER JOIN Generos AS G
		ON G.Id = FG.IdGenero
	WHERE LOWER(G.Genero) = 'Mistério';

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT F.Nome, A.PrimeiroNome, A.UltimoNome, EF.Papel
	FROM Filmes AS F
	INNER JOIN ElencoFilme AS EF
		ON F.Id = EF.IdFilme
	INNER JOIN Atores AS A
		ON A.Id = EF.IdAtor;


-- auxiliares
SELECT * 
	FROM Generos;

SELECT * 
	FROM FilmesGenero;

SELECT * 
	FROM Filmes;

SELECT * 
	FROM Atores;

SELECT * 
	FROM ElencoFilme;