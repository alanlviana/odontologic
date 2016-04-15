package br.com.odontologic.controller;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import br.com.caelum.vraptor.Controller;
import br.com.odontologic.dao.ReceberDAO;
import br.com.odontologic.model.Receber;

@Transactional(value=TxType.REQUIRES_NEW)
@Controller
public class ReceberController {
	
	@Inject private ReceberDAO dao;
	
	public List<Receber> list(){
		return dao.selectAll();
	}
	
	public Receber detail(Receber receber){
		return dao.selectById(receber);
	}
}
