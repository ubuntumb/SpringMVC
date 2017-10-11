package marcos.demo.dto;

import java.io.Serializable;


public class Contacto implements Serializable {
	
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Contacto () {}

	private Integer id;
	
	 private String nombre;

	 private String apellido;

	 private String email;

	 private String telefono;

	 public String getEmail() {
		 return email;
	 }
	 
	 public String getTelefono() {
		 return telefono;
	 }
	 
	 public void setEmail(String email) {
		 this.email = email;
	 }
	 
	 public void setTelefono(String telefono) {
		 this.telefono = telefono;
	 }
	 
	 public String getNombre() {
		 return nombre;
	 }
	 
	 public String getApellido() {
		 return apellido;
	 }
	 
	 public void setNombre(String nombre) {
		 this.nombre = nombre;
	 }
	 
	 public void setApellido(String apellido) {
		 this.apellido = apellido;
	 }
	 
	 public Integer getId() {
		 return id;
	 }
	 
	 public void setId(Integer id) {
		 this.id = id;
	 }
}
