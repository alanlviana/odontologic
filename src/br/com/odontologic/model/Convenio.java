package br.com.odontologic.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;


@Entity
public class Convenio extends IdentifiableEntity implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 6132786976635599466L;
	@NotNull(message="O campo código do convenio é de preenchimento obrigatório.")
	private String codConvenio;
	@NotNull(message="O campo Razão Social é de preenchimento obrigatório.")
	private String nome;
	@OneToOne
	private Endereco endereco = new Endereco();
	private String registroANS;
	private String telefone;
	private String site;
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	private String email;
	private boolean ativo;
	
	// Get-Sets
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	public String getCodConvenio() {
		return codConvenio;
	}
	
	public void setCodConvenio(String codConvenio) {
		this.codConvenio = codConvenio;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getRegistroANS() {
		return registroANS;
	}
	public void setRegistroANS(String registroANS) {
		this.registroANS = registroANS;
	}
	
	public Endereco getEndereco(){
		return endereco;
	}
	public void setEndereco(Endereco endereco){
		this.endereco = endereco;
	}
}
