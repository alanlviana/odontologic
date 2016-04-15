package br.com.odontologic.model.view;

import br.com.odontologic.model.view.enums.Layout;
import br.com.odontologic.model.view.enums.Type;

public class Notificacao {
	//noty({text: 'noty - <b>a</b> jquery notification library!',layout:'center',type:'success',timeout:false,modal:'true'});
	private String text = "";
	private Layout layout = Layout.center;
	private Type type = Type.alert;
	private Integer timeout = 0;
	private boolean modal = false;
	
	
	
	public Notificacao(String text, Layout layout, Type type, Integer timeout,
			boolean modal) {
		super();
		this.text = text;
		this.layout = layout;
		this.type = type;
		this.timeout = timeout;
		this.modal = modal;
	}

	public String getText(){
		return this.text;
	}
	
	public void setText(String text){
		this.text = text;
	}

	public Layout getLayout() {
		return layout;
	}

	public void setLayout(Layout layout) {
		this.layout = layout;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getTimeout() {
		Integer segundos = timeout*1000;
		
		if (timeout == 0){
			return "false";
		}else{
			return "'"+segundos.toString()+"'";
		}
	}

	public void setTimeout(Integer timeout) {
		this.timeout = timeout;
	}

	public String getModal() {
		if (modal){
			return "true";
		}else{
			return "false";
		}
	}

	public void setModal(boolean modal) {
		this.modal = modal;
	}
	
	
	
	
}
