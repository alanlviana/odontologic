package br.com.odontologic.util;

import br.com.odontologic.model.view.Notificacao;
import br.com.odontologic.model.view.enums.Layout;
import br.com.odontologic.model.view.enums.Type;

public class NotificacaoFactory {

	private NotificacaoFactory(){}
	
	public static Notificacao criarAlertaCadastro(){
		return new Notificacao("Cadastro realizado com sucesso!",Layout.bottomRight,Type.success,3,false);
	}
	public static Notificacao criarAlertaExclusao(){
		return new Notificacao("Cadastro inativado com sucesso!",Layout.bottomRight,Type.success,3,false);
	}
}
