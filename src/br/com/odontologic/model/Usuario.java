package br.com.odontologic.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;

import br.com.odontologic.model.enums.TipoUsuario;

@Entity
public class Usuario extends IdentifiableEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2610332403495727219L;
	
	@NotNull(message="O campo nome é de preenchimento obrigatório.")
	private String nome;
	@NotNull(message="O campo nome de usuário é de preenchimento obrigatório.")
	private String nomeUsuario;
	private String senha;
	private boolean ativo;
	@Enumerated(EnumType.STRING)
	private TipoUsuario tipoUsuario;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNomeUsuario(){
		return nomeUsuario;
	}
	public void setNomeUsuario(String nomeUsuario){
		this.nomeUsuario = nomeUsuario;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}
	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	
}
