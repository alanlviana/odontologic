package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.Consultorio;
import br.com.odontologic.model.Odontologo;
import br.com.odontologic.model.enums.StatusConsulta;


public class ConsultaDAO implements DAO<Consulta> {

	@Inject private EntityManager em;
	
	@Override
	public Consulta insert(Consulta object) {
		em.persist(object);
		return object;
	}

	@Override
	public Consulta update(Consulta object) {
		object = em.merge(object);
		return object;
	}

	@Override
	public Consulta delete(Consulta object) {
		object = selectById(object);
		//em.getTransaction().begin();
		object.setAtivo(false);
		object = em.merge(object);
		//em.getTransaction().commit();

		return object;
	}

	@Override
	public Consulta selectById(Consulta object) {
		//em.getTransaction().begin();
		object = em.find(Consulta.class, object.getId());
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public List<Consulta> selectAll() {
		//em.getTransaction().begin();
		TypedQuery<Consulta> tq = em
				.createQuery("SELECT c FROM Consulta c where c.ativo = :ativo",
						Consulta.class);
		tq.setParameter("ativo", true);

		List<Consulta> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}
	
	public List<Consulta> selectListConsulta(Odontologo odontologo,Consultorio consultorio,StatusConsulta status) {
		String sql = "SELECT c FROM Consulta c "
					+ "where c.ativo = :ativo ";
		
		boolean odontologoTest = !(odontologo == null)  && !(odontologo.getId() == null) && (!odontologo.getId().equals(0)); 
		boolean consultorioTest = !(consultorio == null)  && !(consultorio.getId() == null) && (!consultorio.getId().equals(0));
		
		if (odontologoTest){
			sql += "and c.odontologo = :odontologo ";
		}
		
		if (consultorioTest){
			sql += "and c.consultorio = :consultorio ";
		}
		
		if (status != null){
			sql += "and c.statusConsulta = :status ";
		}
		
		//em.getTransaction().begin();
		TypedQuery<Consulta> tq = em
				.createQuery(sql,
						Consulta.class);
		
		tq.setParameter("ativo", true);

		if (odontologoTest){
			odontologo = em.find(Odontologo.class, odontologo.getId());
			tq.setParameter("odontologo", odontologo);
		}
		
		if (consultorioTest){
			consultorio = em.find(Consultorio.class, consultorio.getId());
			tq.setParameter("consultorio", consultorio);
		}
		
		if (status != null){			
			tq.setParameter("status", status);
		}		
		
		List<Consulta> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}
	
}
