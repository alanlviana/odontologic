package br.com.odontologic.dao;


import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.Odontologo;
import br.com.odontologic.model.enums.StatusConsulta;

public class OdontologoDAO implements DAO<Odontologo> {

	@Inject
	private EntityManager em;

	@Override
	public Odontologo insert(Odontologo object) {
		//em.getTransaction().begin();
		em.persist(object.getEndereco());
		em.persist(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Odontologo update(Odontologo object) {
		//em.getTransaction().begin();
		object.setEndereco(em.merge(object.getEndereco()));
		object = em.merge(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Odontologo delete(Odontologo object) {
		//em.getTransaction().begin();
		object = selectById(object);
		object.setAtivo(false);
		object = em.merge(object);
		//em.getTransaction().commit();

		return object;
	}

	@Override
	public Odontologo selectById(Odontologo object) {
		//em.getTransaction().begin();
		object = em.find(Odontologo.class, object.getId());
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public List<Odontologo> selectAll() {
		//em.getTransaction().begin();
		TypedQuery<Odontologo> tq = em.createQuery(
				"SELECT o FROM Odontologo o where o.ativo = :ativo",
				Odontologo.class);
		tq.setParameter("ativo", true);

		List<Odontologo> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}

	public List<Odontologo> selectAllByFilter(String filtro, Integer inicio,
			Integer quantidade) {

		TypedQuery<Odontologo> tq = em
				.createQuery(
						"SELECT o FROM Odontologo o where (o.ativo = :ativo) and (o.nome LIKE :nome)",
						Odontologo.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%" + filtro + "%");

		if (inicio != null) {
			tq.setFirstResult(inicio);
		}

		if (quantidade != null) {
			tq.setMaxResults(quantidade);
		}

		List<Odontologo> list = tq.getResultList();
		return list;
	}
	
	public List<Odontologo> SelecionaPorNomeDisponivel(String nome,Date inicio,Date fim,Consulta consulta){
		
		//em.getTransaction().begin();
		
		String filtraCodigoConsulta = "";
		
		if (consulta.getId() != 0){
			filtraCodigoConsulta = "AND (c.id <> "+consulta.getId().toString()+")";
		}
		
		TypedQuery<Odontologo> tq = em
				.createQuery(
						"SELECT o "
						+ "FROM Odontologo o "
						+"WHERE (o.ativo = :ativo) "
						+ "AND (upper(o.nome) LIKE upper(:nome))"
						+"  AND o not in (SELECT c.odontologo "
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
						Odontologo.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%" + nome + "%");
		tq.setParameter("inicio", inicio,TemporalType.TIMESTAMP);
		tq.setParameter("status", StatusConsulta.AGENDADA);
		tq.setParameter("fim", fim,TemporalType.TIMESTAMP);

		
		List<Odontologo> list = tq.getResultList();
		//em.getTransaction().commit();
		
		return list;
	}
	
	

}
