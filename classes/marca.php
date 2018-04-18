<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of marca
 *
 * @author Pere
 */
class marca {
	private $id;
	private $nombre;
	private $descuento;
	
	function __construct($id, $nombre, $descuento){
		$this->id = $id;
		$this->nombre = $nombre;
		$this->descuento = $descuento;
	}
	
	public function toString(){
		return $this->nombre;
	}
}
