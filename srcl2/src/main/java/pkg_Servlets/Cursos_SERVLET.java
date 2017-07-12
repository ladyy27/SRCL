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
@WebServlet(name = "Cursos_SERVLET", urlPatterns = {"/Cursos_SERVLET"})
public class Cursos_SERVLET extends HttpServlet {

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
        String mensaje ="";
        Cursos_BL cbl = new Cursos_BL();
        
        ArrayList<Object> listaCursos  = new ArrayList<Object>();
        
//        listaCursos = cbl.lista_cursosBL();
        
        if (!listaCursos.isEmpty())
            request.setAttribute("listaCursos", listaCursos);
        else{
            mensaje ="No existen cursos disponibles";
            request.setAttribute("mensaje", mensaje);
        }
            //categorylist is an arraylist      contains object of class category  
        //getServletConfig().getServletContext().getRequestDispatcher("/GetCategory.jsp").forward(request,response);
        request.getRequestDispatcher("infoCursos.jsp").forward(request, response);
        //PrintWriter out = response.getWriter();
        /*try {
            //TODO output your page here. You may use following sample code.
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cursos_SERVLET</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cursos_SERVLET at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }*/
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
