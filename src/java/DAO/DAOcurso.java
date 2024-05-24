package DAO;
import Persistencia.*;
import Modelo.*;
import java.util.*;
import javax.swing.JOptionPane;
import Interfaces.*;
public class DAOcurso extends Conexion implements CRUDcurso {
    DTOcurso curso = new DTOcurso();
    public DAOcurso(){}
    public void Mensajes(String mensaje){
        JOptionPane.showMessageDialog(null, mensaje);
    }    
    @Override
    public ArrayList<DTOcurso> ListarCursos() {
           ArrayList<DTOcurso> Lista = new ArrayList();
           String SQL = "select * from curso;";
           try{
               rs = smt.executeQuery(SQL);
               while(rs.next()){
                   curso =  new DTOcurso();
                   curso.setId_curso(rs.getInt(1));
                   curso.setNombre(rs.getString(2));
                   curso.setAnio(rs.getInt(3));
                   curso.setHoras(rs.getInt(4));
                   Lista.add(curso);
               }//fin while
           }catch(Exception ex){
                 Mensajes("ERROR no se puede listar los cursos "+ex);
           }
          return Lista;   
    }//fin listar
    @Override
    public DTOcurso ObtenerCurso(String id) {
        String SQL="select * from curso where indicador='S' and idcurso=?";
        try{
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1,id);
            rs = ps.executeQuery();
            if(rs.next()){
                curso.setId_curso(rs.getInt(1));
                curso.setNombre(rs.getString(2));
            }
        }catch(Exception ex){ Mensajes("ERROR no se puede obtener curso "+ex);  }
        return curso;
    }//fin obtener curso
    @Override
    public boolean AgregarCurso(DTOcurso cur) {
        String SQL="insert into curso (nombre,anio,horas) values(?,?,?);";
        try{
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1, cur.getNombre());
            ps.setInt(2, cur.getAnio());
            ps.setInt(3, cur.getHoras());
            ps.executeUpdate();
           }catch(Exception ex){ Mensajes("ERROR no se puede insertar curso "+ex);  }
        return false;
    }//fin agregar

    @Override
    public boolean EditarCurso(DTOcurso cur) {
        String SQL="update curso set nombre=?,anio=?,horas=? where id_curso=?";
        try{
            ps = super.getConnection().prepareStatement(SQL);           
            ps.setString(1, cur.getNombre());
            ps.setInt(2, cur.getAnio());
            ps.setInt(3, cur.getHoras());
            ps.setInt(4, cur.getId_curso());
            ps.executeUpdate();
           }catch(Exception ex){ Mensajes("ERROR no se puede editar curso "+ex);  }
        return false;
    }

    @Override
    public boolean EliminarCurso(int id) {
       String SQL = "DELETE FROM cursos WHERE id_curso = ?";
       try{
            ps = super.getConnection().prepareStatement(SQL);           
            ps.setInt(1,id);
            ps.executeUpdate();
       }catch(Exception ex){ Mensajes("ERROR no se puede eliminar curso "+ex);  }
       return false;
    }//fin eliminar    
}//fin de la clase
