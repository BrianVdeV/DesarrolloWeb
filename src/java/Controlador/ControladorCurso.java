package Controlador;

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

@WebServlet(name = "ControladorCurso", urlPatterns = {"/ControladorCurso"})
public class ControladorCurso extends HttpServlet {

    String listar = "cursos.jsp";
    String add = "cursos.jsp";
    String edit = "cursos.jsp";
    DTOcurso curso = new DTOcurso();
    DAOcurso dao = new DAOcurso();
    int id;

    //método que lee los datos del curso
    public void LeerDatosCurso(HttpServletRequest request, HttpServletResponse response) {
        String idStr = request.getParameter("txtId");
        if (idStr != null && !idStr.trim().isEmpty()) {
            curso.setId_curso(Integer.parseInt(idStr));
        }
        curso.setNombre(request.getParameter("txtNombre"));
        curso.setAnio(Integer.parseInt(request.getParameter("txtAnio")));
        curso.setHoras(Integer.parseInt(request.getParameter("txtHoras")));
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
            LeerDatosCurso(request, response);
            dao.AgregarCurso(curso);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idcar", request.getParameter("idcar"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            LeerDatosCurso(request, response);
            dao.EditarCurso(curso);
            acceso = listar;
        } else if (action.equalsIgnoreCase("Eliminar")) {
            id = Integer.parseInt(request.getParameter("idcar"));
            dao.EliminarCurso(id);
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
