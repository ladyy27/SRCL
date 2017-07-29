<?php
	if (!function_exists('consulta_tipo_pago')){
	  function consulta_tipo_pago()
	  	{
	  	include ("conect.php");	
		$SQL= "SELECT * FROM tipo_pago ORDER BY ID_TIPO_PAGO ASC";
		$resultado= mysql_query($SQL);

		while ($row  = mysql_fetch_array($resultado,MYSQL_ASSOC))
		{
		  $tipo_pago[]=$row;

		}
		return $tipo_pago;
		}
	}

	if (!function_exists('consultar_precio_curso')){
	  function consultar_precio_curso($ID_CURSO)
	  	{
		  	include ("conect.php");
			$SQL= "SELECT PRECIO FROM CURSOS WHERE ID_CURSO='".$ID_CURSO."'";
			$resultado= mysql_query($SQL);
			$monto  = mysql_fetch_array($resultado,MYSQL_ASSOC);
			return $monto;
		}
	}

	//Se inserta nuevo estudiante si no existe en la base
	if (!function_exists('registrar_estudiante')){
	  function registrar_estudiante($CI, $NOMBRES, $APELLIDOS, $FECHA_NAC, $EMAIL)
	  	{
			include("conect.php");
	  		$SQL = "SELECT CI FROM ESTUDIANTES WHERE CI ='".$CI."'"; 
			$resultado = mysql_query($SQL);
			$id  = mysql_fetch_array($resultado,MYSQL_ASSOC);
			if (!is_array($id)) 
			{	
				$SQL = "INSERT INTO ESTUDIANTES (CI, NOMBRES, APELLIDOS, FECHA_NAC, E_MAIL) VALUES ('".$CI."','".$NOMBRES."','".$APELLIDOS."','".$FECHA_NAC."','".$EMAIL."')"; 
				$resultado = mysql_query($SQL) or die(mysql_error($link));
			}
		}
	}

	if (!function_exists('registrar_matricula')){
	  function registrar_matricula($CI, $ID_CURSO, $FECHA_MAT)
	  	{
	  		include("conect.php");
			$SQL = "INSERT INTO matriculas (CI, ID_CURSO, FECHA_MAT) VALUES ('".$CI."','".$ID_CURSO."','".$FECHA_MAT."')"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
		}
	}

	if (!function_exists('consultar_id_matricula')){
	  function consultar_id_matricula()
	  	{
	  		include("conect.php");
			$SQL = "SELECT MAX(ID_MATRICULA) AS id FROM matriculas"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
			while ($row  = mysql_fetch_array($resultado,MYSQL_ASSOC))
			{
			  $id[]=$row;

			}
			return $id[0]["id"];
		}
	}
	
	if (!function_exists('registrar_pago')){
	  function registrar_pago($ID_MATRICULA, $ID_TIPO_PAGO, $MONTO)
	  	{
	  		include("conect.php");
			$SQL = "INSERT INTO pagos (ID_MATRICULA, ID_TIPO_PAGO, MONTO) VALUES ('".$ID_MATRICULA."','".$ID_TIPO_PAGO."','".$MONTO."')"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
		}
	}

	if (!function_exists('consultar_lista_estudiantes')){
	  function consultar_lista_estudiantes($CI_EMPLEADO)
	  	{
	  		$estudiantes = array();
	  		include("conect.php");
			$SQL = "SELECT estudiantes.*, cursos.NOMBRE_CURSO FROM estudiantes JOIN matriculas on estudiantes.CI=matriculas.CI JOIN cursos on matriculas.ID_CURSO=cursos.ID_CURSO WHERE CI_EMPLEADO='".$CI_EMPLEADO."'"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
			while ($row  = mysql_fetch_array($resultado,MYSQL_ASSOC))
			{
			  	$estudiantes[]=$row;
			}
			return $estudiantes;
		}
	}

	if (!function_exists('consultar_notas')){
	  function consultar_notas($CI_EMPLEADO)
	  	{
	  		include("conect.php");
			$SQL = "SELECT DISTINCT estudiantes.*, notas.ID_MATRICULA FROM estudiantes JOIN matriculas on estudiantes.CI=matriculas.CI JOIN cursos on matriculas.ID_CURSO=cursos.ID_CURSO JOIN notas on notas.ID_MATRICULA=matriculas.ID_MATRICULA WHERE CI_EMPLEADO='".$CI_EMPLEADO."'"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
			while ($row  = mysql_fetch_array($resultado,MYSQL_ASSOC))
			{
			  	$notas[]=$row;
			}
			//print_r($notas);
			return $notas;
		}
	}

	if (!function_exists('consultar_promedio')){
	  function consultar_promedio($ID_MATRICULA)
	  	{
	  		include("conect.php");
			$SQL = "SELECT AVG(NOTA) AS 'PROMEDIO' FROM notas WHERE ID_MATRICULA='".$ID_MATRICULA."'"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
			$row  = mysql_fetch_array($resultado,MYSQL_ASSOC);
			return $row;
		}
	}

?>