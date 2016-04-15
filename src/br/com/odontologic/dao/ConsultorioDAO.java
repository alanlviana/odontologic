package br.com.odontologic.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.Consultorio;
import br.com.odontologic.model.enums.StatusConsulta;

public class ConsultorioDAO implements DAO<Consultorio> {

	@Inject private EntityManager em; 
	
	@Override
	public Consultorio insert(Consultorio object) {
		//em.getTransaction().begin();
		em.persist(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Consultorio update(Consultorio object) {
		//em.getTransaction().begin();
		object = em.merge(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Consultorio delete(Consultorio object) {
		object = selectById(object);
		//em.getTransaction().begin();
		object.setAtivo(false);
		object = em.merge(object);
		//em.getTransaction().commit();

		return object;
	}

	@Override
	public Consultorio selectById(Consultorio object) {
		//em.getTransaction().begin();
		object = em.find(Consultorio.class, object.getId());
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public List<Consultorio> selectAll() {
		//em.getTransaction().begin();
		TypedQuery<Consultorio> tq = em
				.createQuery("SELECT c FROM Consultorio c where c.ativo = :ativo",
						Consultorio.class);
		tq.setParameter("ativo", true);

		List<Consultorio> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}
	
	public List<Consultorio> selectAllByFilter(String filter) {
		//em.getTransaction().begin();
		TypedQuery<Consultorio> tq = em
				.createQuery("SELECT c FROM Consultorio c where c.ativo = :ativo and c.descricao like :descricao",
						Consultorio.class);
		tq.setParameter("ativo", true);
		tq.setParameter("descricao", "%"+filter+"%");

		List<Consultorio> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}

	public List<Consultorio> SelecionaPorNomeDisponivel(String filtro,
			Date inicio, Date fim, Consulta consulta) {
		String filtraCodigoConsulta = "";
		
		if (consulta.getId() != 0){
			filtraCodigoConsulta = "AND (c.id <> "+consulta.getId().toString()+")";
		}
		
		TypedQuery<Consultorio> tq = em
				.createQuery(
						"SELECT co "
						+ "FROM Consultorio co "
						+"WHERE (co.ativo = :ativo) "
						+ "AND (upper(co.descricao) LIKE upper(:nome))"
						+"  AND co not in (SELECT c.consultorio "
						            + "FROM Consulta c "
						            + "WHERE "
						            + " ("
						            	+" (:inicio BETWEEN c.inicio AND c.fim) "
						            	+"OR"
						            	+" (:inicio < c.inicio AND :fim > c.inicio) "
						            + "  )"
						            +" AND (c.statusConsulta = :status)"
						            + filtraCodigoConsulta						            
						            + ")",
						Consultorio.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%" + filtro + "%");
		tq.setParameter("inicio", inicio,TemporalType.TIMESTAMP);
		tq.setParameter("status", StatusConsulta.AGENDADA);
		tq.setParameter("fim", fim,TemporalType.TIMESTAMP);

		
		List<Consultorio> list = tq.getResultList();
		
		return list;

	}

}
