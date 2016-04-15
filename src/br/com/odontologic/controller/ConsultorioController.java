package br.com.odontologic.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.odontologic.dao.ConsultorioDAO;
import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.Consultorio;
import br.com.odontologic.util.NotificacaoFactory;

@Transactional(value=TxType.REQUIRED)
@Controller
public class ConsultorioController {
	
	@Inject private ConsultorioDAO dao;
	@Inject private Result result;
	@Inject private Validator validator;
	
	public List<Consultorio> list(String filtro){
		
		List<Consultorio> consultorioList;
		if(filtro == null){
			consultorioList = dao.selectAll();
		}else{
			consultorioList = dao.selectAllByFilter(filtro);
		}
		
		return consultorioList;	
	}
	
	public Consultorio form(Consultorio consultorio,boolean cache){
		
		if ((!consultorio.getId().equals(0))&&(!cache)){
			consultorio = dao.selectById(consultorio);			 
		}
		
		
		return consultorio;
	}
	
	public void delete(Consultorio consultorio) {
		dao.delete(consultorio);
		result.include(NotificacaoFactory.criarAlertaExclusao());
		result.redirectTo(this).list(null);
	}
	
	public void save(@Valid Consultorio consultorio){
		
		consultorio.setAtivo(true);
		
		validator.onErrorRedirectTo(this).form(consultorio,true);
		
		if (consultorio.getId() == 0) {
			dao.insert(consultorio);
		}else{
			dao.update(consultorio);
		}
		result.include(NotificacaoFactory.criarAlertaCadastro());

		result.redirectTo(this).list(null);
	}
	
	public List<Consultorio> getConsultoriosDisponveis(String filtro,Date inicio,Date fim,Consulta consulta){
		List<Consultorio> list;
		
		list = dao.SelecionaPorNomeDisponivel(filtro, inicio, fim,consulta);
		
		result.use(Results.json()).from(list).serialize();
		return list;
	}
	
	public Consultorio getConsultorio(Consultorio consultorio){
		
		if (consultorio.getId() != 0){
			consultorio = dao.selectById(consultorio);
		}
		
		if(consultorio == null){
			result.notFound();
		}else{
			result.use(Results.json()).from(consultorio).serialize();
		}
		
		return consultorio;

	}
}
