<?php
	include("../BL/usuarios_bl.php");
	session_start();

	echo " <form name=form action=".$_SERVER['PHP_SELF']." method='post'>
	¡Bienvenido ". $_SESSION['usuario']."! (".$_SESSION["acceso"].")
	<input type='submit' name='logout' value='(salir)' id='salir'>
	</input>";

	if (isset($_POST['logout'])) {
	   logout();
	}
	echo "</form>";
?>