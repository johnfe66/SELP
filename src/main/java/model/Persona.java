package model;

public class Persona {
	
 private int id;
 private Ciudad idCiudad;
 private String nombre;
 private String apellido1;
 private String apellido2;
 private String genero;
 private String email;
 private String identificacion;
 private String tipoIdentificacion;
 private String urlFoto;
public int getId() {
	return id;
}
public Ciudad getIdCiudad() {
	return idCiudad;
}
public String getNombre() {
	return nombre;
}
public String getApellido1() {
	return apellido1;
}
public String getApellido2() {
	return apellido2;
}
public String getGenero() {
	return genero;
}
public String getEmail() {
	return email;
}
public String getIdentificacion() {
	return identificacion;
}
public String getTipoidentificacion() {
	return tipoIdentificacion;
}
public String getUrlFoto() {
	return urlFoto;
}
public void setId(int id) {
	this.id = id;
}
public void setIdCiudad(Ciudad idCiudad) {
	this.idCiudad = idCiudad;
}
public void setNombre(String nombre) {
	this.nombre = nombre;
}
public void setApellido1(String apellido1) {
	this.apellido1 = apellido1;
}
public void setApellido2(String apellido2) {
	this.apellido2 = apellido2;
}
public void setGenero(String genero) {
	this.genero = genero;
}
public void setEmail(String email) {
	this.email = email;
}
public void setIdentificacion(String identificacion) {
	this.identificacion = identificacion;
}
public void setTipoidentificacion(String tipoIdentificacion) {
	this.tipoIdentificacion = tipoIdentificacion;
}
public void setUrlFoto(String urlFoto) {
	this.urlFoto = urlFoto;
}
 

}
