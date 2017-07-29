<?php
	if (!function_exists('lista_estudiantes')){
		function lista_estudiantes()
		{		
			foreach (glob("../DAT/*.php") as $filename)
			{
				include $filename;
			}
			$estudiantes = consulta_estudiantes();
			return $estudiantes;
		}
	}
?>