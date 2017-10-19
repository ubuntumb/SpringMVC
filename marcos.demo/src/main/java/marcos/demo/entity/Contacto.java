package marcos.demo.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="contacto")
public class Contacto implements Serializable {
	
	@Id
	 @Column(name="id")
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 private Integer id;
	
	@Column(name="nombre")
	 private String nombre;

	 @Column(name="apellido")
	 private String apellido;

	 @Column(name="email")
	 private String email;

	 @NotNull
	 @NotBlank
	 @Column(name="nro_telefono")
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
