package br.com.odontologic.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.odontologic.model.ConsultaServico;

public class ConsultaServicoDAO implements DAO<ConsultaServico>{

	@Inject private EntityManager em; 
	
	public List<ConsultaServico> inserts(List<ConsultaServico> lista){

		
		for (ConsultaServico item:lista){
			em.persist(item);
		}
		
		
		return lista;
	}
	
	@Override
	public ConsultaServico insert(ConsultaServico object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ConsultaServico update(ConsultaServico object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ConsultaServico delete(ConsultaServico object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ConsultaServico selectById(ConsultaServico object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ConsultaServico> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
