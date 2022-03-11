--USO DO OPERADOR =
	SELECT * FROM cidades
	WHERE uf = 'SP'

	SELECT * FROM cidades
	WHERE nome_mun = 'Dourado' AND uf = 'SP'

--Uso do operador >
	SELECT * FROM cidades
	WHERE populacao > 100000

	SELECT * FROM cidades
	WHERE populacao > 100000 ORDER BY populacao ASC

--Uso do operador <
	SELECT * FROM cidades
	WHERE populacao < 50000 ORDER BY populacao ASC

--Uso de operador <=
	SELECT * FROM cidades
	WHERE populacao <= 10000 ORDER BY populacao ASC

--Uso de operador >=
	SELECT * FROM cidades
	WHERE populacao >= 10000 ORDER BY populacao ASC

--Uso do operador <>
	SELECT * FROM cidades
	WHERE uf <> 'SP' AND uf <> 'SC'

--EXEMPLO COMBINANDO OPERADORES
	SELECT * FROM cidades
	WHERE populacao >= 50000
	AND populacao <= 100000
	AND uf = 'SP'
	AND nome_mun <> 'Vinhedo'