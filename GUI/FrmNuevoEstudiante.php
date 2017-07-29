<?php
include("../clases/estudiante.php");
foreach (glob("../BL/*.php") as $filename)
{
	include $filename;
}

//Mantener los datos de la cedula y mail en los inputs
if(!isset($_GET["cedula"])){
	$cedula = $_GET["cedula"] = "";
	$email = $_GET["email"] = "";
} else{
	$cedula = $_GET["cedula"];
	$email = $_GET["email"];
	$valor = validar_cedula($_GET["cedula"]);
	if ($valor["estado"]==0) {
		echo "<script type='text/javascript'>alert('".$valor["mensaje"]."');</script>";
	}
}

//Obtener los datos del aspirante según su CI ingresada
if(isset($_GET["cedula"])){
	$estudiantes = obtener_persona($_GET["cedula"]);
	if (is_array($estudiantes)) {
		foreach ($estudiantes as $est) {
			$e = $est;
			$edad = (calcular_edad($_GET["cedula"]));
			$e->set_correo($_GET["email"]);
		}
	}
}

//Una vez seleccionado el curso, se 
if(isset($_POST["cursos"])){
	$estudiantes = obtener_persona($_GET["cedula"]);
	if (is_array($estudiantes)) {
		foreach ($estudiantes as $est) {
			$e = $est;
			$edad = (calcular_edad($_GET["cedula"]));
			$e->set_correo($_GET["email"]);
		}
	}

	realizar_matricula($e, $_POST["cursos"]);
	$message = "Estudiante registrado con Exito!";
	echo "<script type='text/javascript'>alert('$message');</script>";
	$id_curso = $_POST["cursos"];
	echo "<meta http-equiv='Refresh' content='0;url=FrmPago.php?id_curso=$id_curso'>";
}

?>

<!DOCTYPE HTML>

<html>
	<head>
		<title>SRCL</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/principal.css" />
		<script type="text/javascript" src="assets/js/funciones.js"></script>
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>

		<!-- Five -->
			<section id="" class="main style1">
				<div class="container" id="uno">
					<ul class="icons">
						<li><a href="index.php" class="icon alt fa-home fa-lg"><span class="label">Inicio</span></a></li>
					</ul>

					<header class="major special">
						<h2>Registrate</h2>
					</header>


					<section>
						<form method="<?php $_SERVER['PHP_SELF'] ?>" action="#">
							<div class="row uniform 50%">
								<div class="6u 12u$(xsmall)">
									<input type="text" name="cedula" id="demo-cl" onkeypress="return justNumbers(event);" maxlength="10" value="<?php echo $cedula ?>" placeholder="Cedula de Identidad" required/>
								</div>

								<div class="6u$ 12u$(xsmall)">
									<input type="email" name="email" id="demo-email" value="<?php echo $email ?>" placeholder="Email" required/>
								</div>
								<div class="12u$">
									<ul class="actions">
										<li><input type="submit" value="Validar" class="special" /></li>
									</ul>
								</div>
							</div>
						</form>

						<form method="post" action="#">
							<div class="row uniform 50%">		
								<div class="6u 12u$(xsmall)">
									Nombres:	<label for="demo-priority-normal">
									<?php 
										if(isset($e)){
											echo $e->get_nombre();
										}  
									?></label>
								</div>
								<div class="6u 12u$(xsmall)">
									Apellidos:	<label for="demo-priority-normal">
									<?php 
										if(isset($e)){
											echo $e->get_apellido();
										}  
									?></label>
								</label>
								</div>
								<div class="6u 12u$(xsmall)">
									Edad:	<label for="demo-priority-normal">
									<?php 
									if(isset($edad)){
										echo $edad;
									}  
									?></label>
								</div>

								<div class="6u 12u$(xsmall)">
									<div class="select-wrapper">
										<select name="cursos" id="demo-area ">
											<?php
												if (isset($edad)) {
													$cursos = lista_cursos($edad);
												    foreach ($cursos as $curso)
												    {
												        echo utf8_encode("<option value='".$curso["ID_CURSO"]."'>".$curso["NOMBRE_CURSO"]."</option>");
												    }
												}
											?>
										</select>
									</div>
								</div>

 								<div class="12u$">
									<ul class="actions">
										<li><input type="submit" value="Registrar" class="special" /></li>
									</ul>
								</div>
							</div>
						</form>
					</section>


				</div>
			</section>
		

		<!-- Footer -->
			<section id="footer">
				<ul class="icons">
					<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
					<!-- <li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li> -->
					<li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
					<!-- <li><a href="#" class="icon alt fa-envelope"><span class="label">Email</span></a></li> -->
				</ul>
				<ul class="copyright">
					<li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">GRUPO 5</a></li>
				</ul>
			</section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>