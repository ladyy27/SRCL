<?php

	if (!function_exists('lista_tipo_pago')){
		function lista_tipo_pago()
		{		
			foreach (glob("../DAT/*.php") as $filename)
			{
				include $filename;
			}
			$tipo = consulta_tipo_pago();
			return $tipo;
		}
	}

	if (!function_exists('consultar_monto')){
		function consultar_monto($ID_CURSO)
		{		
			include ("../DAT/matricula_dat.php");
			$monto = consultar_precio_curso($ID_CURSO);
			return $monto["PRECIO"];
		}
	}

	if (!function_exists('realizar_matricula')){
		function realizar_matricula($estudiante, $ID_CURSO)
		{		
			include ("../DAT/matricula_dat.php");
			include ("../clases/estudiante.php");
			$e = $estudiante;

			$FECHA_MAT = date("Y-m-d",time());

			registrar_estudiante($e->get_CI(), $e->get_nombre(), $e->get_apellido(), 
				$e->get_fecha_nac(), $e->get_correo());
			registrar_matricula($e->get_CI(), $ID_CURSO, $FECHA_MAT);
		}
	}

	if (!function_exists('realizar_pago')){
		function realizar_pago($ID_TIPO_PAGO, $MONTO)
		{		
			include ("../DAT/matricula_dat.php");
			$ID_MATRICULA = consultar_id_matricula();
			registrar_pago($ID_MATRICULA, $ID_TIPO_PAGO, $MONTO);
		}
	}

	if (!function_exists('consultar_lista')){
	  	function consultar_lista($CI_EMPLEADO)
	  	{
	  		include ("../DAT/matricula_dat.php");
	  		include ("../clases/estudiante.php");

	  		$lista_estudiantes= array();
	  		$estudiantes = consultar_lista_estudiantes($CI_EMPLEADO);
			if (is_array($estudiantes)) {
				foreach ($estudiantes as $est) 
				{
					$e = new estudiante();
					$e->set_nombre($est["NOMBRES"]);
					$e->set_apellido($est["APELLIDOS"]);
					$e->set_CI($est["CI"]);
					$e->set_fecha_nac($est["FECHA_NAC"]);	
					$e->set_correo($est["E_MAIL"]);
					$curso = $est["NOMBRE_CURSO"];	
					$lista_estudiantes[]=$e;				
				}
				return $lista_estudiantes;
			} else {
				return null;
			}
	  	}
	}

	if (!function_exists('consultar_notas_estudiantes')){
	  	function consultar_notas_estudiantes($CI_EMPLEADO)
	  	{
	  		include ("../DAT/matricula_dat.php");
	  		include ("../clases/estudiante.php");
	  		$estudiantes = consultar_notas($CI_EMPLEADO);
	  		foreach ($estudiantes as $estudiante) {
	  			$estudiante["PROMEDIO"] = consultar_promedio($estudiante["ID_MATRICULA"]);
	  		}
	  		return $estudiantes;
	  	}
	}

	if (!function_exists('consultar_prom')){
	  	function consultar_prom($ID_MATRICULA)
	  	{
	  		include ("../DAT/matricula_dat.php");
	  		include ("../clases/estudiante.php");
  			$promedio = consultar_promedio($ID_MATRICULA);
  			return $promedio;
	  	}
	  }
?>