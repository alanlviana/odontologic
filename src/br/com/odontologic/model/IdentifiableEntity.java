package br.com.odontologic.model;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
//import javax.persistence.Version;

@MappedSuperclass
public abstract class IdentifiableEntity implements Identifiable<Integer> {

	@Id
	@GeneratedValue
	protected Integer id = 0;
	//@Version 
	//protected Integer version;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	//public Integer getVersion() {
	//	return version;
	//}
	//public void setVersion(Integer version) {
	//	this.version = version;
	//}
	
	
	
}
