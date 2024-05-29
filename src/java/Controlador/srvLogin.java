package Controlador;

import DAO.DAOusuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.DTOusuario;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvLogin", urlPatterns = {"/srvLogin"})
public class srvLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "verificar":
                        VerificarLogin(request, response);
                        break;
                    case "cerrar":
                        CerrarSesion(request, response);
                        break;
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception ex) {
            System.out.println("ERROR al ejecutar el srvlogin..." + ex);
        }
    }

    private void VerificarLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession sesion;
            DTOusuario us = new DTOusuario();
            DAOusuario dao;
            us.setCorreo(request.getParameter("emailaddress"));
            us.setContra(request.getParameter("password"));
            dao = new DAOusuario();
            DTOusuario usuario = dao.VerificarUsuario(us);
            if (usuario != null) {
                sesion = request.getSession();
                request.setAttribute("mensaje", "Bienvenido al sistema");
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", "Credenciales incorrectas");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println("ERROR no se pudo verificar..." + ex);
        }
    }

    private void CerrarSesion(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", null);
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        } catch (Exception ex) {
            System.out.println("ERROR al cerrar sesion " + ex.getMessage());
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
