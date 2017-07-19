<%-- 
    Document   : infoCursos
    Created on : 04/07/2017, 9:15:30
    Author     : ela
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/Cursos_SERVLET" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos Disponibles</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/principal.css" />
        <script type="text/javascript" src="assets/js/funciones.js"></script>
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    </head>
    <body>
        <h1>Cursos Disponibles</h1>

        <%
            
            /*String msg="";
            msg = String.valueOf(request.getAttribute("mensaje"));*/
            ArrayList<Object> list = new ArrayList<Object>();
            
            list = (ArrayList<Object>)request.getAttribute("listaCursos");
            for (int i = 0; i < list.size(); i++) {
                out.println(list.get(i));
            }
        %>

        <div class="row uniform 50%">		
            <div class="6u 12u$(xsmall)">
                Curso:	<label for="demo-priority-normal">
                </label>
            </div>
            <div class="6u 12u$(xsmall)">
                Descripcion:	<label for="demo-priority-normal">
                </label>
                </label>
            </div>
            <div class="6u 12u$(xsmall)">
                Duración:	<label for="demo-priority-normal">
                </label>
            </div>
            <div class="6u 12u$(xsmall)">
                Tutor:	<label for="demo-priority-normal">
                </label>
            </div>
            <div class="6u 12u$(xsmall)">
                Categoria:	<label for="demo-priority-normal">
                </label>
            </div>

        </div>

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
