<%-- 
    Document   : FrmNuevaMatricula
    Created on : 06/07/2017, 11:22:06
    Author     : ela
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pkg_BL.*"%>
<%@page import="pkg_CLASES.*"%>
<!DOCTYPE html>
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

        <%
            Estudiantes estudiantes = new Estudiantes();
            Estudiantes estudiantes1 = new Estudiantes();
            CategoriaCurso categoria = new CategoriaCurso();
            ArrayList<Cursos> lista = new ArrayList<Cursos>();
            String msg = "";
            String msg1 = "";
            String age = "";
            age = String.valueOf(request.getAttribute("edad"));
            estudiantes = (Estudiantes) request.getAttribute("estudiante");
            msg = String.valueOf(request.getAttribute("mensaje"));
            msg1 = String.valueOf(request.getAttribute("mensaje1"));
            estudiantes1 = (Estudiantes) request.getAttribute("student");
            categoria = (CategoriaCurso) request.getAttribute("categoria");
            lista = (ArrayList<Cursos>) request.getAttribute("listaCursos");
            
        %>

        <section id="" class="main style1">

            <div class="container" id="uno">

                <ul class="icons">
                    <li><a href="index.jsp" class="icon alt fa-home fa-lg"><span class="label">Inicio</span></a></li>
                </ul>

                <header class="major special">
                    <h2>Nueva Matrícula</h2>
                </header>

                <p>${mensaje}</p>
                <p>${mensaje1}</p>
                <p>¡Hola, ${student.nombres} ${student.apellidos}!</p>
                <p>Bienvenido(a) a SRCL. Para completar tu matrícula, por favor selecciona un curso:</p>
                <h2>Categoria: ${categoria.nombreCategoria} </h2> 


                <section>

                    <form action="GuardarMatricula">
                        <div class="row uniform 50%">		
                            <div class="12u$">
                                <div class="select-wrapper">
                                    <select name="cursosDisponibles">
                                        <%  for (Cursos item : lista) {
                                                String nombreCurso = item.getNombreCurso();
                                                int id = item.getIdCurso();
                                        %>
                                        <option value="<%=id%>" > <%=nombreCurso%></option>
                                        <% }
                                        %>
                                    </select>
                                    <input type="text" name="idEstudiante" hidden value="${student.idEstudiante}"/>
                                </div>
                            </div>

                            <div class="12u$">
                                <ul class="actions">
                                    <li><input type="submit" value="Guardar" class="special" /></li>
                                </ul>
                            </div> 
                        </div>
                        <p>${student.idEstudiante}</p>
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
