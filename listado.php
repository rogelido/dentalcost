<?php
include('include/config.php');
include('include/producto.php');
include('classes/databasePDO.php');
initSQL($config);

$results = producto::obtenTodos();

foreach($results as $result){	
	echo $result."\n";
}