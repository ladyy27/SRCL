<%-- 
    Document   : loginEstudiante
    Created on : 12/07/2017, 23:23:20
    Author     : ela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <section id="four" class="main style1 special">
            <div class="container" id="uno">
                <ul class="icons">
                    <li><a href="index.jsp" class="icon alt fa-home fa-lg"> Inicio</a></li>
                </ul>

                <header class="major special">
                    <h2>Estudiantes: Iniciar Sesión</h2>
                </header>

                <section>
                    <form action="LoginEstudiante">
                        <div class="row uniform 50% ">
                            <div class="12u$">
                                <input type="text" name="usuario" id="demo-user" value="" placeholder="Usuario" required/>
                            </div>
                            <div class="12u$">
                                <input type="password" name="contrasena" id="demo-pass" value="" placeholder="Contraseña" required/>
                            </div>
                            <div class="12u$">
                                <input type="submit" value="Ingresar" class="special" />
                            </div>
                            <p>${mensaje1}</p>
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
