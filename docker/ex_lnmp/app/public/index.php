<?php
$pdo = new PDO('mysql:dbname=test;host=mysql', 'test', 'password', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
$query = $pdo->query('SHOW VARIABLES LIKE "version"');
$row = $query->fetch();
echo 'MySQL version:' . $row['Value'];