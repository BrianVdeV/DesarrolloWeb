package Controlador;

import Modelo.DTOdocente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.*;
import DAO.*;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "ControladorDocente", urlPatterns = {"/ControladorDocente"})
public class ControladorDocente extends HttpServlet {

    String listar = "docentes.jsp";
    String add = "docentes.jsp";
    String edit = "docentes.jsp";
    DTOdocente docente = new DTOdocente();
    DAOdocente dao = new DAOdocente();
    int id;

    //método que lee los datos del curso
    public void LeerDatosDocente(HttpServletRequest request, HttpServletResponse response) {
        String idStr = request.getParameter("txtID");
        if (idStr != null && !idStr.trim().isEmpty()) {
            docente.setId_docente(Integer.parseInt(idStr));
        }
        docente.setApellido(request.getParameter("txtApellido"));
        docente.setNombre(request.getParameter("txtNombre"));
        docente.setDni(Integer.parseInt(request.getParameter("txtDNI")));
        docente.setSexo(request.getParameter("txtSexo"));
        docente.setFecha(request.getParameter("txtFecha"));
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            LeerDatosDocente(request, response);
            dao.AgregarDocente(docente);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("iddoc", request.getParameter("iddoc"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            LeerDatosDocente(request, response);
            dao.EditarDocente(docente);
            acceso = listar;
        } else if (action.equalsIgnoreCase("Eliminar")) {
            id = Integer.parseInt(request.getParameter("iddoc"));
            dao.EliminarDocente(id);
            acceso = listar;
        }//termino del if anidado
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }//fin process request

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
