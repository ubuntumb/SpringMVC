package marcos.demo.dao.impl;

import org.springframework.stereotype.Repository;

import marcos.demo.dao.ContactoDao;
import marcos.demo.dao.AbstractDao;
import marcos.demo.entity.Contacto;

@Repository
public class ContactoDaoImpl extends AbstractDao<Integer, Contacto> implements ContactoDao {

	public ContactoDaoImpl() {
		this.setClazz(Contacto.class);
	}

}
