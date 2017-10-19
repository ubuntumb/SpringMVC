package marcos.demo.servicio.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import marcos.demo.dao.ContactoDao;
import marcos.demo.entity.Contacto;
import marcos.demo.servicio.ServicioContacto;

@Service("servicioContacto")
@Transactional
public class ServicioContactoImpl implements ServicioContacto {
	
	
	@Autowired
	private ContactoDao dao;

	@Override
	public void add(Contacto entity) {
			dao.add(entity);	
	}

	@Override
	public List<Contacto> getAll() {
		return dao.getAll();
	}

	@Override
	public void remove(Integer id) {
		dao.remove(id);
	}

	@Override
	public void update(Contacto entity) {
		dao.update(entity);
	}

	@Override
	public Contacto getById(Integer id) {
		return dao.getById(id);
	}
	


}
