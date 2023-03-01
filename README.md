# php_Datatables.Net.Editor-Php

 1. Installing - `composer install`
 2. Change config file in path `vendor/datatables.net/editor-php/config.php` according to your database. For example: 
  ```
 $sql_details = array(  
  "type" => "Mysql", // Database type: "Mysql", "Postgres", "Sqlserver", "Sqlite" or "Oracle"  
  "user" => "mysql", // Database user name  
  "pass" => "mysql", // Database password  
  "host" => "localhost", // Database host  
  "port" => "3306", // Database connection port (can be left empty for default)  
  "db" => "laravel_editor", // Database name  
  "dsn" => "utf8mb4", // PHP DSN extra information. Set as `charset=utf8mb4` if you are using MySQL  
  "pdoAttr" => array() // PHP PDO attributes array. See the PHP documentation for all options  
);
```

