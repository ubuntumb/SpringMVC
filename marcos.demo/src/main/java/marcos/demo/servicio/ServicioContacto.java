package marcos.demo.servicio;

import java.util.ArrayList;

import org.hibernate.Session;

import marcos.demo.form.Contacto;

public interface ServicioContacto {
	
	public void addContact(Contacto contacto);
	public ArrayList<Contacto> listContact();
	public void removeContact(Integer id);
	public void updateContact(Contacto contacto);
	public Contacto getContactoId(Integer id);
	public Session getSeccion();
}
