package Interfaces;

import Modelo.DTOsalon;
import java.util.ArrayList;

public interface CRUDsalon {
    public ArrayList<DTOsalon> ListarSalones();  
    public DTOsalon ObtenerSalon(int id);        
    public boolean AgregarSalon(DTOsalon salon); 
    public boolean EditarSalon(DTOsalon salon);  
    public boolean EliminarSalon(int id);        
}
