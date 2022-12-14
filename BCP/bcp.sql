/*
comando de exportação
bcp CURSO.DBO.CLIENTES OUT C:\workspace\sql-studies\BCP\export_test\export_result.txt -o C:\workspace\sql-studies\BCP\export_test\logs\export.log -T -c
PAUSE

bcp CURSO.DBO.CLIENTES OUT C:\workspace\sql-studies\BCP\export_test\export_result_pipe.txt -o C:\workspace\sql-studies\BCP\export_test\logs\export.log -T -c -r "\n" -t "|" -c
PAUSE

bcp CLIENTES OUT C:\workspace\sql-studies\BCP\export_test\export_result_pipe_data.txt -o C:\workspace\sql-studies\BCP\export_test\logs\export_pipe_data.log -d curso -T -c -r "\n" -t "|" -c
PAUSE

bcp "SELECT * FROM CURSO.DBO.CLIENTES" QUERYOUT C:\workspace\sql-studies\BCP\export_test\export_select.txt -o C:\workspace\sql-studies\BCP\export_test\logs\export_select.log -T -c -r "\n" -t "|"
PAUSE
*/
select @@SERVERNAME
select * from curso.dbo.clientes

IF EXISTS( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CLIENTES2')
	DROP TABLE CLIENTES2
GO

SELECT * INTO CLIENTES2 FROM CLIENTES

SELECT * FROM CLIENTES2

DELETE FROM CLIENTES2 --APAGANDO OS DADOS DA TABELA PARA A IMPORTAÇÃO (EXECUÇÃO DO ARQUIVO IMPORTA.BAT)


