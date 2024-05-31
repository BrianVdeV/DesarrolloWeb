package Controlador;

import Modelo.DTOsalon;
import DAO.DAOsalon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "ControladorSalon", urlPatterns = {"/ControladorSalon"})
public class ControladorSalon extends HttpServlet {

    String listar = "salones.jsp";
    String add = "salones.jsp";
    String edit = "salones.jsp";
    DTOsalon salon = new DTOsalon();
    DAOsalon dao = new DAOsalon();
    int id;

    // Método que lee los datos del salón
    public void LeerDatosSalon(HttpServletRequest request, HttpServletResponse response) {
        String idStr = request.getParameter("txtID");
        if (idStr != null && !idStr.trim().isEmpty()) {
            salon.setId_salon(Integer.parseInt(idStr));
        }
        salon.setNombre(request.getParameter("txtNombre"));
        salon.setCapacidad(Integer.parseInt(request.getParameter("txtCapacidad")));
        salon.setUbicacion(request.getParameter("txtUbicacion"));
        salon.setDescripcion(request.getParameter("txtDescripcion"));
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
            LeerDatosSalon(request, response);
            dao.AgregarSalon(salon);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idsalon", request.getParameter("idsalon"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            LeerDatosSalon(request, response);
            dao.EditarSalon(salon);
            acceso = listar;
        } else if (action.equalsIgnoreCase("Eliminar")) {
            id = Integer.parseInt(request.getParameter("idsalon"));
            dao.EliminarSalon(id);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
