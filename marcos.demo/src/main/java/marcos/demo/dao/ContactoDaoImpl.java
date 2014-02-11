package marcos.demo.dao;

import java.util.ArrayList;

import marcos.demo.form.Contacto;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ContactoDaoImpl implements ContactoDao {
	
	private  final Logger logger = LoggerFactory.getLogger(ContactoDaoImpl.class);
	@Autowired
	private SessionFactory	sessionFactory;
	
	public ContactoDaoImpl(){
		logger.info("se instancia la clase Contacto Dao");
	}
	public void addContact(Contacto contacto) {
		// TODO Auto-generated method stub
		 sessionFactory.getCurrentSession().save(contacto);
	}
	@SuppressWarnings("unchecked")
	public ArrayList<Contacto> listContact() {
		// TODO Auto-generated method stub
		ArrayList<Contacto> lista = new ArrayList<Contacto>();
		Log logg = LogFactory.getLog(getClass());
		logg.info("Session actual: "+sessionFactory.getCurrentSession());
		lista = (ArrayList<Contacto>) sessionFactory.getCurrentSession().createQuery("from Contacto").list();
		return lista;
	}

	public void removeContact(Integer id) {
		// TODO Auto-generated method stub
		 Contacto contacto = (Contacto) sessionFactory.getCurrentSession().load(Contacto.class, id);
	     
		 if (null != contacto) {
			 sessionFactory.getCurrentSession().delete(contacto);
		 }
		
	}

	public  Session getSession() {
		// TODO Auto-generated method stub
		return  sessionFactory.getCurrentSession();
	}
	
	public void updateContact(Contacto contacto) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().merge(contacto);
	}
	
	public Contacto getContactoId(Integer id) {
		// TODO Auto-generated method stub
		return (Contacto) sessionFactory.getCurrentSession().get(Contacto.class, id);
	}
}
