package model;

public class Estado {
	
	private int id;
	private String estado;
	private String descripcion;
	private TipoEstado idTipoEstado;
	
	public TipoEstado getIdTipoEstado() {
		return idTipoEstado;
	}
	public void setIdTipoEstado(TipoEstado idTipoEstado) {
		this.idTipoEstado = idTipoEstado;
	}
	public int getId() {
		return id;
	}
	public String getEstado() {
		return estado;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	

}
