<?php
	include('includes/header.php');
	include('dbconn.php');
	include('conts.php');
	
	//http://www.sql.ru/forum/926018/oop-php-mysql-primery
	
	$Conts = new Conts();
	$Dbconn = new Dbconn();
	
	$Dbconn->connect();
	$Conts->show_form();
	
	if(isset($_GET['go']) && $_GET['go']==1)
	{
		$Conts->search_res();
	}
	
	$Dbconn->disconnect();
	
	include('includes/footer.php');
?>