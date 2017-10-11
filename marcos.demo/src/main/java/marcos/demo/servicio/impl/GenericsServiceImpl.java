package marcos.demo.servicio.impl;

import java.io.Serializable;
import java.util.List;

import marcos.demo.dao.GenericsDao;
import marcos.demo.servicio.GenericsService;

public abstract class GenericsServiceImpl<T extends Serializable> implements
		GenericsService<T> {

	public abstract GenericsDao<T> getDao();

	public GenericsServiceImpl() {
	}

	@Override
	public void add(T entity) {

		getDao().add(entity);
	}

	@Override
	public List<T> getAll() {

		return getDao().getAll();
	}

	@Override
	public void remove(Object id) {
		getDao().remove(id);
	}

	@Override
	public void update(T entity) {
		getDao().update(entity);
	}

	@Override
	public T getById(Object id) {

		return getDao().getById(id);
	}

}
