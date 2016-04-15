package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Receber;

public class ReceberDAO implements DAO<Receber>{
	
	@Inject private EntityManager em;

	@Override
	public Receber insert(Receber object) {
		em.persist(object);
		return object;
	}

	@Override
	public Receber update(Receber object) {
		//em.getTransaction().begin();
		object = em.merge(object);
		//em.getTransaction().commit();
		
		return object;
	}

	@Override
	public Receber delete(Receber object) {
		object = selectById(object);
		//em.getTransaction().begin();
		object.setAtivo(false);
		object = em.merge(object);
		//em.getTransaction().commit();
			
		return object;
	}

	@Override
	public Receber selectById(Receber object) {
		//em.getTransaction().begin();
		object = em.find(Receber.class, object.getId());
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public List<Receber> selectAll() {
		//em.getTransaction().begin();
		TypedQuery<Receber> tq = em.createQuery("SELECT r FROM Receber r where r.ativo = :ativo",Receber.class);
		tq.setParameter("ativo", true);
		
		List<Receber> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}
	
	public List<Receber> selectByFilter(String filtro){
		TypedQuery<Receber> tq = em.createQuery("SELECT r FROM Receber r where (r.ativo = :ativo) and ((r.paciente.nome LIKE :nome) or (r.paciente.cpf LIKE :cpf))",Receber.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%"+filtro+"%");
		tq.setParameter("cpf", "%"+filtro+"%");
		
		List<Receber> list = tq.getResultList();
		return list;
	}
}
