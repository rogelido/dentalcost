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
	
	private $id;
	private $nombre;
	private $impuesto;
	private $precio;
	private $marca;
	
	function __construct($id, $nombre, $precio, $impuesto, $marca){
		$this->id = $id;
		$this->nombre = $nombre;
		$this->precio = $precio;
		$this->impuesto = $impuesto;
		$this->marca = $marca;
	}
	
	public static function obtenDescuento(){
		return "";
	}
	
	public static function obtenTodos(){
		$SQL = getQuery("Productos");
		$rows = getTable($SQL);
		$resp = array();
		foreach($rows as $row){
			$marca = new marca($row['marca_id'], $row['marcas_nombre'], $row['descuentos_cantidad']);
			$resp[] = new self($row['id'], $row['nombre'], $row['precio'], $row['impuesto'], $marca);
		}
		return $resp;
	}
	
	public function toString(){
		return $this->nombre." (".$this->marca->toString().") ".$this->precio. " €";
	}
}
