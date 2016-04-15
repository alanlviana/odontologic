package br.com.odontologic.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
public class Servico extends IdentifiableEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3300440272106323280L;
	
	@NotNull(message="O campo nome é de preencimento obrigatório")
	private String nome;
	@NotNull(message="O campo valor é de preencimento obrigatório")
	@Min(value=0,message="O campo valor deve conter números positivos.")
	private BigDecimal valor;
	private boolean ativo;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	
}
