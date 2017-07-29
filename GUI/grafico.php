<?php
include("../BL/estudiantes_bl.php");
$lista=lista_estudiantes();

	foreach ($lista as $l) {
		echo "CI: ".$l["CI"]."<br>";
		echo "Nombre: ".$l["NOMBRES"]."<br>";
		echo "APELLIDOS ".$l["APELLIDOS"]."<br>";
		echo "FECHA_NAC: ".$l["FECHA_NAC"]."<br>";
		echo "E_MAIL: ".$l["E_MAIL"]."<br>";
		echo "<br>";
	}
?>