<?php
include('include/config.php');
include('classes/producto.php');
include('classes/marca.php');
include('classes/databasePDO.php');
initSQL($config);

$results = producto::obtenTodos();

foreach($results as $result){	
	echo '<p>'.$result->toString().'</p>'."\n";
}