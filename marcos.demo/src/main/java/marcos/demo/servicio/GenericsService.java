package marcos.demo.servicio;

import java.io.Serializable;
import java.util.List;

public interface GenericsService<T extends Serializable> {

	public void add(T entity);

	public List<T> getAll();

	public void remove(Object id);

	public void update(T entity);

	public T getById(Object id);
}
