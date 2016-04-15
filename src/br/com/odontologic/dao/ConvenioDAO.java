package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Convenio;

public class ConvenioDAO implements DAO<Convenio> {

	@Inject private EntityManager em;
	
	@Override
	public Convenio insert(Convenio object) {
		//em.getTransaction().begin();
		em.persist(object.getEndereco());
		em.persist(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Convenio update(Convenio object) {
		//em.getTransaction().begin();
		object.setEndereco(em.merge(object.getEndereco()));
		object = em.merge(object);
		//em.getTransaction().commit();
		
		return object;
	}

	@Override
	public Convenio delete(Convenio object) {
		object = selectById(object);
		//em.getTransaction().begin();
		object.setAtivo(false);
		object = em.merge(object);
		//em.getTransaction().commit();
			
		return object;
	}

	@Override
	public Convenio selectById(Convenio object) {
		//em.getTransaction().begin();
		object = em.find(Convenio.class, object.getId());
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public List<Convenio> selectAll() {
		//em.getTransaction().begin();
		TypedQuery<Convenio> tq = em.createQuery("SELECT c FROM Convenio c where c.ativo = :ativo",Convenio.class);
		tq.setParameter("ativo", true);
		
		List<Convenio> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}
	
	public List<Convenio> selectByFilter(String filtro){
		TypedQuery<Convenio> tq = em.createQuery("SELECT c FROM Convenio c where (c.ativo = :ativo) and ((c.nome LIKE :nome) or (c.registroANS LIKE :registroANS))",Convenio.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%"+filtro+"%");
		tq.setParameter("registroANS", "%"+filtro+"%");
		
		List<Convenio> list = tq.getResultList();
		return list;
	}

}
