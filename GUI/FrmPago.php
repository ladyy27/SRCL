<?php
	foreach (glob("../BL/*.php") as $filename)
	{
		include $filename;
	}

	$monto = consultar_monto($_GET["id_curso"]);

	if(isset($_POST["tipo_pago"])){
		realizar_pago($_POST["tipo_pago"], $monto);
		$message = "Pago realizado con Exito!";
		echo "<script type='text/javascript'>alert('$message');</script>";
		echo "<meta http-equiv='Refresh' content='0.3;url=index.php'>";
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
					<header class="major special">
						<h2>Pago</h2>
					</header>


					<section>
						<form method="post" action="#">
							<div class="row uniform 50%">
								<div class="6u 12u$(small)">
									<h4>Monto a Cancelar:</h4>
								</div>
								<div class="6u 12u$(small)">
									<h4>$ 
										<?php 
											echo $monto; 
										?> 
									</h4>
								</div>
								<div class="6u 12u$(xsmall)">
									<h4>Tipo de Pago:</h4>
								</div>
								<div class="6u 12u$(xsmall)">
									<div class="select-wrapper">
										<select name="tipo_pago" id="demo-area">
											<?php
												$tipo_pago = lista_tipo_pago();
											    foreach ($tipo_pago as $tipo)
											    {
											        echo utf8_encode("<option value='".$tipo["ID_TIPO_PAGO"]."'>".$tipo["NOMBRE_PAGO"]."</option>");
											    }
											?>
										</select>
									</div>
								</div>

								<div class="12u$">
									<ul class="actions">
										<li><input type="submit" value="Pagar" class="special" /></li>
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