package Controlador;

import Modelo.DTOestudiante;
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

@WebServlet(name = "ControladorEstudiante", urlPatterns = {"/ControladorEstudiante"})
public class ControladorEstudiante extends HttpServlet {

    String listar = "estudiantes.jsp";
    String add = "estudiantes.jsp";
    String edit = "estudiantes.jsp";
    DTOestudiante estudiante = new DTOestudiante();
    DAOestudiante dao = new DAOestudiante();
    int id;

    //método que lee los datos del curso
    public void LeerDatosEstudiante(HttpServletRequest request, HttpServletResponse response) {
        String idStr = request.getParameter("txtID");
        if (idStr != null && !idStr.trim().isEmpty()) {
            estudiante.setId_estudiante(Integer.parseInt(idStr));
        }
        estudiante.setApellido(request.getParameter("txtApellido"));
        estudiante.setNombre(request.getParameter("txtNombre"));
        estudiante.setDni(Integer.parseInt(request.getParameter("txtDNI")));
        estudiante.setSexo(request.getParameter("txtSexo"));
        estudiante.setFecha(request.getParameter("txtFecha"));
        estudiante.setResponsable(request.getParameter("txtResponsable"));
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
            LeerDatosEstudiante(request, response);
            dao.AgregarEstudiante(estudiante);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("iddoc", request.getParameter("iddoc"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            LeerDatosEstudiante(request, response);
            dao.EditarEstudiante(estudiante);
            acceso = listar;
        } else if (action.equalsIgnoreCase("Eliminar")) {
            id = Integer.parseInt(request.getParameter("iddoc"));
            dao.EliminarEstudiante(id);
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
