package marcos.demo.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractDao<PK extends Serializable, T>{

	@Autowired
	protected SessionFactory sessionFactory;

	private Class<T> clazz;

	public void setClazz( final Class<T> clazzToSet) {
		this.clazz = clazzToSet;
	}
	
	public void add(T entity) {
		getSession().persist(entity);
		getSession().flush();
	}

	public List<T> getAll() {
		Criteria criteria = getSession().createCriteria(clazz);
		return criteria.list();
	}

	public void remove(PK id){
		T entity = getById(id);
		getSession().delete(entity);
		getSession().flush();
	}

	public void update(T entity){
		getSession().update(entity);
		getSession().flush();
	}

	public T getById(PK id){
		return (T) getSession().get(clazz, id);
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	protected Criteria createEntityCriteria(){
		return getSession().createCriteria(clazz);
	}

}
