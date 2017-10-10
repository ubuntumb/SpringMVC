package marcos.demo.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contacto")
public class Contacto implements Serializable {
	
	@Id
	 @Column(name="ID")
	 @GeneratedValue
	 private Integer id;
	
	@Column(name="NOMBRE")
	 private String nombre;

	 @Column(name="APELLIDO")
	 private String apellido;

	 @Column(name="EMAIL")
	 private String email;

	 @Column(name="NROTELEFONO")
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
