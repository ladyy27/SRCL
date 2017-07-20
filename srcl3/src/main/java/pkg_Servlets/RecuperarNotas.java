/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg_Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "RecuperarNotas", urlPatterns = {"/RecuperarNotas"})
public class RecuperarNotas extends HttpServlet {

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
        
        
        /*Estudiantes e = new Estudiantes();
        Estudiantes_BL eBL = new Estudiantes_BL();
        String mensaje= ""; 
        String cedulaMat = request.getParameter("cedula");
        
        if (cedulaMat!=null && !cedulaMat.isEmpty()) {
           
            e = eBL.consultar_estudiante(cedulaMat);
            request.setAttribute("estudiante", e); 
            request.getRequestDispatcher("FrmNuevoMatricula.jsp").forward(request, response);
        }
        else{
            mensaje= "No se han podido recuperar los datos del estudiante";
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("FrmNuevoMatricula.jsp").forward(request, response);
        }:/
        
        
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
