package br.com.odontologic.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import org.apache.commons.io.output.FileWriterWithEncoding;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.odontologic.dao.CidadeDAO;
import br.com.odontologic.dao.EstadoDAO;
import br.com.odontologic.dao.UsuarioDAO;
import br.com.odontologic.model.Cidade;
import br.com.odontologic.model.Estado;
import br.com.odontologic.model.Usuario;
import br.com.odontologic.model.enums.TipoUsuario;
import br.com.odontologic.model.view.Notificacao;
import br.com.odontologic.model.view.enums.Layout;
import br.com.odontologic.model.view.enums.Type;
import br.com.odontologic.util.annotations.MetodoPublico;


@Controller
public class UtilController {

	@Inject
	private UsuarioDAO usuarioDAO;
	@Inject
	private Result result;
	@Inject
	private EstadoDAO estadoDAO;
	@Inject
	private CidadeDAO cidadeDAO;
	@Inject
	private ServletContext context;
	
	
	public void required(){
		
	}
	
	@Path("/config")
	@MetodoPublico
	@Transactional(value=TxType.REQUIRES_NEW)
	public void config(){
		if (usuarioDAO.possuiUsuarios()){
			result.notFound();
		}else{
			
			criarUsuario();
			importarEstado();
			importarCidade();
			
			result.include(new Notificacao("Banco de dados atualizado!", Layout.center, Type.success, 0, true));
			
			result.redirectTo(UsuarioController.class).login("/");
		}
		
			
		
		
	}
	
	@Transactional(value=TxType.REQUIRES_NEW)
	private void exportEstado(){
		List<Estado> listaEstado = estadoDAO.selectAll();
		
		try {
			String estadoFileName = context.getRealPath("/assets")+"\\estado.csv";
			String quebraLinha = System.getProperty("line.separator");
			
			System.out.println(estadoFileName);
			FileWriterWithEncoding file = new FileWriterWithEncoding(estadoFileName,"UTF-8");
			for (Estado estado:listaEstado){
				file.append(estado.getId()+";"+estado.getUf()+";"+estado.getNome()+quebraLinha);	
			}
			file.flush();
			file.close();
			
			result.redirectTo(UsuarioController.class).login("/");
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	}
	
	public void exportCidade(){
		List<Cidade> listaCidade = cidadeDAO.selectAll();
		
		try {
			String cidadeFileName = context.getRealPath("/assets")+"\\cidade.csv";
			String quebraLinha = System.getProperty("line.separator");
			
			System.out.println(cidadeFileName);
			FileWriterWithEncoding file = new FileWriterWithEncoding(cidadeFileName,"UTF-8");
			for (Cidade cidade:listaCidade){
				file.append(cidade.getId()+";"+cidade.getNome()+";"+cidade.getEstado().getId()+quebraLinha);	
			}
			file.flush();
			file.close();
			
			result.redirectTo(UsuarioController.class).login("/");
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	}
	
	public void importarEstado(){
		List<Estado> listaEstado = new ArrayList<Estado>();
		String estadoFileName = context.getRealPath("/assets/estado.csv");
		BufferedReader br;
		String line = "";
		
		try{
			br = new BufferedReader(new FileReader(estadoFileName));
			
			while((line = br.readLine())!=null){
				String[] estadoCSV = line.split(";");
				
				Estado estado = new Estado();
				estado.setId(Integer.parseInt(estadoCSV[0]));
				estado.setUf(estadoCSV[1]);
				estado.setNome(estadoCSV[2]);
				
				listaEstado.add(estado);
				
			}
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		estadoDAO.atualizaTodos(listaEstado);
	}

	private void importarCidade(){
		List<Cidade> listaCidade = new ArrayList<Cidade>();
		String cidadeFileName = context.getRealPath("/assets/cidade.csv");
		BufferedReader br;
		String line = "";
		
		try{
			br = new BufferedReader(new FileReader(cidadeFileName));
			
			while((line = br.readLine())!=null){
				String[] estadoCSV = line.split(";");
				
				Cidade cidade = new Cidade();
				cidade.setId(Integer.parseInt(estadoCSV[0]));
				cidade.setNome(estadoCSV[1]);
				//Cria Estado
				Estado estado = new Estado();
				estado.setId(Integer.parseInt(estadoCSV[2]));
				
				cidade.setEstado(estado);
				
				
				listaCidade.add(cidade);
				
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		cidadeDAO.atualizaTodos(listaCidade);
	}
	
	private void criarUsuario(){
		Usuario usuario = new Usuario();
		usuario.setId(1);
		usuario.setAtivo(true);
		usuario.setNome("Administrador");
		usuario.setNomeUsuario("administrador");
		usuario.setSenha("administrador");
		usuario.setTipoUsuario(TipoUsuario.ADMINISTRADOR);
		usuarioDAO.configuraAdministrador(usuario);
	}
	
	
	
}
