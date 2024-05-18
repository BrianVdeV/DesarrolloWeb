package Persistencia;

import java.sql.*;

public class Conexion implements Parametros {

    public Connection con;
    public PreparedStatement ps;
    public Statement st;
    public ResultSet rs;
    public String mensaje;

    public Conexion() {
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, CLAVE);
            st = con.createStatement();
            mensaje = "Conexión OK!!!";
        } catch (Exception ex) {
            mensaje = "ERROR al conectar base de datos." + ex.getMessage();
        }//fin del try
    }//fin del constructor
}//fin de la clase
