<?php
	foreach (glob("../DAT/*.php") as $filename)
	{
		include $filename;
	}
	
	class matricula{
		var private $estado;
		var private $nota_final;
		var private $tipo_pago; 1
		var private $monto; 1
		var private $nota; //revisar diagrama de clases (ya está nota_final)
		var private $fecha_matricula; 1
		var private $periodo_inicio;
		var private $periodo_fin;
		var private $nombre_periodo;

		public function __construct(){			
		} 
		public function __construct2($tipo_pago_n,$monto_n,$fecha_matricula_n){
			$this->tipo_pago=$tipo_pago_n;
			$this->monto=$monto_n;
			$this->fecha_matricula=$fecha_matricula_n;
		} 
		public function set_tipo_pago($tipo_pago_n){
			$this->tipo_pago=$tipo_pago_n;
		} 
		public function get_tipo_pago(){
			return $this->tipo_pago;
		} 	
		public function set_monto($monto_n){
			$this->monto=$monto_n;
		} 
		public function get_monto(){
			return $this->monto;
		} 
		public function set_fecha_matricula($fecha_matricula_n){
			$this->fecha_matricula=$fecha_matricula_n;
		} 
		public function get_fecha_matricula(){
			$fecha_matricula = date("Y-m-d",time());
			return $this->fecha_matricula;
		}
	}
?>