<?php
	if (!function_exists('validar')){
	  function validar($usuario_in, $contrasena_in)
	  	{
	  		include ("conect.php");	
			$SQL = "SELECT * FROM empleados WHERE usuario = '".$usuario_in."' AND contrasena = '".$contrasena_in."'";
			$resultado = mysql_query($SQL,$link);
			$row  = mysql_fetch_array($resultado,MYSQL_ASSOC);
			return $row;
		}
	}
?>