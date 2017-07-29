<?php
if (!class_exists('tutor')) {
  class tutor{
		var $nombre;
		var $apellido;
		var $CI;
		var $titulo;
		var $correo;
		public function __construct(){			
		} 
		public function __construct2($nombre_n,$apellido_n,$titulo_n,$correo_n){
			$this->nombre=$nombre_n;
			$this->apellido=$apellido_n;
			$this->correo=$correo_n;
			$this->titulo=$titulo_n;
		} 
		
		public function set_nombre($nombre_n){
			$this->nombre=$nombre_n;
		} 
		public function get_nombre(){
			return $this->nombre;
		} 
		
		public function set_apellido($apellido_n){
			$this->apellido=$apellido_n;
		} 
		public function get_apellido(){
			return $this->apellido;
		} 
		
		public function set_CI($CI_n){
			$this->CI=$CI_n;
		} 
		public function get_CI(){
			return $this->CI;
		} 
		public function set_titulo($titulo_n){
			$this->titulo=$titulo_n;
		} 
		public function get_titulo(){
			return $this->titulo;
		} 
		public function set_correo($correo_n){
			$this->correo=$correo_n;
		} 
		public function get_correo(){
			return $this->correo;
		} 
	}
}
	
?>