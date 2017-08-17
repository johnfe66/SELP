package model;

public class Ciudad {

	private int id;
	private String nombre;
	private Departamento idDepartamento;
	
	public int getId() {
		return id;
	}
	public String getNombre() {
		return nombre;
	}
	public Departamento getIdDepartamento() {
		return idDepartamento;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setIdDepartamento(Departamento idDepartamento) {
		this.idDepartamento = idDepartamento;
	}

}
