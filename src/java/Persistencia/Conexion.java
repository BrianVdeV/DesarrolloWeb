
package Persistencia;
import java.sql.*;
public class Conexion implements Parametros{
      public Connection con;
      public PreparedStatement ps;           
       public Statement smt;
       public ResultSet rs;
       public String mensaje;
       public Conexion(){
           try{
                Class.forName(Driver);
                con = DriverManager.getConnection(url, user, clave);            
                smt = con.createStatement();
                mensaje="Conexion OK!!!!";
            }catch(Exception ex){
                mensaje="ERROR al conectar base de datos";      
       }
     }
     public Connection getConnection(){
        return con;
    }
}
