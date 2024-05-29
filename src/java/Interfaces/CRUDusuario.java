package Interfaces;
import Modelo.DTOusuario;
import java.util.ArrayList;
public interface CRUDusuario {
    public ArrayList<DTOusuario> ListarUsuarios();
    public DTOusuario ObtenerUsuario(int id);
    public boolean AgregarUsuario(DTOusuario us);
    public boolean EditarUsuario(DTOusuario us);
    public boolean EliminarUsuario(int id); 
}
