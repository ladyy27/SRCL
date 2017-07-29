<?php
	if (!function_exists('registrar_tut')){
	  function registrar_tut($NOMBRE, $APELLIDO, $CORREO, $TITULO, $USUARIO, $CONTRASENA)
	  	{
	  		include("conect.php");
			$SQL = "INSERT INTO empleados (NOMBRE_EMP, APELLIDO_EMP, CORREO_EMP, TITULO, TIPO_EMP, USUARIO, CONTRASENA) 
			VALUES ('".$NOMBRE."','".$APELLIDO."','".$CORREO."','".$TITULO."','tutor','".$USUARIO."','".$CONTRASENA."')"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
		}
	}

	if (!function_exists('consultar_id_tutor')){
	  function consultar_id_tutor()
	  	{
	  		include("conect.php");
			$SQL = "SELECT MAX(CI_EMPLEADO) AS id FROM empleados"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
			while ($row  = mysql_fetch_array($resultado,MYSQL_ASSOC))
			{
			  	$id[]=$row;
			}
			return $id[0]["id"];
		}
	}

	if (!function_exists('asignar_tutor_curso')){
	  function asignar_tutor_curso($ID_CURSO, $CI_EMPLEADO)
	  	{
	  		include("conect.php");
			$SQL = "UPDATE cursos SET CI_EMPLEADO = '".$CI_EMPLEADO."' WHERE ID_CURSO = '".$ID_CURSO."'"; 
			$resultado = mysql_query($SQL) or die(mysql_error($link));
		}
	}
?>

