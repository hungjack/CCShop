<?php
$dsn=array('user'=>'root', 'pass'=>'123456789');
try{
	$dbh = new PDO("mysql:host=localhost;dbname=pshop",$dsn['user'],$dsn['pass'],array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
}
catch(PDOException $ex){
	$failcreateconnect = 2;
}
?>