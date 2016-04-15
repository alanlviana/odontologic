package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Estado;

public class EstadoDAO {
	@Inject private EntityManager em;
	
	public List<Estado> selectAll(){
		//em.getTransaction().begin();
		TypedQuery<Estado> tq = em.createQuery("SELECT e FROM Estado e",Estado.class);
		List<Estado> listaEstados = tq.getResultList();
		//em.getTransaction().commit();
		return listaEstados;
	}

	public void atualizaTodos(List<Estado> listaEstado) {
		Query query = em.createQuery("DELETE FROM Cidade c");
		query.executeUpdate();
		
		query = em.createQuery("DELETE FROM Estado e");
		query.executeUpdate();
		
		//em.createNativeQuery("ALTER TABLE Estado AUTO_INCREMENT = 1").executeUpdate();
		
		for(Estado estado:listaEstado){
			em.merge(estado);
		}
	}
}
