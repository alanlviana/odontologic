package br.com.odontologic.controller;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.odontologic.dao.ServicoDAO;
import br.com.odontologic.model.Servico;
import br.com.odontologic.util.NotificacaoFactory;
import br.com.odontologic.util.annotations.Administrador;

@Transactional(value=TxType.REQUIRES_NEW)
@Controller
public class ServicoController {
	@Inject private ServicoDAO dao;
	@Inject private Result result;
	@Inject private Validator validator; 
	
	@Administrador
	public List<Servico> list(String filtro){
		List<Servico> servicoList;
		
		if (filtro == null) {
			servicoList = dao.selectAll();
		}else{
			servicoList = dao.selectByFilter(filtro);
		}
		
		result.include("filtro", filtro);
		
		return servicoList;
	}
	
	@Administrador
	public Servico form(Servico servico,boolean cache){
		
		if ((servico.getId() != 0)&&(!cache)){
			servico = dao.selectById(servico);
		}
		
		return servico;
	}
	@Administrador
	public void save(@Valid Servico servico){
		servico.setAtivo(true);
		
		validator.onErrorRedirectTo(this).form(servico,true);
		
		if(servico.getId() == 0){
			dao.insert(servico);
		}else{
			dao.update(servico);
		}
		result.include(NotificacaoFactory.criarAlertaCadastro());
		result.redirectTo(this).list(null);
	}
	@Administrador
	public void delete(Servico servico) {
		dao.delete(servico);
		result.include(NotificacaoFactory.criarAlertaExclusao());
		result.redirectTo(this).list(null);
	}

	public Servico getServico(Servico servico){
		servico = dao.selectById(servico);
		
		if(servico != null){
			result.use(Results.json()).from(servico).serialize();
		}else{
			result.notFound();			
		}
		return servico;
	}
	
	public List<Servico> getServicos(String filtro){
		List<Servico> list;
		
		list = dao.selectByFilter(filtro);
		
		result.use(Results.json()).from(list).serialize();
		return list;
	}
}
