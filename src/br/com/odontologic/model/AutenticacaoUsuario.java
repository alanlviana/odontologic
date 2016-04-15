package br.com.odontologic.model;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.odontologic.model.enums.TipoUsuario;
import br.com.odontologic.util.annotations.Administrador;
import br.com.odontologic.util.annotations.Atendente;
import br.com.odontologic.util.annotations.MetodoPublico;

@Named
@SessionScoped
public class AutenticacaoUsuario implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 179555632760889953L;
	private Usuario usuario;
	
	public void logar(Usuario usuario){
		this.usuario = usuario;
	}
	
	public void logout(){
		this.usuario = null;
	}
	
	public Usuario getUsuario(){
		return usuario;
	}
	
	public boolean isLogado(){
		
		return usuario != null;
	}
	
	public boolean possuiPermissao(ControllerMethod method){
		
		
		
		if (method.containsAnnotation(MetodoPublico.class)){
			return true;
		}
		
		if (!method.containsAnnotation(Administrador.class) && !method.containsAnnotation(Atendente.class)){
			return true;
		}
		
		
		if (method.containsAnnotation(Administrador.class) && usuario != null &&  usuario.getTipoUsuario().equals(TipoUsuario.ADMINISTRADOR)){
			return true;
		}
		
		if (method.containsAnnotation(Atendente.class) && usuario != null && usuario.getTipoUsuario().equals(TipoUsuario.ATENDENTE)){
			return true;
		}
		
		return false;
		
	}
	
	
}
