<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of producto
 *
 * @author Pere
 */
class producto {
	function __construct($id, $nombre, $impuesto){
		$this->textToSearch = $textToSearch;
		$this->getConcretStsTableNames();
	}
	
	public static function obtenDescuento(){
		return "";
	}
	
	public static function obtenTodos(){
		$SQL = getQuery("Productos");
		$rows = getTable($SQL);
		$resp = array();
		foreach($rows as $row){
			$resp[] = new _self($row['id'], $row['nombre'], $row['impuesto']);
		}
		return resp;
	}
}
