package beans;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import controller.dao.IUsuarioDAO;
import controller.impl.UsuarioImpl;

@ManagedBean
@ViewScoped
public class RegistroUsuarioBean {

	private String identificacion;
	private int respuesta;
	// private String clave;
	
	public RegistroUsuarioBean() {
		respuesta = -2;
	}

	public void verficarUsuario() {

		String mensaje = "";

		IUsuarioDAO usuarioDAO = new UsuarioImpl();

		respuesta = usuarioDAO.verificarUsuario(identificacion);
		
		if(respuesta == UsuarioImpl.PERSONA_NO_EXISTE) {
			
			mensaje = "No existes en los registros, consulta con tu instructor";
			
			FacesContext.getCurrentInstance().addMessage(null, 
					new FacesMessage(FacesMessage.SEVERITY_WARN, "¡Precacion!", mensaje));
			
		}else if(respuesta == UsuarioImpl.USUARIO_EXISTE) {
			
			mensaje = "Tu usuario ya existe ¿ Olvidaste tu contraseña ?";
			
			FacesContext.getCurrentInstance().addMessage(null, 
					new FacesMessage(FacesMessage.SEVERITY_WARN, "¡Precacion!", mensaje));
			
		}else {
			
			
			
		}
			
	}
	
	/*
	 * Getters & Setters
	 */
	
	public String getIdentificacion() {
		return identificacion;
	}

	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}

	public int getRespuesta() {
		return respuesta;
	}

	public void setRespuesta(int respuesta) {
		this.respuesta = respuesta;
	}
	
	
}
