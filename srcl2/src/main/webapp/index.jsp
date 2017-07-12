<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>-->


<!DOCTYPE HTML>
<html>
    <head>
        <title>SRCL</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/css/principal.css" />
    </head>
    <body>

        <!-- Header -->
    <section id="header">
        <div class="inner">
            <span class="icon major fa-mortar-board"></span>
            <h1>Servicio de Registro de Cursos en Linea <strong></strong>, que esperas<br />
                para emprender un nuevo reto <i class="fa fa-arrow-circle-o-right"></i></i><a href="frmNuevoEstudiante.jsp"> REGISTRATE</a>.</h1>
            <p>La mejor inversión siempre será en conocimiento, no dejes pasar mas en tiempo, ¡Atrévete ya!</p>
            <br>
            <a href="infoCursos.jsp"> VER CURSOS DISPONIBLES</a>  
            
            <ul class="actions">
                <li><a href="#one" class="button scrolly">Más Información</a></li>
            </ul>
        </div>
    </section>

    <!-- One -->
    <section id="one" class="main style2">
        <div class="container">
            <div class="row 150%"> 
                              
                <div class="6u 12u$(medium)">
                    <ul class="major-icons">
                        <li><span class="icon style1 major fa-child"></span></li>
                        <li><span class="icon style2 major fa-female"></span></li>
                        <li><span class="icon style3 major fa-male"></span></li>
                        <li><span class="icon style4 major fa-user"></span></li>
                    </ul>
                </div>
                <div class="6u$ 12u$(medium)">
                    <header class="major">
                        <h2>Categorias</h2>
                    </header>
                    <p><h3>Junior: de 12 a 16 años</h3></p>
                    <p><h3>Jovenes: de 17 a 22 años </h3></p>
                    <p><h3>Adultos: de 23 a 50años </h3></p>
                    <p><h3>Tercera Edad: de 51 años en adelante</h3></p>
                </div>
            </div>
        </div>       
    </section>

    <!-- Four -->
    <section id="four" class="main style1 special">
        <div class="container" id="uno">
            <header class="major">
                <h2>Administración</h2>
            </header>
            <p>Solo personal Autorizado?</p>
            <form method="post" action="#">
                <div class="row uniform 50% ">
                    <div class="12u$">
                        <input type="text" name="usuario" id="demo-user" value="" placeholder="Usuario" />
                    </div>
                    <div class="12u$">
                        <input type="password" name="contrasena" id="demo-pass" value="" placeholder="Contraseña" />
                    </div>
                    <div class="12u$">
                        <ul class="actions">
                            <li><input type="submit" value="Ingresar" class="special" /></li>
                            <li><input type="reset" value="Cancelar"/></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <section id="footer">
        <ul class="icons">
            <li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="https://github.com/alexanders0/RegistroCursoOnline.git" class="icon alt fa-github" target="_blank"><span class="label">GitHub</span></a></li>
            <!-- <li><a href="#" class="icon alt fa-envelope"><span class="label">Email</span></a></li> -->
        </ul>
        <ul class="copyright">
            <li>&copy; Untitled</li><li>Design: <a href="#" >GRUPO 5</a></li>
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