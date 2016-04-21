package br.com.odontologic.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.Paciente;
import br.com.odontologic.model.enums.StatusConsulta;

public class PacienteDAO implements DAO<Paciente> {

	@Inject private EntityManager em;
	
	@Override
	public Paciente insert(Paciente object) {
		em.persist(object);
		return object;
	}

	@Override
	public Paciente update(Paciente object) {
		object.setEndereco(em.merge(object.getEndereco()));
		object = em.merge(object);
		return object;
	}

	@Override
	public Paciente delete(Paciente object) {
		object = selectById(object);
		object.setAtivo(false);
		object = em.merge(object);
		
		return object;
	}

	@Override
	public Paciente selectById(Paciente object) {
		object = em.find(Paciente.class, object.getId());
		return object;
	}

	@Override
	public List<Paciente> selectAll() {
		TypedQuery<Paciente> tq = em.createQuery("SELECT p FROM Paciente p where p.ativo = :ativo",Paciente.class);
		tq.setParameter("ativo", true);
		
		List<Paciente> list = tq.getResultList();
		return list;
	}
	
	public List<Paciente> selectAllByFilter(String filtro,Integer inicio,Integer quantidade) {
		
		TypedQuery<Paciente> tq = em.createQuery("SELECT p FROM Paciente p where (p.ativo = :ativo) and ((p.nome LIKE :nome) or (p.cpf LIKE :cpf))",Paciente.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%"+filtro+"%");
		tq.setParameter("cpf", "%"+filtro+"%");
		
		if (inicio != null){
			tq.setFirstResult(inicio);
		}
		
		if (quantidade != null){
			tq.setMaxResults(quantidade);
		}
		
		List<Paciente> list = tq.getResultList();
		return list;
	}
	
	public List<Paciente> selectPacienteSemConsulta(String nome,Date inicio,Date fim,Consulta consulta){

		
		String filtraCodigoConsulta = "";
		
		if (consulta.getId() != 0){
			filtraCodigoConsulta = "AND (c.id <> "+consulta.getId().toString()+")";
		}
		
		TypedQuery<Paciente> tq = em
				.createQuery(
						"SELECT p "
						+ "FROM Paciente p "
						+"WHERE (p.ativo = :ativo) "
						+ "AND (upper(p.nome) LIKE upper(:nome))"
						+"  AND p not in (SELECT c.paciente "
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
						Paciente.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%" + nome + "%");
		tq.setParameter("inicio", inicio,TemporalType.TIMESTAMP);
		tq.setParameter("status", StatusConsulta.AGENDADA);
		tq.setParameter("fim", fim,TemporalType.TIMESTAMP);

		
		List<Paciente> list = tq.getResultList();
		
		return list;
	}

	public Paciente selectByCPF(Paciente paciente) {
		
		TypedQuery<Paciente> tq = em.createQuery("SELECT p FROM Paciente p where (p.ativo = :ativo) and (p.cpf = :cpf))",Paciente.class);
		tq.setParameter("cpf", paciente.getCpf());
		tq.setParameter("ativo", true);
		return tq.getSingleResult();
	}

}
