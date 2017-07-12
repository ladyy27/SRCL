<%-- 
    Document   : frmNuevoEstudiante
    Created on : 04/07/2017, 8:53:40
    Author     : ela
--%>

<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Date dNow = new Date();
    SimpleDateFormat ft
            = new SimpleDateFormat("MM/dd/yyyy");
    String currentDate = ft.format(dNow);
%>

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
                    <li><a href="index.jsp" class="icon alt fa-home fa-lg"><span class="label">Inicio</span></a></li>
                </ul>

                <header class="major special">
                    <h2>Registro</h2>
                </header>
                
                <%
                    String msg = "";
                    msg = String.valueOf(request.getAttribute("mensaje"));
                %>

                <section>
                    <p>${mensaje}</p>
                    <form action="CrearEstudiante">
                        <div class="row uniform 50%">
                            
                            
                            <div class="6u 12u$(xsmall)">
                                <input type="text" name="cedula" id="demo-cl" onkeypress="return justNumbers(event);" maxlength="10"  placeholder="Cedula de Identidad" required/>
                            </div>

                            <div class="6u$ 12u$(xsmall)">
                                <input type="email" name="email" id="demo-email" value="" placeholder="Email" required/>
                            </div>
                            
                            <div class="6u 12u$(xsmall)">
                                <input type="text" name="nombres" id="demo-cl" onkeypress="" placeholder="Nombres" required <c:out value="${person.ci}"/>
                            </div>

                            <div class="6u$ 12u$(xsmall)">
                                <input type="text" name="apellidos" id="demo-email" value="" placeholder="Apellidos" required/>
                            </div>
                            
                            <div class="6u 12u$(xsmall)">
                                <input type="text" name="user" id="demo-cl" onkeypress=""   placeholder="Usuario" required/>
                            </div>

                            <div class="6u 12u$(xsmall)">
                                <input type="password" name="password" id="demo-cl" maxlength="8"  placeholder="Contraseña" required/>
                            </div>
                            
                            <div class="6u 12u$(xsmall)">
                                <label for="demo-priority-normal"> Fecha de nacimiento:  </label>
                            </div>

                            <div class="6u 12u$(xsmall)">
                                <input type="date" name="fecha_nac" id="demo-email" value="" />
                            </div>
                            <div class="12u$">
                                <ul class="actions">
                                    <li><input type="submit" value="Continuar" class="special" /></li>
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
