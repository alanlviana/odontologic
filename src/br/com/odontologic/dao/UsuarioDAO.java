package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.odontologic.model.Usuario;

public class UsuarioDAO implements DAO<Usuario> {

	@Inject private EntityManager em;
	
	@Override
	public Usuario insert(Usuario object) {
		//em.getTransaction().begin();
		em.persist(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Usuario update(Usuario object) {
		//em.getTransaction().begin();
		object = em.merge(object);
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public Usuario delete(Usuario object) {
		
		object = em.find(Usuario.class, object.getId());
		object.setAtivo(false);
		object = em.merge(object);


		return object;
	}

	@Override
	public Usuario selectById(Usuario object) {
		//em.getTransaction().begin();
		object = em.find(Usuario.class, object.getId());
		//em.getTransaction().commit();
		return object;
	}

	@Override
	public List<Usuario> selectAll() {
		//em.getTransaction().begin();
		TypedQuery<Usuario> tq = em.createQuery(
				"SELECT u FROM Usuario u where u.ativo = :ativo",
				Usuario.class);
		tq.setParameter("ativo", true);

		List<Usuario> list = tq.getResultList();
		//em.getTransaction().commit();
		return list;
	}
	
	public Usuario SelectByNameSenha(Usuario usuario){
		//em.getTransaction().begin();
		
		TypedQuery<Usuario> tq = em.createQuery("SELECT u FROM Usuario u where u.nomeUsuario = :nome and u.senha = :senha and u.ativo = :ativo",Usuario.class);
		tq.setParameter("nome", usuario.getNomeUsuario());
		tq.setParameter("senha", usuario.getSenha());
		tq.setParameter("ativo", true);
		
		try{
			usuario = tq.getSingleResult();
		}catch(Exception exception){
			usuario = null;
		}
		
		//em.getTransaction().commit();
		return usuario;
	}
	
	public List<Usuario> selectAllByFilter(String filtro,Integer inicio,Integer quantidade) {
		
		TypedQuery<Usuario> tq = em.createQuery("SELECT u FROM Usuario u where (u.ativo = :ativo) and (u.nome LIKE :nome)",Usuario.class);
		tq.setParameter("ativo", true);
		tq.setParameter("nome", "%"+filtro+"%");
		
		if (inicio != null){
			tq.setFirstResult(inicio);
		}
		
		if (quantidade != null){
			tq.setMaxResults(quantidade);
		}
		
		List<Usuario> list = tq.getResultList();
		return list;
	}

	public boolean possuiUsuarios() {		  
		return (Long)em.createQuery("SELECT COUNT(*) FROM Usuario").getSingleResult() > 0;
	}

	public void configuraAdministrador(Usuario usuario) {
		
		//em.createNativeQuery("ALTER TABLE Usuario AUTO_INCREMENT = 1").executeUpdate();
		em.merge(usuario);	
		
	}

	
	
	
	
}
