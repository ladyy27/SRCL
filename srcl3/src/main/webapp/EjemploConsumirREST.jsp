<%-- 
    Document   : EjemploConsumirREST
    Created on : 02/08/2017, 18:01:53
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
                <p>Por favor, selecciona un curso para registrar notas</p>
                <section>
                    <!--CONSUMIR REST -->
                    <div id="mat-data" >
                        Consumiedo el servicio  REST de matriculas                    
                    </div>
                    <script type="text/javascript">
                        $.get("http://localhost:8080/srcl3/rest/matriculas/11", function(data){
                            $.each(data, function(i,mat){
                                $("#mat-data").append(
                                   "<h4>ID MATRICULA: "+mat.idMatricula+"</h4><br>" +
                                   "<h4>Estado Matricula: "+mat.estado+"</h4><br>");
                            });
                        });
                    </script>
                    <form action="RecuperarNotas">
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
                                    <li><input type="submit" value="registrar notas" class="special" /></li>
                                </ul>
                            </div> 
                        </div>
                        
                    </form> 
                </section>
                
                
                <section>						

                    <div class="table-wrapper">
                        <table class="alt">
                            <thead>
                                <tr>
                                    <th>Curso</th>
                                    <th># Horas</th>
                                    <th>Categoria</th>
                                    <th>Periodo</th>
                                    <th>Notas</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  for (Cursos item : listaCursos_Tutor) {
                                        String nombreCurso = item.getNombreCurso();
                                        int horas = item.getNumHoras();
                                        CategoriaCurso cat = item.getIdCategoria();
                                        String categoria = cat.getNombreCategoria();
                                        Periodo per = item.getIdPeriodo();
                                        String periodo = per.getNombrePeriodo();
                                        int idCurso = item.getIdCurso();
                                %>
                                <tr id=<%=idCurso%>>                                  
                                    <td><%=nombreCurso%></td>
                                    <td><%=horas%></td>
                                    <td><%=categoria%></td>
                                    <td><%=periodo%></td>
                                    <!--<td><a href=FrmNuevoTutor.php class='button special fit small'>registrar notas</a></td>-->
                                    <td><input action="RecuperarNotas" type="submit" value="registrar notas" class='button special fit small'/></td>
                                </tr>
                            <% }
                            %>
                            </tbody>
                        </table>
                    </div>

                </section>

                <section>
                    						

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