package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Servico;

public class ServicoDAO implements DAO<Servico> {

	@Inject
	private EntityManager em;

	@Override
	public Servico insert(Servico object) {
		//em.getTransaction().begin();
		em.persist(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Servico update(Servico object) {
		//em.getTransaction().begin();
		object = em.merge(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Servico delete(Servico object) {
		object = selectById(object);
		//em.getTransaction().begin();
		object.setAtivo(false);
		object = em.merge(object);
		//em.getTransaction().commit();

		return object;
	}

	@Override
	public Servico selectById(Servico object) {
		//em.getTransaction().begin();
		object = em.find(Servico.class, object.getId());
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public List<Servico> selectAll() {
		//em.getTransaction().begin();
		TypedQuery<Servico> tq = em
				.createQuery("SELECT s FROM Servico s where s.ativo = :ativo",
						Servico.class);
		tq.setParameter("ativo", true);

		List<Servico> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}

	public List<Servico> selectByFilter(String filtro) {

		TypedQuery<Servico> tq = em
				.createQuery(
						"SELECT s FROM Servico s where (s.ativo = :ativo) and (s.nome LIKE :nome)",Servico.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%" + filtro + "%");


		List<Servico> list = tq.getResultList();
		return list;
	}

}
