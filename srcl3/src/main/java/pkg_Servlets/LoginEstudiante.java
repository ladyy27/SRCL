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
import javax.servlet.http.HttpSession;
import pkg_BL.*;
import pkg_CLASES.*;

/**
 *
 * @author thesis
 */
@WebServlet(name = "LoginEstudiante", urlPatterns = {"/LoginEstudiante"})
public class LoginEstudiante extends HttpServlet {

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
        Estudiantes_BL est_bl = new Estudiantes_BL();
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String mensaje= "";
                
        if (usuario != null && contrasena != null) {
            Estudiantes est = new Estudiantes();
            est = est_bl.loginEst(usuario, contrasena);

            if (est != null) {
                //crear la sesion, mando el objeto tutor
                HttpSession sesion = request.getSession();
                sesion.setAttribute("est", est);
                response.sendRedirect("PerfilEstudiante.jsp");
                //hacer que sea obligatorio pasar por el login para ingresar a las demas paginas
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Usuario y/o contraseña incorrectos.');");
                out.println("location='loginEstudiante.jsp';");
                out.println("</script>");
            }

        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
