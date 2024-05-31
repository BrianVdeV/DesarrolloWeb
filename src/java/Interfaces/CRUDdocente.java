package Interfaces;

import Modelo.*;
import java.util.ArrayList;

public interface CRUDdocente {

    public ArrayList<DTOdocente> ListarDocentes();

    public DTOdocente ObtenerDocente(int id);

    public boolean AgregarDocente(DTOdocente doc);

    public boolean EditarDocente(DTOdocente doc);

    public boolean EliminarDocente(int id);
}//fin crud
