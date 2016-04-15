package br.com.odontologic.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.odontologic.dao.ConsultaDAO;
import br.com.odontologic.dao.ConsultaServicoDAO;
import br.com.odontologic.dao.ConsultorioDAO;
import br.com.odontologic.dao.ReceberDAO;
import br.com.odontologic.dao.ServicoDAO;
import br.com.odontologic.model.BaixaConsulta;
import br.com.odontologic.model.Consulta;
import br.com.odontologic.model.ConsultaServico;
import br.com.odontologic.model.Consultorio;
import br.com.odontologic.model.Odontologo;
import br.com.odontologic.model.Receber;
import br.com.odontologic.model.Servico;
import br.com.odontologic.model.enums.StatusConsulta;
import br.com.odontologic.model.view.Notificacao;
import br.com.odontologic.model.view.enums.Layout;
import br.com.odontologic.model.view.enums.Type;
import br.com.odontologic.util.NotificacaoFactory;

@Transactional(value=TxType.REQUIRES_NEW)
@Controller
public class ConsultaController {

	
	@Inject private ConsultaDAO dao;
	@Inject private ConsultorioDAO consultorioDAO;
	@Inject private ServicoDAO servicoDAO;
	@Inject private ConsultaServicoDAO consultaServicoDAO;
	@Inject private ReceberDAO receberDAO;
	@Inject private Result result;
	@Inject private Validator validator;
	@Inject private BaixaConsulta baixaConsulta;
	
	public Consulta form(Consulta consulta,boolean cache){
		
		if ((consulta.getId() != 0) && (!cache)) {
			consulta = dao.selectById(consulta);
		}else{
			consulta.setStatusConsulta(StatusConsulta.AGENDADA);
		}
		
		List<Consultorio> consultorioList = consultorioDAO.selectAll();
		result.include("consultorioList", consultorioList);
		
		return consulta;
	}
	
	public List<Consulta> list(Odontologo odontologo,Consultorio consultorio,StatusConsulta status){
		
		if (status == null){
			status = StatusConsulta.AGENDADA;
		}
		
		List<Consulta> consultaList = dao.selectListConsulta(odontologo,consultorio,status);
		
		List<Consultorio> consultorioList = consultorioDAO.selectAll();
		result.include("consultorioList", consultorioList);
		
		if (!(odontologo == null)){
			result.include("odontologo_id", odontologo.getId());
		}
		
		if (!(consultorio == null)){
			result.include("consultorio_id", consultorio.getId());
		}
		
		if (!(status == null)) {
			result.include("status", status);
		}
		
		return consultaList;
	}
	
	public void save(@Valid Consulta consulta){
		
		consulta.setAtivo(true);
		
		
		if (consulta.getPaciente() == null) {
			validator.add(new SimpleMessage("save.consulta.paciente.id", "Por favor inserir paciente."));
		}
		
		if (consulta.getOdontologo() == null) {
			validator.add(new SimpleMessage("save.consulta.odontologo.id", "Por favor inserir odontólogo."));
		}	

		if (consulta.getConsultorio() == null) {
			validator.add(new SimpleMessage("save.consulta.consultorio.id", "Por favor inserir consultório."));
		}			
		
		validator.onErrorRedirectTo(this).form(consulta,true);
		
		
		if (consulta.getInicio().getTime() > consulta.getFim().getTime()){
			validator.add(new SimpleMessage("save.consulta.data", "Data de Inicio não deve ser maior que a data final."));
		}
		
		validator.onErrorRedirectTo(this).form(consulta,true);	
		
		
		if (!consulta.getId().equals(0)) {
			dao.update(consulta);
		} else {
			dao.insert(consulta);
		}

		result.include(NotificacaoFactory.criarAlertaCadastro());
		
		result.redirectTo(this).list(null,null,null);
	}
	
	public Consulta formBaixa(Consulta consulta){
		
		consulta = dao.selectById(consulta);
		
		if(StatusConsulta.EFETUADA.equals(consulta.getStatusConsulta())){
			result.include(new Notificacao("A consulta já foi baixada.", Layout.bottomRight, Type.error, 3, false));
			result.redirectTo(this).list(null, null, StatusConsulta.EFETUADA);
			return null;
		}
		
		baixaConsulta.iniciarBaixa(consulta);
		
		return consulta;
	}
	
	public void cancelarBaixa(){
		baixaConsulta.cancelaBaixa();
		
		result.redirectTo(this).list(null, null, null);
	}

	
	
	public void adicionarServico(Servico servico, Integer quantidade){
		
		servico = servicoDAO.selectById(servico);
		
		ConsultaServico item = new ConsultaServico();
		item.setServico(servico);
		item.setQuantidade(quantidade);
		item.setAtivo(true);
		item.setValor(servico.getValor().doubleValue());
		item.setTotal(item.getQuantidade()*item.getValor());
		
		baixaConsulta.adicionarConsultaServico(item);
		
		result.use(Results.json()).from(servico.getId()).serialize();
	}
	
	public void removerServico(Integer index){
		baixaConsulta.removerConsultaServico(index-1);
		result.use(Results.json()).from(index,"item removido").serialize();
	}
	
	@SuppressWarnings("deprecation")
	@Transactional
	public void finalizarBaixa(){
		
		// Salvar Consulta
		Consulta consulta = baixaConsulta.getConsulta();
		consulta.setStatusConsulta(StatusConsulta.EFETUADA);
		dao.update(consulta);
		
		//Salvar Itens
		List<ConsultaServico> listaAtualizada = consultaServicoDAO.inserts(baixaConsulta.getConsultaServicos());
		baixaConsulta.setConsultaServicos(listaAtualizada);
		
		// Gerar Receber
		Receber receber = new Receber();
		receber.setPaciente(baixaConsulta.getConsulta().getPaciente());
		receber.setAtivo(true);
		Date dataVencimento = new Date();
		dataVencimento.setDate(dataVencimento.getDate()+30);
		receber.setDataVencimento(dataVencimento);
		receber.setValorTotal(baixaConsulta.getTotal());
		receber.setConsulta(baixaConsulta.getConsulta());
		receberDAO.insert(receber);
		
		baixaConsulta.finalizarBaixa();
		
		result.redirectTo(this).list(null, null, null);
		
	}
	
	public void tabelaServico(){
		
	}
	
	public void cancelar(Consulta consulta) {
		consulta = dao.selectById(consulta);
		
		consulta.setStatusConsulta(StatusConsulta.CANCELADA);
		dao.update(consulta);	
	
		result.include(new Notificacao("A consulta foi cancelada.",Layout.bottomLeft,Type.success,3,false));
		result.redirectTo(this).list(null,null,StatusConsulta.CANCELADA);
	}
	
}
