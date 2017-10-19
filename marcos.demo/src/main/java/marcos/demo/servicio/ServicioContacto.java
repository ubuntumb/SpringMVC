package marcos.demo.servicio;

import java.util.List;

import marcos.demo.entity.Contacto;


public interface ServicioContacto{
	public void add(Contacto entity);

	public List<Contacto> getAll();

	public void remove(Integer id);

	public void update(Contacto entity);

	public Contacto getById(Integer id);
}
