--EXERC�CIOS DE FUN��O DE AGREGA��O

--conhecendo as tabelas
USE curso
SELECT * FROM cidades
SELECT * FROM senso_2013
SELECT * FROM uf
SELECT * FROM regiao_uf

--AVG: RETORNA A M�DIA DOS VALORES DE UM GRUPO. IGNORA OS VALORES NULOS.
SELECT AVG(populacao) AS 'MEDIA POPULACIONAL' FROM cidades
--AVG POR ESTADO
SELECT uf AS ESTADO, AVG(populacao) AS 'MEDIA POPULACIONAL' FROM cidades
GROUP BY UF 
ORDER BY 2

select cod_uf from uf where estado = 'Paran�'
select cod_uf from uf where estado IN (select estado from regiao_uf where estado='Paran�')

--MIN: retorna o valor m�nimo na express�o. Pode ser seguido da cl�usula OVER
SELECT MIN(populacao) AS TOTAL FROM cidades
SELECT nome_mun, populacao AS TOTAL FROM cidades WHERE populacao IN (SELECT MIN(populacao) AS TOTAL FROM cidades)