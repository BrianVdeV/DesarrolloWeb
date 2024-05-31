package DAO;

import Persistencia.*;
import Modelo.*;
import java.util.*;
import javax.swing.JOptionPane;
import Interfaces.*;

public class DAOdocente extends Conexion implements CRUDdocente {

    DTOdocente docente = new DTOdocente();

    public DAOdocente() {
    }

    public void Mensajes(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje);
    }

    @Override
    public ArrayList<DTOdocente> ListarDocentes() {
        ArrayList<DTOdocente> Lista = new ArrayList();
        String SQL = "select * from docente;";
        try {
            rs = smt.executeQuery(SQL);
            while (rs.next()) {
                docente = new DTOdocente();
                docente.setId_docente(rs.getInt(1));
                docente.setApellido(rs.getString(2));
                docente.setNombre(rs.getString(3));
                docente.setDni(rs.getInt(4));
                docente.setSexo(rs.getString(5));
                docente.setFecha(rs.getString(6));
                Lista.add(docente);
            }//fin while
        } catch (Exception ex) {
            Mensajes("ERROR no se puede listar los docentes " + ex);
        }
        return Lista;
    }//fin listar

    @Override
    public DTOdocente ObtenerDocente(int id) {
        String SQL = "select * from docente where id_docente=?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                docente.setApellido(rs.getString(1));
                docente.setNombre(rs.getString(2));
            }
        } catch (Exception ex) {
            Mensajes("ERROR no se puede obtener docso " + ex);
        }
        return docente;
    }//fin obtener docso

    @Override
    public boolean AgregarDocente(DTOdocente doc) {
        String SQL = "insert into docente (apellido,nombre,dni,sexo,fecha) values(?,?,?,?,?);";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1, doc.getApellido());
            ps.setString(2, doc.getNombre());
            ps.setInt(3, doc.getDni());
            ps.setString(4, doc.getSexo());
            ps.setString(5, doc.getFecha());
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede insertar docso " + ex);
        }
        return false;
    }//fin agregar

    @Override
    public boolean EditarDocente(DTOdocente doc) {
        String SQL = "update docente set apellido=?,nombre=?,dni=?,sexo=?,fecha=? where id_docente=?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setString(1, doc.getApellido());
            ps.setString(2, doc.getNombre());
            ps.setInt(3, doc.getDni());
            ps.setString(4, doc.getSexo());
            ps.setString(5, doc.getFecha());
            ps.setInt(6, doc.getId_docente());
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede editar docente " + ex);
        }
        return false;
    }

    @Override
    public boolean EliminarDocente(int id) {
        String SQL = "DELETE FROM docente WHERE id_docente = ?";
        try {
            ps = super.getConnection().prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            Mensajes("ERROR no se puede eliminar docente " + ex);
        }
        return false;
    }//fin eliminar    

}//fin de la clase
