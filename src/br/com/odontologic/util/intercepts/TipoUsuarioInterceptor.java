package br.com.odontologic.util.intercepts;


import javax.inject.Inject;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.odontologic.model.AutenticacaoUsuario;

@Intercepts(after=AutenticacaoInterceptor.class)
public class TipoUsuarioInterceptor implements Interceptor {

	@Inject
	private AutenticacaoUsuario autenticacaoUsuario;
	@Inject
	private Result result;
	
	@Override
	public boolean accepts(ControllerMethod method) {
		// TODO Auto-generated method stub
		return !autenticacaoUsuario.possuiPermissao(method);
	}

	@Override
	public void intercept(InterceptorStack arg0, ControllerMethod arg1,
			Object arg2) throws InterceptionException {
		result.notFound();	
	}

}
