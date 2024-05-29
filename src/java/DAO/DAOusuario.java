package DAO;
import Modelo.DTOusuario;
import Persistencia.*;
public class DAOusuario extends Conexion{
    public DAOusuario() {
    }
    public DTOusuario VerificarUsuario(DTOusuario us) throws Exception{
        DTOusuario usuario=null;
        String consulta="select * from usuario where correo=? and contra=?";
        try{
            ps = con.prepareStatement(consulta);
            ps.setString(1, us.getCorreo());
            ps.setString(2, us.getContra());
            rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new DTOusuario();
                usuario.setId_usuario(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setCorreo(rs.getString(3));
                usuario.setContra(rs.getString(4));
                
            }
        }catch(Exception ex){
            System.out.println("ERROR al consultar..."+ex);
        }
        return usuario;
    }
}
