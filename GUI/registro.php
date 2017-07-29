<?php
include("../clases/estudiante.php");
foreach (glob("../BL/*.php") as $filename)
{
	include $filename;
}

if(!isset($_GET["ced"])){
	$cedula = $_POST["cedula"] = "";
	$email = $_POST["email"] = "";
	$cursos = $_POST["cursos"] = "";
} else{
	$cedula = $_POST["cedula"];
	$email = $_POST["email"];
	// $cursos = $_POST["cursos"];
	$valor = validar_cedula($_POST["cedula"]);
	echo $valor["estado"];
	echo "Estado de cedula: ".$valor["mensaje"];
	echo "<br>POST: ".$_POST["cedula"];
	echo "<br>GET: ".$_GET["ced"];
}

if(isset($_GET["ced"]) && $valor["estado"] == 1){
	$estudiantes = obtener_persona($_POST["cedula"]);
	echo "<br>";
	if (is_array($estudiantes)) {
		foreach ($estudiantes as $est) {
			$e = $est;
			$edad = (calcular_edad($_POST["cedula"]));
			$e->set_correo($_POST["email"]);
			echo "Nombre: ".$e->get_nombre()."<br>";
			echo "Apellido: ".$e->get_apellido()."<br>";
			echo "Cedula: ".$e->get_CI()."<br>";
			echo "Fecha de nacimiento: ".$e->get_fecha_nac()."<br>";
			echo "Correo: ".$e->get_correo()."<br>";
			echo "Edad: ".$edad;
		}
	}
	// realizar_matricula($e, $_POST["cursos"]);
	// $message = "Estudiante registrado con Exito!";
	// echo "<script type='text/javascript'>alert('$message');</script>";
}

// if(isset($_GET["matricula"])){
// 	$estudiantes = obtener_persona($_POST["cedula"]);
// 	echo "<br>";
// 	if (is_array($estudiantes)) {
// 		foreach ($estudiantes as $est) {
// 			$e = $est;
// 			$edad = (calcular_edad($_POST["cedula"]));
// 			$e->set_correo($_POST["email"]);
// 			echo "Nombre: ".$e->get_nombre()."<br>";
// 			echo "Apellido: ".$e->get_apellido()."<br>";
// 			echo "Cedula: ".$e->get_CI()."<br>";
// 			echo "Fecha de nacimiento: ".$e->get_fecha_nac()."<br>";
// 			echo "Correo: ".$e->get_correo()."<br>";
// 			echo "Edad: ".$edad;
// 		}
// 	}
// 	realizar_matricula($e, $_POST["cursos"]);
// 	// $message = "Estudiante registrado con Exito!";
// 	// echo "<script type='text/javascript'>alert('$message');</script>";
// }

echo "<h2>Registro de cursos</h2>";
echo "<form name=form action=".$_SERVER['PHP_SELF']."?ced='".$cedula."' method='post'>";
	echo "<table>";
		echo "<tr><th><h4>Cedula de Identidad</th><td><input type='text' name=cedula value='$cedula'></td></tr>";
		echo "<tr><th><h4>Correo</th><td><input type='email' name=email value='$email'></td></tr>"; 
	echo "</table>";
	echo "<input type='submit' value='Validar'>";
echo "</form>";


echo "<form name=form action=".$_SERVER['PHP_SELF']."?matricula=1 method='post'>";
	echo "<table>";
		// echo "<tr><th><h4>Cedula de Identidad</th><td><input type='text' name=cedula value='$cedula'></td></tr>";
		// echo "<tr><th><h4>Correo</th><td><input type='email' name=email value='$email'></td></tr>"; 
		echo "<tr><th><h4>Cursos</th><td>";
		if (isset($edad)) {
			$cursos = lista_cursos($edad);
			echo "<select name=cursos>";   
			    foreach ($cursos as $curso)
			    {
			    	print_r($curso);
			        echo "<option value='".$curso["ID_CURSO"]."'>".$curso["NOMBRE_CURSO"]."</option>";
			    }
			echo "</select></td></tr>";
		}

		if (isset($_GET["matricula"]) && isset($_POST["cursos"])) {
			$valor = validar_cedula($_POST["cedula"]);
			if ($valor["estado"] == 1) {
				$monto = consultar_monto($_POST["cursos"]);
			} 
		} else {
			$monto = "";
		}
		
		echo "<tr><th><h4>Monto a cancelar: </th><td><input type='text' name=monto value='$monto'></td></tr>";
		echo "<tr><th><h4>Tipo de pago</th><td>";
		$tipo_pago = lista_tipo_pago();
		echo "<select name=tipo_pago>";   
		    foreach ($tipo_pago as $tipo)
		    {
		        echo "<option value='".$tipo["ID_TIPO_PAGO"]."'>".$tipo["NOMBRE_PAGO"]."</option>";
		    }
		echo "</select></td></tr>";
	echo "</table><br><br>";
	echo "<input type='submit' value='Guardar'>";
echo "</form>";

?>

<!-- <form action="demo_form.asp" method="get">
  <input list="browsers" name="browser">
  <datalist id="browsers">
    <option value="Internet Explorer">
    <option value="Firefox">
    <option value="Chrome">
    <option value="Opera">
    <option value="Safari">
  </datalist>
  <input type="submit">
</form> -->