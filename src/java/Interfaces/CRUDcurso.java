package Interfaces;
import Modelo.*;
import java.util.ArrayList;
public interface CRUDcurso {
    public ArrayList<DTOcurso> ListarCursos();
    public DTOcurso ObtenerCurso(String id);
    public boolean AgregarCurso(DTOcurso cur);
    public boolean EditarCurso(DTOcurso cur);
    public boolean EliminarCurso(String id);    
}//fin crud
