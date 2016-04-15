package br.com.odontologic.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

@Entity
public class Consultorio extends IdentifiableEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3740183274527196380L;
	@NotNull(message="O campo descrição é de preenchimento obrigatório.")
	private String descricao;
	private boolean ativo;
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
}
