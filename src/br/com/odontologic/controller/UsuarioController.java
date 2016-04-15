package br.com.odontologic.controller;


import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.odontologic.dao.UsuarioDAO;
import br.com.odontologic.model.AutenticacaoUsuario;
import br.com.odontologic.model.Usuario;
import br.com.odontologic.model.view.Notificacao;
import br.com.odontologic.model.view.enums.Layout;
import br.com.odontologic.model.view.enums.Type;
import br.com.odontologic.util.NotificacaoFactory;
import br.com.odontologic.util.RetornaFraseCaminhao;
import br.com.odontologic.util.annotations.Administrador;
import br.com.odontologic.util.annotations.MetodoPublico;

@Transactional(value=TxType.REQUIRES_NEW)
@Controller
public class UsuarioController {

	@Inject
	private Result result;
	@Inject
	private AutenticacaoUsuario autenticacaoUsuario;
	@Inject
	private UsuarioDAO dao;
	@Inject
	private Validator validator;

	@MetodoPublico
	public void login(String url) {
		
		if (!dao.possuiUsuarios()){
			result.include("configuracao",true);
		}
		
		result.include("url",url);
	}

	@MetodoPublico
	public void logar(Usuario usuario,String url) {
		
		usuario = dao.SelectByNameSenha(usuario);
		
		if(usuario != null){
			autenticacaoUsuario.logar(usuario);
			
			result.include(new Notificacao(RetornaFraseCaminhao.fraseCaminhao(),Layout.bottomRight,Type.success,10,false));
			
			if(url == null){
				result.redirectTo(IndexController.class).index();
			}else{
				result.redirectTo(url);
			}
			
			
		}else{
			validator.add(new SimpleMessage("usuario.nome", "Usuário ou senha Inválido"));
			validator.onErrorRedirectTo(this).login(url);
		}
	}

	public void logout() {
		autenticacaoUsuario.logout();
		result.redirectTo(this).login(null);
	}
	
	@Administrador
	public List<Usuario> list(String filtro){
		List<Usuario> list;
		
		if (filtro == null) {
			list = dao.selectAll();
		}else{
			list = dao.selectAllByFilter(filtro, null, null);
		}
		
		result.include("filtro", filtro);

		return list;		
	}
	
	@Administrador
	public Usuario form(Usuario usuario,boolean cache){
		if ((usuario.getId() != 0) && (!cache)) {
			usuario = dao.selectById(usuario);
		}
		
		return usuario;
	}
	
	@Administrador
	public Usuario formPassword(Usuario usuario){
		if (usuario.getId() != 0) {
			usuario = dao.selectById(usuario);
		}
		
		return usuario;
	}
	
	@Administrador
	public void savePassword(Usuario usuario,String senha1,String senha2){
		
		Usuario usuarioAntigo = dao.selectById(usuario);
		
		String senhaInformada = usuario.getSenha();		
		String senhaAntiga = usuarioAntigo.getSenha();
		
		if (senhaInformada == null || senhaAntiga == null || !(senhaInformada.equals(senhaAntiga))) {
			validator.add(new SimpleMessage("usuario.senha", "Senha incorreta!"));
		}
		
		if (senha1 == null || senha2 == null || !senha1.equals(senha2)){
			validator.add(new SimpleMessage("usuario.senha2", "Senha não confere!"));
		}
		
		validator.onErrorRedirectTo(this).formPassword(usuario);
		
		usuarioAntigo.setSenha(senha2);
		
		dao.update(usuarioAntigo);
		
		result.include(NotificacaoFactory.criarAlertaCadastro());
		result.redirectTo(this).list("");
		
		
	}
	
	@Administrador
	public void save(@Valid Usuario usuario){
		usuario.setAtivo(true);
		
		if ((usuario.getSenha() == null)||(usuario.getSenha().isEmpty())) {
			validator.add(new SimpleMessage("usuario.senha", "Informe a senha!"));
		}
		
		validator.onErrorRedirectTo(this).form(usuario,true);
		
		if(usuario.getId() == 0){
			dao.insert(usuario);
		}else{
			dao.update(usuario);
		}
		
		result.include(NotificacaoFactory.criarAlertaCadastro());
		
		result.redirectTo(this).list("");
	}
	
	public void delete(Usuario usuario) {
		
		if (autenticacaoUsuario.getUsuario().getId().equals(usuario.getId())){
			result.include(new Notificacao("Não é possivel excluir um usuário logado.", Layout.bottomRight, Type.error, 3,false));
			result.redirectTo(this).list(null);
			return;
		}
		dao.delete(usuario);
		result.include(NotificacaoFactory.criarAlertaExclusao());
		result.redirectTo(this).list(null);
	}	
	
}
