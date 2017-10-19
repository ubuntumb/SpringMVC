package marcos.demo.dao;

import java.util.List;

import marcos.demo.entity.Contacto;

public interface ContactoDao{

	public void add(Contacto entity);

	public List<Contacto> getAll();

	public void remove(Integer id);

	public void update(Contacto entity);

	public Contacto getById(Integer id);
}
