package br.com.odontologic.dao;

import java.util.List;


public interface DAO<T> {
	
	public T insert(T object);
	public T update(T object);
	public T delete(T object);
	public T selectById(T object);
	public List<T> selectAll();
	

}
