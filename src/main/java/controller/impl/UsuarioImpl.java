package controller.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import controller.dao.Conexion;
import controller.dao.IUsuarioDAO;

public class UsuarioImpl implements IUsuarioDAO {

	@Override
	public void login(String usuario, String clave) {
		
		
		try {
            Conexion conexion = new Conexion();
            conexion.HacerConexion();

            conexion.getConnection().setAutoCommit(false);
           
            Statement stmt = conexion.getConnection().createStatement();
            String query = "SELECT role.role, usuario.clave FROM selp.usuario" + 
            		" inner join persona on persona.id= usuario.idpersona" + 
            		" inner join role on role.id= usuario.idrole" + 
            		" inner join estado on estado.id= usuario.idestado" + 
            		" where persona.identificacion= '"+usuario+"' and estado.id='1' ;";
            ResultSet rs = stmt.executeQuery(query);

            if(rs.next()) {
            		if(clave.equals(rs.getString("clave"))) {
            			System.out.println("El usuario se ha identificado correctamente y el role es: "+rs.getString("role"));
            			
            		}else {
            			System.out.println("usuario correcto pero la clave es invalida");
            		}
            		
            }else{
            	
            		System.out.println("El usuario esta incorrecto");
            }
            
            conexion.getConnection().commit();
            conexion.getConnection().close();

        } catch (SQLException e) {
            System.out.println("Error listar categorias: " + e);
            
        }


	}

}
