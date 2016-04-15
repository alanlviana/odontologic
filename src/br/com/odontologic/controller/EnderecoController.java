package br.com.odontologic.controller;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.odontologic.dao.EnderecoDAO;
import br.com.odontologic.model.Cidade;
import br.com.odontologic.model.Estado;

@Transactional(value=TxType.REQUIRES_NEW)
@Controller
public class EnderecoController {

	@Inject private EnderecoDAO dao;
	@Inject private Result result;
	
	public List<Cidade> cidadeList(Estado estado){
		List<Cidade> list = dao.getCidades(estado);
		
		result.use(Results.json()).from(list).serialize();
		
		return list;
	}
	
}
