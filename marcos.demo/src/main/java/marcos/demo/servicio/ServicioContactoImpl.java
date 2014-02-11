package marcos.demo.servicio;

import java.util.ArrayList;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import marcos.demo.dao.ContactoDao;
import marcos.demo.form.Contacto;

@Service
public class ServicioContactoImpl implements ServicioContacto{
	
	private  final Logger logger = LoggerFactory.getLogger(ServicioContactoImpl.class);
	@Autowired
	private ContactoDao contactoDao;
	
	public ServicioContactoImpl(){
		
		logger.info("se instancia la clase ServicioContactoImpl");
	}
	
	@Transactional
	public void addContact(Contacto contacto) {
		// TODO Auto-generated method stub
		contactoDao.addContact(contacto);;
	}
	
	@Transactional
	public ArrayList<Contacto> listContact() {
		// TODO Auto-generated method stub
		ArrayList<Contacto> lista = new ArrayList<Contacto>();
		lista=contactoDao.listContact();
		
		return lista;
	}
	
	@Transactional
	public void removeContact(Integer id) {
		// TODO Auto-generated method stub
		contactoDao.removeContact(id);		
	}
	
	@Transactional
	public Session getSeccion() {
		// TODO Auto-generated method stub
		return contactoDao.getSession();
	}
	
	@Transactional
	public void updateContact(Contacto contacto) {
		// TODO Auto-generated method stub
		contactoDao.updateContact(contacto);
	}
	
	@Transactional
	public Contacto getContactoId(Integer id) {
		// TODO Auto-generated method stub
		return contactoDao.getContactoId(id);
	}

}
