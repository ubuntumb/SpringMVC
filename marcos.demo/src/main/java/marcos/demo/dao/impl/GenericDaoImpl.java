package marcos.demo.dao.impl;

import java.io.Serializable;
import java.util.List;

import marcos.demo.dao.GenericsDao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public abstract class GenericDaoImpl<T extends Serializable> implements GenericsDao<T>{

	@Autowired
	private SessionFactory sessionFactory;

	private Class<?> clazz;

	public GenericDaoImpl(Class<?> clazz) {
		this.clazz = clazz;
	}

	public void add(T entity) {
		getSession().save(entity);
		getSession().flush();
	}

	@Transactional(readOnly = true)
	public List<T> getAll() {
		Criteria criteria = getSession().createCriteria(clazz);
		return criteria.list();
	}

	public void remove(Object id){
		T entity = getById(id);
		getSession().delete(entity);
		getSession().flush();
	}

	public void update(T entity){
		getSession().update(entity);
		getSession().flush();
	}

	public T getById(Object id){
		return (T) getSession().get(clazz, (Serializable) id);
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

}
