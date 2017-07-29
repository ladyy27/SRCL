<?php
	if (!function_exists('consulta_personas')){
	  function consulta_personas($cedula)
	  	{
			$registro= "SELECT * FROM registro WHERE CI = '$cedula'";
			$resultado= mysql_query($registro);
			$bandera = -1;
			while ($row  = mysql_fetch_array($resultado,MYSQL_ASSOC))
			{
			  $personas[]=$row;
			  $bandera = 1;
			}

			if ($bandera == 1) {
				return $personas;
			} else {
				return null;
			}
		
		}
	}
?>