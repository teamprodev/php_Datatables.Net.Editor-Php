 {"fieldErrors":[],"error":"An SQL error occurred: SQLSTATE[42S02]: Base table or view not found: 1146 Table 'worklistdb.users' doesn't exist","data":[],"ipOpts":[],"cancelled":[],"debug":[{"query":"SELECT  `users`.`id` as 'users.id', `users`.`first_name` as 'users.first_name', `users`.`last_name` as 'users.last_name', `users`.`manager` as 'users.manager', `manager`.`first_name` as 'manager.first_name', `manager`.`last_name` as 'manager.last_name' FROM  `users` LEFT JOIN users as manager ON `users`.`manager` = `manager`.`id` ","bindings":[]}]}