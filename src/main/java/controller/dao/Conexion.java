package controller.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Conexion {
	private String usuario;
    private String bd;
    private String clave;
    private String ip;
    private String puerto;
    private Connection connection;

    public void HacerConexion() {

        try {

        	InputStream inputStream = Conexion.class.getClassLoader().getResourceAsStream("/BDpropiedades.properties");
            Properties props = new Properties();
            props.load(inputStream);
            ip = props.getProperty("ip");
            usuario = props.getProperty("usuario");
            clave = props.getProperty("clave");
            bd = props.getProperty("bd");;
            puerto=props.getProperty("puerto");

            Class.forName("com.mysql.jdbc.Driver");
            setConnection(DriverManager.getConnection("jdbc:mysql://" + ip + ":"+puerto+"/" + bd, usuario, clave));
            System.out.println("Conexion exitosa");
        } catch (IOException | ClassNotFoundException | SQLException ex) {
            
            System.out.println("Error en la conexion: " + ex);
        }
    }

    /**
     * @return the connection
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * @param connection the connection to set
     */
    public void setConnection(Connection connection) {
        this.connection = connection;
    }
}
