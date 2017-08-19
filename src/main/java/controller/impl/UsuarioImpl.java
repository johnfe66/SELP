package controller.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import controller.dao.Conexion;
import controller.dao.IUsuarioDAO;

public class UsuarioImpl implements IUsuarioDAO {
	
	/**
	 * Se utiliza para decir que persona no existe en la base de datos
	 */
	public static final int PERSONA_NO_EXISTE = -1;
	
	/**
	 * Se utiliza para decir que persona existe en la base de datos, pero el usuario
	 * aun no ha sido creado
	 */
	public static final int USUARIO_NO_EXISTE = 0;
	
	/**
	 * Se utiliza para decir que la persona y el usuario ya existe
	 */
	public static final int USUARIO_EXISTE = 1;
	
	/**
	 * Se utiliza para decir que hubo un error durante la consulta
	 */
	public static final int ERROR = 2;

	@Override
	public String login(String usuario, String clave) {
		String mensaje = "";

		try {
			Conexion conexion = new Conexion();
			conexion.HacerConexion();

			conexion.getConnection().setAutoCommit(false);

			Statement stmt = conexion.getConnection().createStatement();
			String query = "SELECT role.role, usuario.clave FROM selp.usuario"
					+ " inner join persona on persona.id= usuario.idpersona"
					+ " inner join role on role.id= usuario.idrole"
					+ " inner join estado on estado.id= usuario.idestado" + " where persona.identificacion= '" + usuario
					+ "' and estado.id='1' ;";
			ResultSet rs = stmt.executeQuery(query);

			if (rs.next()) {
				if (clave.equals(rs.getString("clave"))) {
					mensaje = "El usuario se ha identificado correctamente y el role es: " + rs.getString("role");
				} else {
					mensaje = "usuario correcto pero la clave es invalida";
				}

			} else {

				mensaje = "El usuario esta incorrecto";
			}

			conexion.getConnection().commit();
			conexion.getConnection().close();

		} catch (SQLException e) {
			System.out.println("Error listar categorias: " + e);
			mensaje = "Hay un error con la conexion";

		}
		return mensaje;

	}

	@Override
	public int verificarUsuario(String identificacion) {
		
		//String respuesta = "usuario no existe";
		
		int respuesta = USUARIO_NO_EXISTE;
		
		try {
			Conexion conexion = new Conexion();
			conexion.HacerConexion();

			conexion.getConnection().setAutoCommit(false);

			Statement stmt = conexion.getConnection().createStatement();
			String query = "SELECT usuario.id FROM selp.usuario "
					+ "right join persona on persona.id= usuario.idpersona " + "where persona.identificacion= '"
					+ identificacion + "'  ;";
			ResultSet rs = stmt.executeQuery(query);

			if (rs.next()) {

				if (rs.getString("id") == null) {

					respuesta = USUARIO_NO_EXISTE;

				} else {

					respuesta = USUARIO_EXISTE;
				}

			} else {
				respuesta = PERSONA_NO_EXISTE;

			}

			conexion.getConnection().commit();
			conexion.getConnection().close();

		} catch (SQLException e) {
			System.out.println("Error listar categorias: " + e);
			respuesta = ERROR;

		}
		return respuesta;
	}

}
