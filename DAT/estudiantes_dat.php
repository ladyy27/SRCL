<?php
	if (!function_exists('consulta_estudiantes')){
	  function consulta_estudiantes()
	  	{
		$categorias= "SELECT * FROM estudiantes ORDER BY fecha_nac ASC";
		$resultado= mysql_query($categorias);

		while ($row  = mysql_fetch_array($resultado,MYSQL_ASSOC))
		{
		  $estudiantes[]=$row;

		}
		return $estudiantes;
		}
	}
?>