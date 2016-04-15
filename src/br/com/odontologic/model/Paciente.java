package br.com.odontologic.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;


import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.br.CPF;

import br.com.odontologic.model.enums.Sexo;
import br.com.odontologic.util.MaskUtil;

@Entity
public class Paciente extends IdentifiableEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8851879002246863964L;
	
	@NotNull(message="O campo nome é de preenchimento obrigatório.")
	private String nome;
	@NotNull(message="O campo rg é de preenchimento obrigatório.")
	private String rg;
	@NotNull(message="O campo cpf é de preenchimento obrigatório.")
	@CPF
	private String cpf;
	@NotNull(message="O campo data de nascimento é de preenchimento obrigatório.")
	@Past(message="Entre com um data de nascimento válida.")
	private Calendar dataNascimento;
	@Enumerated(EnumType.STRING)
	private Sexo sexo;
	private String estadoCivil;
	private String restricaoMedicinal;
	@OneToOne
	private Endereco endereco;
	private boolean ativo;
	@ManyToOne(optional=true)
	@JoinColumn(name="convenio_id")
	private Convenio convenio;
	private String telefoneResidencial;
	private String telefoneCelular;
	private String email;
	private Calendar dataCadastro;
	

	public Paciente(){
		
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public Calendar getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Calendar dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	
	public String getEstadoCivil() {
		return estadoCivil;
	}
	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	public String getRestricaoMedicinal() {
		return restricaoMedicinal;
	}
	public void setRestricaoMedicinal(String restricaoMedicinal) {
		this.restricaoMedicinal = restricaoMedicinal;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	public Convenio getConvenio() {
		return convenio;
	}
	public void setConvenio(Convenio convenio) {
		this.convenio = convenio;
	}
	public String getTelefoneResidencial() {
		return telefoneResidencial;
	}

	public void setTelefoneResidencial(String telefoneResidencial) {
		this.telefoneResidencial = telefoneResidencial;
	}

	public String getTelefoneCelular() {
		return telefoneCelular;
	}

	public void setTelefoneCelular(String telefoneCelular) {
		this.telefoneCelular = telefoneCelular;
	}

	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Calendar getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Calendar dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public String getFormatedCPF(){
		return MaskUtil.formatCPF(cpf);
	}

	public Sexo getSexo() {
		return sexo;
	}

	public void setSexo(Sexo sexo) {
		this.sexo = sexo;
	}
	
	
	
}
