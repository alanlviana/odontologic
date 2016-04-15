package br.com.odontologic.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import br.com.odontologic.model.enums.StatusConsulta;

@Entity
public class Consulta extends IdentifiableEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6311477273155145304L;
	
	@Temporal(TemporalType.TIMESTAMP)
	@NotNull(message="O campo inicio é de preenchimento obrigatório.")
	private Date  inicio;
	@Temporal(TemporalType.TIMESTAMP)
	@NotNull(message="O campo fim é de preenchimento obrigatório.")
	private Date fim;
	@OneToOne
	private Paciente paciente;
	@OneToOne
	private Odontologo odontologo;
	@OneToOne
	private Consultorio consultorio;
	@OneToOne(optional=true)
	private Convenio convenio;
	@Enumerated(EnumType.STRING)
	private StatusConsulta statusConsulta;
	@OneToOne
	private Usuario usuario;
	@OneToMany(mappedBy = "consulta", targetEntity = ConsultaServico.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<ConsultaServico> servicos;
	
	
	public List<ConsultaServico> getServicos() {
		return servicos;
	}
	public void setServicos(List<ConsultaServico> servicos) {
		this.servicos = servicos;
	}
	private boolean ativo;
	

	public Paciente getPaciente() {
		return paciente;
	}
	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}
	public Odontologo getOdontologo() {
		return odontologo;
	}
	public void setOdontologo(Odontologo odontologo) {
		this.odontologo = odontologo;
	}
	public Consultorio getConsultorio() {
		return consultorio;
	}
	public void setConsultorio(Consultorio consultorio) {
		this.consultorio = consultorio;
	}
	public Convenio getConvenio() {
		return convenio;
	}
	public void setConvenio(Convenio convenio) {
		this.convenio = convenio;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	public StatusConsulta getStatusConsulta() {
		return statusConsulta;
	}
	public void setStatusConsulta(StatusConsulta statusConsulta) {
		this.statusConsulta = statusConsulta;
	}
	public Date getInicio() {
		return inicio;
	}
	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}
	public Date getFim() {
		return fim;
	}
	public void setFim(Date fim) {
		this.fim = fim;
	}
	
}
