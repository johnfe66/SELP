package model;

public class Usuario {
	private int id;
	private String clave;
	private Persona persona;
	private Role role;
	private Estado estado;
	public int getId() {
		return id;
	}
	public String getClave() {
		return clave;
	}
	public Persona getPersona() {
		return persona;
	}
	public Role getRole() {
		return role;
	}
	public Estado getEstado() {
		return estado;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	
	
	

}
