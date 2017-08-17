package beans;

import javax.faces.bean.ManagedBean;

import controller.dao.IUsuarioDAO;
import controller.impl.UsuarioImpl;

@ManagedBean
public class LoginBean {
	
	private String txtUsuario;
	private String txtClave;
	
	
	public void validarUsuario() {
		IUsuarioDAO usuarioDAO= new UsuarioImpl();
		
		usuarioDAO.login(txtUsuario, txtClave);
	}
	
	public String getTxtUsuario() {
		return txtUsuario;
	}
	public void setTxtUsuario(String txtUsuario) {
		this.txtUsuario = txtUsuario;
	}
	public String getTxtClave() {
		return txtClave;
	}
	public void setTxtClave(String txtClave) {
		this.txtClave = txtClave;
	}
	

}
