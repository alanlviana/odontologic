package br.com.odontologic.controller;

import java.util.ArrayList;
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
import br.com.odontologic.dao.ConvenioDAO;
import br.com.odontologic.dao.EstadoDAO;
import br.com.odontologic.dao.PacienteDAO;
import br.com.odontologic.model.Cidade;
import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.Convenio;
import br.com.odontologic.model.Estado;
import br.com.odontologic.model.Paciente;
import br.com.odontologic.util.NotificacaoFactory;

@Transactional(value=TxType.REQUIRES_NEW)
@Controller
public class PacienteController {

	@Inject	private PacienteDAO dao;
	@Inject	private ConvenioDAO convenioDAO;
	@Inject	private EstadoDAO estadoDAO;
	@Inject	private CidadeDAO cidadeDAO;
	@Inject	private Result result;
	@Inject private Validator validator;
	
	public List<Paciente> list(String filtro) {
		List<Paciente> list;

		if (filtro == null) {
			list = dao.selectAll();
		}else{
			list = dao.selectAllByFilter(filtro, 0, 50);
		}
		
		result.include("filtro", filtro);

		return list;
	}

	public Paciente form(Paciente paciente,boolean cache) {

		if ((paciente.getId() != 0)&&(!cache)) {
			paciente = dao.selectById(paciente);
		}

		List<Convenio> convenioList = convenioDAO.selectAll();
		result.include("convenioList", convenioList);

		List<Estado> estadoList = estadoDAO.selectAll();
		result.include("estadoList", estadoList);

		List<Cidade> cidadeList;
		if (paciente.getEndereco() != null
				&& paciente.getEndereco().getCidade().getEstado() != null) {
			cidadeList = cidadeDAO.selectAllbyEstado(paciente.getEndereco()
					.getCidade().getEstado());
		} else {
			cidadeList = cidadeDAO.selectAllbyEstado(estadoList.get(0));
		}

		result.include("cidadeList", cidadeList);

		return paciente;
	}

	public void save(@Valid Paciente paciente) {
		
		paciente.setAtivo(true);
		
		validator.onErrorRedirectTo(this).form(paciente,true);

		if (!paciente.getId().equals(0)) {
			dao.update(paciente);
		} else {
			dao.insert(paciente);
		}

		result.include(NotificacaoFactory.criarAlertaCadastro());
		result.redirectTo(PacienteController.class).list(null);
	}

	public void delete(Paciente paciente) {
		dao.delete(paciente);
		result.include(NotificacaoFactory.criarAlertaExclusao());
		result.redirectTo(this).list(null);
	}
	
	public List<Paciente> getPacientes(String filtro){
		List<Paciente> list;
		if (filtro == null) {
			list = dao.selectAllByFilter("", 0, 10);
		}else{
			list = dao.selectAllByFilter(filtro, 0, 10);
		}
		
		result.use(Results.json()).from(list).excludeAll().include("id","nome","cpf","telefoneCelular","telefoneResidencial").serialize();
		return list;
	}
	
	public List<Paciente> getPacientesSemConsulta(String filtro,Date inicio,Date fim,Consulta consulta){
		
		List<Paciente> list = new ArrayList<Paciente>();
		if (filtro == null) {
			return list;
		}
		
		list = dao.selectPacienteSemConsulta(filtro, inicio, fim, consulta);
		
		
		result.use(Results.json()).from(list).recursive().serialize();
		return list;
	}
	public Paciente getPaciente(Paciente paciente){
		
		
		if (paciente.getId() != 0){
			paciente = dao.selectById(paciente);
		}else{
			paciente = dao.selectByCPF(paciente);
		}
		
		if(paciente == null){
			result.notFound();
		}else{
			result.use(Results.json()).from(paciente).recursive().serialize();
		}
		
		return paciente;
	}
}
