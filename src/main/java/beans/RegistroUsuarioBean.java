package beans;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import controller.dao.IUsuarioDAO;
import controller.impl.UsuarioImpl;

@ManagedBean
public class RegistroUsuarioBean {
	
	private String identificacion;
	//private String clave;

	public String getIdentificacion() {
		return identificacion;
	}

	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}

	public void verficarUsuario() {
		
		String mensaje="Ud no tiene un usuario";
		IUsuarioDAO usuarioDAO= new UsuarioImpl();
		mensaje=usuarioDAO.verificarUsuario(identificacion);
		FacesContext context = FacesContext.getCurrentInstance();
	    
	    context.addMessage(null, new FacesMessage("Successful", mensaje) );
	    //
	};
}
