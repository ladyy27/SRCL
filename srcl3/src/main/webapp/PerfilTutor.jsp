<%-- 
    Document   : PerfilTutor
    Created on : 11/07/2017, 9:05:24
    Author     : ela
--%>

<%@page import="java.util.ArrayList"%>
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
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        
        
        
    </head>
    <body>

        <!-- Five -->
        <section id="five" class="main style1">
            <!-- Para hacer logout -->
            <div id="logeo">
                <%
                    HttpSession sesion = request.getSession();
                    Tutor tutor1 = new Tutor();
                    tutor1 = (Tutor) sesion.getAttribute("tutor");
                    String uri = String.valueOf(sesion.getAttribute("URI"));
                    ArrayList<Cursos> listaCursos_Tutor = new ArrayList<Cursos>();
                    listaCursos_Tutor = (ArrayList<Cursos>) sesion.getAttribute("listaCursos_Tutor");

                    if (request.getParameter("cerrar") != null) {
                        sesion.invalidate();
                    }
                %>
                Bienvenido, ${tutor.nombreTutor} (TUTOR)<a href="index.jsp?cerrar=true" class="label">     SALIR     </a>
            </div>
            <div class="container" id="dos">
                <a href="index.jsp" class="icon alt fa-home fa-lg"> Inicio</a><br><br> 
                <header class="major special">
                    <h2>Cursos Asignados</h2>
                </header>
                <p>Estimado tutor, estos son sus cursos asignados. Por favor, seleccione un curso para consultar:</p>
                <section>


                    <form action="RecuperarMatriculas">
                        <div class="row uniform 50%">		
                            <div class="12u$">
                                <div class="select-wrapper">
                                    <select name="cursosAsignados">
                                        <%  for (Cursos item : listaCursos_Tutor) {
                                                int idCurso = item.getIdCurso();
                                                String nombreCurso = item.getNombreCurso();
                                        %>
                                        <option value="<%=idCurso%>" > <%=nombreCurso%></option>
                                        <% }
                                        %>
                                    </select>

                                </div>
                            </div>

                            <div class="12u$">
                                <ul class="actions">
                                    <li><input  type="submit" value="consultar" class="special" /></li>
                                </ul>
                            </div> 
                        </div>

                    </form> 

                    <!-- EJEMPLO DATA TABLE--> 
                    <div>
                        <h1>${URI}</h1>
                    </div>
                    <div class="table-wrapper" >
                        <table class="alt" id="matriculas-tabla" cellpadding='0' cellspacing='0' border='0'>
                            <thead>
                                <tr>
                                    <th>ID Matricula</th>
                                    <th>Nombres</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>

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
        <!-- <script type="text/javascript">
            $("#getMatriculas").bind("click", function () {
                alert('El boton funciona.');
                location='PerfilTutor.jsp';
            });
        </script> -->
        <script type="text/javascript">
            $.get("${URI}", function (data) {
                $.each(data, function (i, mat) {
                    $("#matriculas-tabla").append(
                            
                            "<tr id=" +mat.idMatricula +"><td>" + mat.idMatricula + "</td>" +
                            "<td>" + mat.idEstudiante.apellidos+" " + mat.idEstudiante.nombres+ "</td>"+
                            "<td>" + mat.estado+ "</td></tr>");
                });
            });
        </script>
        
        
        
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        


      

    </body>
</html>
