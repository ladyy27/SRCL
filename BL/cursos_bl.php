<?php
	if (!function_exists('lista_cursos')){
		function lista_cursos($edad)
		{		
			foreach (glob("../DAT/*.php") as $filename)
			{
				include $filename;
			}
			$cursos = consulta_cursos($edad);
			return $cursos;
		}
	}

	if (!function_exists('lista_cursos_tutor')){
		function lista_cursos_tutor()
		{		
			foreach (glob("../DAT/*.php") as $filename)
			{
				include $filename;
			}
			$cursos = consulta_cursos_tut();
			return $cursos;
		}
	}
?>