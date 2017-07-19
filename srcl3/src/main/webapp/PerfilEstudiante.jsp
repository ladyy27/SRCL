<%-- 
    Document   : PerfilEstudiante
    Created on : 13/07/2017, 14:27:42
    Author     : thesis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pkg_BL.*"%>
<%@page import="pkg_CLASES.*"%>
<%@page session = "true"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>SRCL</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/principal.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    </head>
    <body>

        <!-- Five -->
        <section id="five" class="main style1">
            <!-- Para hacer logout -->
            <div id="logeo">
                <% 
                    HttpSession sesion= request.getSession();
                    Estudiantes est1 = new Estudiantes();
                    est1 = (Estudiantes) sesion.getAttribute("est");  

                    if (request.getParameter("cerrar") != null) {
                    sesion.invalidate();
                }
                %>
                <label>Bienvenido, ${est.nombres} (ESTUDIANTE) <a href="index.jsp?cerrar=true" class="label">SALIR</a> </label>   
            </div>
            <div class="container" id="dos">
                <header class="major special">
                    <h2>SRCL</h2>
                </header>
                <section>						
                    <a href="index.jsp" class="icon alt fa-home fa-lg"> Inicio</a>
                    <h4>Servicios</h4>
                    
                    <ul class="actions fit small">              
                        <li><a href=FrmNuevoTutor.php class='button special fit small'>Registrar Tutor</a></li>
                        <li><a href=Verificar.php class='button fit small'>Verificar Requisitos</a></li>
                        <li><a href=Verificar.php class='button fit small'>tercera opcion</a></li>
                        <li><a href=Verificar.php class='button fit small'>tercera opcion</a></li>
                    </ul>
                </section>

                <section>
                    <!-- 						<h5>Bienvenido</h5> -->
                    <header class="major special">
                        <h5>Sistema de Registro de Cursos en Linea</h5>
                    </header>
                </section>
            </div>
        </section>


        <!-- Footer -->
        <section id="footer">
            <ul class="icons">
                <li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
                <li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
                <li><a href="#" class="icon alt fa-envelope"><span class="label">Email</span></a></li>
            </ul>
            <ul class="copyright">
                <li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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