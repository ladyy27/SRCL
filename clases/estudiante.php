<?php
if (!class_exists('estudiante')) {
  class estudiante{
		var $nombre;
		var $apellido;
		var $CI;
		var $fecha_nac;
		var $correo;
		public function __construct(){			
		} 
		public function __construct2($id_estudiante_n,$nombre_n,$apellido_n,$CI_n,$fecha_nac_n,$correo_n){
			$this->id_estudiante=$id_estudiante_n;
			$this->nombre=$nombre_n;
			$this->apellido=$apellido_n;
			$this->CI=$CI_n;
			$this->fecha_nac=$fecha_nac_n;
			$this->correo=$correo_n;
		} 
		public function set_id_estudiante($id_estudiante_n){
			$this->id_estudiante=$id_estudiante_n;
		} 
		public function get_id_estudiante(){
			return $this->id_estudiante;
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
		public function set_fecha_nac($fecha_nac_n){
			$this->fecha_nac=$fecha_nac_n;
		} 
		public function get_fecha_nac(){
			return $this->fecha_nac;
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