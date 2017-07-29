<?php
	if (!function_exists('registrar_tutor')){
		function registrar_tutor($tutor, $usuario, $contrasena, $curso)
		{		
			include ("../DAT/tutor_dat.php");
			include ("../clases/tutor.php");
			registrar_tut($tutor->get_nombre(), $tutor->get_apellido(), $tutor->get_correo(), $tutor->get_titulo(), $usuario, $contrasena);
			$id_tutor = consultar_id_tutor();
			asignar_tutor_curso($curso, $id_tutor);
		}
	}
?>