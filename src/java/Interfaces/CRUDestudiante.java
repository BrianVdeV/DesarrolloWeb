package Interfaces;

import Modelo.*;
import java.util.ArrayList;

public interface CRUDestudiante {

    public ArrayList<DTOestudiante> ListarEstudiantes();

    public DTOestudiante ObtenerEstudiante(int id);

    public boolean AgregarEstudiante(DTOestudiante est);

    public boolean EditarEstudiante(DTOestudiante est);

    public boolean EliminarEstudiante(int id);
}//fin crud
