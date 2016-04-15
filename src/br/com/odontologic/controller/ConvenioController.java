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
import br.com.odontologic.dao.CidadeDAO;
import br.com.odontologic.dao.ConvenioDAO;
import br.com.odontologic.dao.EstadoDAO;
import br.com.odontologic.model.Cidade;
import br.com.odontologic.model.Convenio;
import br.com.odontologic.model.Estado;
import br.com.odontologic.util.NotificacaoFactory;

@Controller
@Transactional(value=TxType.REQUIRES_NEW)
public class ConvenioController {
	@Inject
	private EstadoDAO estadoDAO;
	@Inject
	private CidadeDAO cidadeDAO;
	@Inject
	private ConvenioDAO dao;
	@Inject
	private Result result;
	@Inject
	private Validator validator;
	
	 public Convenio form(Convenio convenio,boolean cache){
		 
		 
		 if ((convenio.getId() != 0) && (!cache)){
			 convenio = dao.selectById(convenio);			 
		 } 
		 
		 List<Estado> estadoList = estadoDAO.selectAll();
		 result.include("estadoList",estadoList);
		 
		 List<Cidade> cidadeList;
			if (convenio.getId() != 0 && convenio.getEndereco() != null
					&& convenio.getEndereco().getCidade().getEstado() != null) {
				cidadeList = cidadeDAO.selectAllbyEstado(convenio.getEndereco()
						.getCidade().getEstado());
			} else {
				cidadeList = cidadeDAO.selectAllbyEstado(estadoList.get(0));
			}
			result.include("cidadeList", cidadeList);

		 
		 return convenio;
	 }
	
	 public void delete(Convenio convenio){
		 dao.delete(convenio);
		 result.include(NotificacaoFactory.criarAlertaExclusao());
		 result.redirectTo(this).list(null);
	 }

    
	public List<Convenio> list(String filtro) {
		List<Convenio> list;
		
		if (filtro == null){
			list  = dao.selectAll();
		}else{
			list = dao.selectByFilter(filtro);
		}
		
		return list;
	}
	
	public void save(@Valid Convenio convenio){
		convenio.setAtivo(true);
		
		validator.onErrorRedirectTo(this).form(convenio,true);

		if (!convenio.getId().equals(0)) {
			dao.update(convenio);
		} else {
			dao.insert(convenio);
		}
		result.include(NotificacaoFactory.criarAlertaCadastro());

		result.redirectTo(this).list(null);
	}
	
	public Convenio getConvenio(Convenio convenio){
		convenio = dao.selectById(convenio);
		
		if(convenio == null){
			result.notFound();
		}else{
			result.use(Results.json()).from(convenio).serialize();
		}
		
		return convenio;
	}
	
	public List<Convenio> getConvenios(String filtro){
		List<Convenio> list;
		if (filtro == null) {
			list = dao.selectByFilter("");
		}else{
			list = dao.selectByFilter(filtro);
		}
		
		
		result.use(Results.json()).from(list).excludeAll().include("id","nome").serialize();
		return list;
	}
}
