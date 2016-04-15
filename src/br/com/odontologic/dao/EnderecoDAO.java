package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Cidade;
import br.com.odontologic.model.Estado;


public class EnderecoDAO {

	@Inject private EntityManager em;
	
	public List<Cidade> getCidades(Estado estado){
		//em.getTransaction().begin();
		TypedQuery<Cidade> tq = em.createQuery("SELECT c FROM Cidade c WHERE c.estado = :estado",Cidade.class);
		tq.setParameter("estado", estado);
		
		List<Cidade> list = tq.getResultList();
		//em.getTransaction().commit();
		return list ;
	}
	
}
