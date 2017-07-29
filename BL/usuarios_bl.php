<?php
	if (!function_exists('validar_usuarios')){
		function validar_usuarios($usuario, $contrasena)
		{		
			foreach (glob("../DAT/*.php") as $filename)
			{
				include $filename;
			}
			$row = validar($usuario, $contrasena);
			if (!($row)) 
			{	
				$message = "Usuario o Contraseña Incorrectos";
				echo "<script type='text/javascript'>alert('$message');</script>";
			}else{
				$message = "Logeo Exitoso";
				session_start();
		        $_SESSION["usuario"]=$usuario;
		        $_SESSION["acceso"]=$row["TIPO_EMP"];
		        $_SESSION["cuenta"]=$row["CI_EMPLEADO"];
				echo "<script type='text/javascript'>alert('$message');</script>";
				echo "<script>location.href='index2.php'</script>";
			}
		}
	}

	if (!function_exists('logout')){
		function logout()
		{		
			session_start();
			session_unset();
			session_destroy();

			header ('Location: index.php');
			exit (0); 
		}
	}

?>