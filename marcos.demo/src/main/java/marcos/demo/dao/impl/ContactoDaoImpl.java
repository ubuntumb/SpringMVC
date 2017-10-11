package marcos.demo.dao.impl;

import marcos.demo.dao.ContactoDao;
import marcos.demo.entity.Contacto;

import org.springframework.stereotype.Repository;

@Repository
public class ContactoDaoImpl extends GenericDaoImpl<Contacto> implements
		ContactoDao {
	
	public ContactoDaoImpl() {
		super(Contacto.class);
	}


}
