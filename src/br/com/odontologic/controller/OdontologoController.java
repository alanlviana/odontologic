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
import br.com.odontologic.dao.CidadeDAO;
import br.com.odontologic.dao.EstadoDAO;
import br.com.odontologic.dao.OdontologoDAO;
import br.com.odontologic.model.Cidade;
import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.Estado;
import br.com.odontologic.model.Odontologo;
import br.com.odontologic.util.NotificacaoFactory;
import br.com.odontologic.util.annotations.Administrador;

@Transactional(value=TxType.REQUIRES_NEW)
@Controller
public class OdontologoController {

	@Inject
	private Result result;
	@Inject
	private OdontologoDAO dao;
	@Inject
	private EstadoDAO estadoDAO;
	@Inject
	private CidadeDAO cidadeDAO;
	@Inject
	private Validator validator;

	@Administrador
	public List<Odontologo> list(String filtro) {
		List<Odontologo> list;

		if (filtro == null) {
			list = dao.selectAll();
		} else {
			list = dao.selectAllByFilter(filtro, 0, 50);
		}

		result.include("filtro", filtro);

		return list;
	}

	@Administrador
	public Odontologo form(Odontologo odontologo,boolean cache) {
		// Cria ou retorna um objeto apartir do ID
		if ((odontologo.getId() != 0)&&(!cache)) {
			odontologo = dao.selectById(odontologo);
		}

		// Lista de Estados
		List<Estado> estadoList = estadoDAO.selectAll();
		result.include("estadoList", estadoList);

		// Lista de Cidade
		List<Cidade> cidadeList;
		if (odontologo.getEndereco() != null
				&& odontologo.getEndereco().getCidade().getEstado() != null) {
			cidadeList = cidadeDAO.selectAllbyEstado(odontologo.getEndereco()
					.getCidade().getEstado());
		} else {
			cidadeList = cidadeDAO.selectAllbyEstado(estadoList.get(0));
		}
		result.include("cidadeList", cidadeList);

		return odontologo;
	}

	@Administrador
	public void save(@Valid Odontologo odontologo) {
		// Fim da recuperação do arquivo
		odontologo.setAtivo(true);
		
		validator.onErrorRedirectTo(this).form(odontologo,true);
		
		if (!odontologo.getId().equals(0)) {
			dao.update(odontologo);
		} else {
			dao.insert(odontologo);
		}

		result.include(NotificacaoFactory.criarAlertaCadastro());
		result.redirectTo(this).list(null);
	}

	@Administrador
	public void delete(Odontologo odontologo) {
		dao.delete(odontologo);
		result.include(NotificacaoFactory.criarAlertaExclusao());
		result.redirectTo(this).list(null);
	}
	
	
	public List<Odontologo> getOdontologos(String filtro){
		List<Odontologo> list;
		
		list = dao.selectAllByFilter(filtro, 0, 10);
		
		result.use(Results.json()).from(list).serialize();
		return list;
	}
	
	public List<Odontologo> getOdontologosDisponiveis(String filtro,Date inicio,Date fim,Consulta consulta){
		List<Odontologo> list;
		
		list = dao.SelecionaPorNomeDisponivel(filtro, inicio, fim,consulta);
		
		result.use(Results.json()).from(list).serialize();
		return list;
	}
	
	public Odontologo getOdontologo(Odontologo odontologo){
		odontologo = dao.selectById(odontologo);
		
		if(odontologo != null){
			result.use(Results.json()).from(odontologo).serialize();
		}else{
			result.notFound();			
		}
		return odontologo;
	}
}
