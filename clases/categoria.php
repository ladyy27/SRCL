<?php
	class categorias{
		var $nombre_categoria;
		var $rango_inicio;
		var $rango_fin;
		public function __construct(){			
		} 
		public function __construct2($nombre_categoria_n, $rango_inicio_n, $rango_fin_n){
			$this->nombre_categoria=$nombre_categoria_n;
			$this->rango_inicio=$rango_inicio_n;
			$this->rango_fin=$rango_fin_n;
		}

		public function set_nombre_categoria($nombre_categoria_n){
			$this->nombre_categoria=$nombre_categoria_n;
		} 
		public function get_nombre_categoria(){
			return $this->nombre_categoria;
		} 
		
		public function set_rango_inicio($rango_inicio_n){
			$this->rango_inicio=$rango_inicio_n;
		} 
		public function get_rango_inicio(){
			return $this->rango_inicio;
		} 
		
		public function set_rango_fin($rango_fin_n){
			$this->rango_fin=$rango_fin_n;
		} 
		public function get_rango_fin(){
			return $this->rango_fin;
		} 
	}
?>