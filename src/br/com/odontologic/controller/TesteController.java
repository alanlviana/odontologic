package br.com.odontologic.controller;
import java.util.Calendar;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.odontologic.util.annotations.MetodoPublico;

@Controller
public class TesteController {

	@Inject
	private Result result;

	@MetodoPublico
	public void data(Calendar c){
		result.use(Results.json()).from(c).serialize();
	}
	
}
