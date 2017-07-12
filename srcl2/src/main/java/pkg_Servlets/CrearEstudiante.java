/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
//import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pkg_CLASES.*;
import pkg_BL.*;

/**
 *
 * @author ela
 */
@WebServlet(name = "CrearEstudiante", urlPatterns = {"/CrearEstudiante"})
public class CrearEstudiante extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Estudiantes_BL estudianteBL = new Estudiantes_BL();
        Estudiantes e = new Estudiantes();

        String mensaje = "";

        String cedula = request.getParameter("cedula");
        String email = request.getParameter("email");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        String fecha = request.getParameter("fecha_nac");
        System.out.println("---------------------------fecha desde formulario" + fecha);

        
        
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateTime = LocalDate.parse(fecha, formatter);
        Date date = java.sql.Date.valueOf(dateTime);
        System.out.println("------------------------fecha en formato DATE"+date);
                
                
                
                
                
        e.setCi(cedula);
        e.setEMail(email);
        e.setNombres(nombres);
        e.setApellidos(apellidos);
        e.setUsername(user);
        e.setPassword(password);
        e.setFechaNac(date);
        System.out.println("---------------------------fecha en objeto estudiante DATE "+ e.getFechaNac());

        estudianteBL.crearEstudianteBL(e);

        Estudiantes_BL eBL = new Estudiantes_BL();

        if (cedula != null && !cedula.isEmpty()) {
            Estudiantes e1 = new Estudiantes();
            e1 = eBL.consultar_estudiante(cedula);

            request.setAttribute("student", e1);
            //metodos consultar cedula
            int edad = eBL.calcularEdad(e1);
            request.setAttribute("edad", edad);

            //nombre de categoria
            Categoria_BL catBL = new Categoria_BL();
            CategoriaCurso cc = new CategoriaCurso();
            cc = catBL.categoriaPorEdadBL(edad);
            request.setAttribute("categoria", cc);

            //listarcursos
            Cursos_BL cursoBL = new Cursos_BL();
            ArrayList<Cursos> listaCursos = new ArrayList<Cursos>();
            listaCursos = cursoBL.cursosPorCategoriaBL(edad);
            request.setAttribute("listaCursos", listaCursos);

            //curso seleccionado
            /*String opcionCurso = request.getParameter("cursosDisponibles");
            System.out.println("ID DEL CURSO SELECCIONADO: "+opcionCurso);
            String mensaje1= "Matricula Resgistrada!"; */
            //request.setAttribute("mensaje1", mensaje1);
            request.getRequestDispatcher("FrmNuevaMatricula.jsp").forward(request, response);
        } else {
            mensaje = "No se han podido recuperar los datos del estudiante";
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("FrmNuevaMatricula.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
