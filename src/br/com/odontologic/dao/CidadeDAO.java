package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Cidade;
import br.com.odontologic.model.Estado;

public class CidadeDAO {

	@Inject private EntityManager em;
	
	public List<Cidade> selectAll(){
		//em.getTransaction().begin();
		TypedQuery<Cidade> tq = em.createQuery("SELECT c FROM Cidade c",Cidade.class);
		List<Cidade> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}
	
	public List<Cidade> selectAllbyEstado(Estado estado){
		//em.getTransaction().begin();
		TypedQuery<Cidade> tq = em.createQuery("SELECT c FROM Cidade c where c.estado = :estado",Cidade.class);
		tq.setParameter("estado", estado);
		List<Cidade> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}

	public void atualizaTodos(List<Cidade> listaCidade) {
		Query query = em.createQuery("DELETE FROM Cidade c");
		query.executeUpdate();
		
		//em.createNativeQuery("ALTER TABLE Cidade AUTO_INCREMENT = 1").executeUpdate();
		
		int index = 0;
		for(Cidade cidade:listaCidade){
			index++;
			em.merge(cidade);
			if (index % 100 == 0){
				em.flush();
				em.clear();
			}
			System.out.println("Cidades carregadas "+index+"/"+listaCidade.size());
		}
		
	}
	
	public List<Cidade> getCidades(Estado estado){
		TypedQuery<Cidade> tq = em.createQuery("SELECT c FROM Cidade c WHERE c.estado = :estado",Cidade.class);
		tq.setParameter("estado", estado);
		
		List<Cidade> list = tq.getResultList();
		return list ;
	}	
	
}
