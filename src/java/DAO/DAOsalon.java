package DAO;

import Modelo.DTOsalon;
import Persistencia.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class DAOsalon extends Conexion {

    DTOsalon salon = new DTOsalon();

    public DAOsalon() {
    }

    public void Mensajes(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }

    public ArrayList<DTOsalon> ListarSalones() {
        ArrayList<DTOsalon> Lista = new ArrayList();
        String SQL = "SELECT * FROM salon;";
        try {
            rs = smt.executeQuery(SQL);
            while (rs.next()) {
                salon = new DTOsalon();
                salon.setId_salon(rs.getInt(1));
                salon.setNombre(rs.getString(2));
                salon.setCapacidad(rs.getInt(3));
                salon.setUbicacion(rs.getString(4));
                salon.setDescripcion(rs.getString(5));
                Lista.add(salon);
            }
        } catch (Exception ex) {
            Mensajes("ERROR no se puede listar los salones " + ex);
        }
        return Lista;
    }

    public DTOsalon ObtenerSalon(int id) {
        String SQL = "SELECT * FROM salon WHERE id_salon=?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                salon.setId_salon(rs.getInt(1));
                salon.setNombre(rs.getString(2));
                salon.setCapacidad(rs.getInt(3));
                salon.setUbicacion(rs.getString(4));
                salon.setDescripcion(rs.getString(5));
            }
        } catch (Exception ex) {
            Mensajes("ERROR no se puede obtener salón " + ex);
        }
        return salon;
    }

    public boolean AgregarSalon(DTOsalon sal) {
        String SQL = "INSERT INTO salon (nombre, capacidad, ubicacion, descripcion) VALUES (?, ?, ?, ?);";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1, sal.getNombre());
            ps.setInt(2, sal.getCapacidad());
            ps.setString(3, sal.getUbicacion());
            ps.setString(4, sal.getDescripcion());
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede insertar salón " + ex);
        }
        return false;
    }

    public boolean EditarSalon(DTOsalon sal) {
        String SQL = "UPDATE salon SET nombre=?, capacidad=?, ubicacion=?, descripcion=? WHERE id_salon=?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1, sal.getNombre());
            ps.setInt(2, sal.getCapacidad());
            ps.setString(3, sal.getUbicacion());
            ps.setString(4, sal.getDescripcion());
            ps.setInt(5, sal.getId_salon());
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede editar salón " + ex);
        }
        return false;
    }

    public boolean EliminarSalon(int id) {
        String SQL = "DELETE FROM salon WHERE id_salon = ?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede eliminar salón " + ex);
        }
        return false;
    }
}
