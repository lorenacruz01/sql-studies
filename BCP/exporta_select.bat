bcp "SELECT * FROM CURSO.DBO.CLIENTES" QUERYOUT C:\workspace\sql-studies\BCP\export_test\export_select.txt -o C:\workspace\sql-studies\BCP\export_test\logs\export_select.log -T -c -r "\n" -t "|"
PAUSE