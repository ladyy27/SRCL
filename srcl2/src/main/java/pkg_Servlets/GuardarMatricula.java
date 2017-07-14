/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pkg_BL.*;
import pkg_CLASES.*;


/**
 *
 * @author ela
 */
@WebServlet(name = "GuardarMatricula", urlPatterns = {"/GuardarMatricula"})
public class GuardarMatricula extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Cursos cur = new Cursos();
        Estudiantes e = new Estudiantes();
        Matriculas_BL matBL = new Matriculas_BL();
        RegistroNotas_BL regbl = new RegistroNotas_BL();
        
        //recuperar curso
        request.setAttribute("listaCursos", request.getParameter("listaCursos"));
        //los parametros se recuperan como int asi que hay que parsearlos
        String id_est_str = request.getParameter("idEstudiante");  
        int id_est = Integer.parseInt(id_est_str);
        String opcionCurso_str = request.getParameter("cursosDisponibles");
        int id_curso = Integer.parseInt(opcionCurso_str); 
        //poblar los objetos de curso y estudiante
        cur.setIdCurso(id_curso);
        e.setIdEstudiante(id_est);
        //crear matricula
        matBL.crearMatricula(e, cur);
        //consultar ID de matricula creado
        Matriculas mat = matBL.consultarMatriculaBL(id_est,id_curso);
        //crear registro de notas en blanco
        regbl.crearRegistroNotasBL(mat);
        
        //ALERT AVISANDO QUE SE GUARDO LA MATRICULA
        out.println("<script type=\"text/javascript\">");
        out.println("alert('¡Matriculada Registrada!. Por favor inicia sesión.');");
        out.println("location='index.jsp';");
        out.println("</script>");
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
