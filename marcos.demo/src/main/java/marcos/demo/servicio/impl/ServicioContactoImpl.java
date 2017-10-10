package marcos.demo.servicio.impl;

import marcos.demo.dao.ContactoDao;
import marcos.demo.dao.GenericsDao;
import marcos.demo.entity.Contacto;
import marcos.demo.servicio.ServicioContacto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioContactoImpl extends GenericsServiceImpl<Contacto> implements ServicioContacto {
	
	private  final Logger logger = LoggerFactory.getLogger(ServicioContactoImpl.class);
	
	@Autowired
	private ContactoDao contactoDao;
	
	public ServicioContactoImpl(){
		logger.info("se instancia la clase ServicioContactoImpl");
	}

	@Override
	public GenericsDao<Contacto> getDao() {
		return this.contactoDao;
	}
	

}
