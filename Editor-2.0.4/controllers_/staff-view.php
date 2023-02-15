 <br />
<b>Fatal error</b>:  Uncaught Exception: An SQL error occurred: SQLSTATE[42S02]: Base table or view not found: 1146 Table 'worklistdb.staff_newyork' doesn't exist in /var/www/html/api/DataTables/Editor-2.0.4/lib/Database/Driver/MysqlQuery.php:108
Stack trace:
#0 /var/www/html/api/DataTables/Editor-2.0.4/lib/Database/Query.php(1095): DataTables\Database\Driver\MysqlQuery-&gt;_exec()
#1 /var/www/html/api/DataTables/Editor-2.0.4/lib/Database/Query.php(290): DataTables\Database\Query-&gt;_select()
#2 /var/www/html/api/DataTables/Editor-2.0.4/lib/Editor.php(1117): DataTables\Database\Query-&gt;exec()
#3 /var/www/html/api/DataTables/Editor-2.0.4/lib/Editor.php(990): DataTables\Editor-&gt;_get(NULL, Array)
#4 /var/www/html/api/DataTables/Editor-2.0.4/lib/Editor.php(713): DataTables\Editor-&gt;_process(Array)
#5 /var/www/html/api/DataTables/Editor-2.0.4/controllers/staff-view.php(31): DataTables\Editor-&gt;process(Array)
#6 {main}
  thrown in <b>/var/www/html/api/DataTables/Editor-2.0.4/lib/Database/Driver/MysqlQuery.php</b> on line <b>108</b><br />
