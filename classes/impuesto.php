<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of mipuesto
 *
 * @author pperez
 */
class impuesto {
	
	private $id;
	private $nombre;
	private $porcentaje;
	
	function __construct($id, $nombre, $porcentaje){
		$this->id = $id;
		$this->nombre = $nombre;
		$this->porcentaje = $porcentaje;
	}
}
