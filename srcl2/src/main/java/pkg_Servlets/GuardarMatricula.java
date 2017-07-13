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
        //seleccionar curso
        Cursos cur = new Cursos();
        Estudiantes e = new Estudiantes();
        Matriculas_BL matBL = new Matriculas_BL();
        request.setAttribute("listaCursos", request.getParameter("listaCursos"));
        
        String id_est = request.getParameter("idEstudiante");         
        String opcionCurso = request.getParameter("cursosDisponibles");
        
        cur.setIdCurso(Integer.parseInt(opcionCurso));
        e.setIdEstudiante(Integer.parseInt(id_est));
       
        matBL.crearMatricula(e, cur);
        
        System.out.println("ID DEL CURSO SELECCIONADO: "+opcionCurso);
        String mensaje= "Matricula Registrada";
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("MatriculaGuardada.jsp").forward(request, response);
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
