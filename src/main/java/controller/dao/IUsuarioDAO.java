package controller.dao;

public interface IUsuarioDAO {
	
	public String login(String usuario, String clave);
	public int verificarUsuario(String identificacion);

}
