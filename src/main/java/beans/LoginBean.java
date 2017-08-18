package beans;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import controller.dao.IUsuarioDAO;
import controller.impl.UsuarioImpl;

@ManagedBean
public class LoginBean {
	
	private String txtUsuario;
	private String txtClave;
	
	
	public void validarUsuario() {
		String mensaje="";
		IUsuarioDAO usuarioDAO= new UsuarioImpl();
		
		mensaje=usuarioDAO.login(txtUsuario, txtClave);
		FacesContext context = FacesContext.getCurrentInstance();
	    
	    context.addMessage(null, new FacesMessage("Successful", mensaje) );
	    context.addMessage(null, new FacesMessage("Second Message", mensaje));
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
