package br.com.odontologic.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named
@SessionScoped
public class BaixaConsulta implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4676007567766814233L;
	
	private List<ConsultaServico> consultaServicos;
	private Consulta consulta;
	
	public void iniciarBaixa(Consulta consulta){
		this.consulta = consulta;
		
		if (consultaServicos == null){
			consultaServicos = new ArrayList<ConsultaServico>();

		}
		
	}	
	public void finalizarBaixa(){
		this.consultaServicos = new ArrayList<>();
		this.consulta = null;
	}
	
	public void adicionarConsultaServico(ConsultaServico consultaServico){
		consultaServico.setConsulta(consulta);
		consultaServicos.add(consultaServico);
	}
	
	public void removerConsultaServico(Integer index){
		consultaServicos.remove(index.intValue());
	}
	
	public List<ConsultaServico> getConsultaServicos(){
		return consultaServicos;
	}
	public void setConsultaServicos(List<ConsultaServico> lista){
		this.consultaServicos = lista;
	}
	
	public void cancelaBaixa(){
		this.consultaServicos = new ArrayList<>();
		this.consulta = null;
	}
	
	public Double getTotal(){
		
		double total = 0;
		
		for (ConsultaServico item : consultaServicos){
			total += item.getTotal(); 
		}
		
		return Double.valueOf(total);
	}
	
	public Consulta getConsulta(){
		return this.consulta;
	}

}
