package DAO;

import Persistencia.*;
import Modelo.*;
import java.util.*;
import javax.swing.JOptionPane;
import Interfaces.*;

public class DAOestudiante extends Conexion implements CRUDestudiante {

    DTOestudiante estudiante = new DTOestudiante();

    public DAOestudiante() {
    }

    public void Mensajes(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }

    @Override
    public ArrayList<DTOestudiante> ListarEstudiantes() {
        ArrayList<DTOestudiante> Lista = new ArrayList();
        String SQL = "select * from estudiante;";
        try {
            rs = smt.executeQuery(SQL);
            while (rs.next()) {
                estudiante = new DTOestudiante();
                estudiante.setId_estudiante(rs.getInt(1));
                estudiante.setApellido(rs.getString(2));
                estudiante.setNombre(rs.getString(3));
                estudiante.setDni(rs.getInt(4));
                estudiante.setSexo(rs.getString(5));
                estudiante.setFecha(rs.getString(6));
                estudiante.setResponsable(rs.getString(7));
                Lista.add(estudiante);
            }//fin while
        } catch (Exception ex) {
            Mensajes("ERROR no se puede listar los estudiantes " + ex);
        }
        return Lista;
    }//fin listar

    @Override
    public DTOestudiante ObtenerEstudiante(int id) {
        String SQL = "select * from estudiante where id_estudiante=?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                estudiante.setApellido(rs.getString(1));
                estudiante.setNombre(rs.getString(2));
            }
        } catch (Exception ex) {
            Mensajes("ERROR no se puede obtener estso " + ex);
        }
        return estudiante;
    }//fin obtener estso

    @Override
    public boolean AgregarEstudiante(DTOestudiante est) {
        String SQL = "insert into estudiante (apellido,nombre,dni,sexo,fecha,responsable) values(?,?,?,?,?,?);";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1, est.getApellido());
            ps.setString(2, est.getNombre());
            ps.setInt(3, est.getDni());
            ps.setString(4, est.getSexo());
            ps.setString(5, est.getFecha());
            ps.setString(6, est.getResponsable());
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede insertar estso " + ex);
        }
        return false;
    }//fin agregar

    @Override
    public boolean EditarEstudiante(DTOestudiante est) {
        String SQL = "update estudiante set apellido=?,nombre=?,dni=?,sexo=?,fecha=?,responsable=? where id_estudiante=?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1, est.getApellido());
            ps.setString(2, est.getNombre());
            ps.setInt(3, est.getDni());
            ps.setString(4, est.getSexo());
            ps.setString(5, est.getFecha());
            ps.setString(6, est.getResponsable());
            ps.setInt(7, est.getId_estudiante());
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede editar estudiante " + ex);
        }
        return false;
    }

    @Override
    public boolean EliminarEstudiante(int id) {
        String SQL = "DELETE FROM estudiante WHERE id_estudiante = ?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede eliminar estudiante " + ex);
        }
        return false;
    }//fin eliminar    

}//fin de la clase
