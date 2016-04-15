package br.com.odontologic.util.intercepts;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.odontologic.model.AutenticacaoUsuario;
import br.com.odontologic.util.annotations.MetodoPublico;


@Intercepts
public class AutenticacaoInterceptor implements Interceptor {

	@Inject
	private AutenticacaoUsuario autenticacaoUsuario;
	@Inject
	private HttpServletRequest request;
	@Inject
	private Result result;

	@Override
	public boolean accepts(ControllerMethod method) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return !((autenticacaoUsuario.isLogado()) || (method.containsAnnotation(MetodoPublico.class)));
	}

	@Override
	public void intercept(InterceptorStack arg0, ControllerMethod method,
			Object arg2) throws InterceptionException {
		
		
		
		//
		String path = request.getContextPath();
		String urlAbsoluta = request.getRequestURI();
		String urlRelativa;
		urlRelativa = urlAbsoluta.substring(path.length());

		String query = request.getQueryString();
		String url;
		if (query != null) {
			url = urlRelativa + "?" + query;
		} else {
			url = urlRelativa;
		}

		result.redirectTo("/usuario/login?url=" + url);
	}

}
