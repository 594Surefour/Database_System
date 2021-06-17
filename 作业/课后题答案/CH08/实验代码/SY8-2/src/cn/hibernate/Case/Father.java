package cn.hibernate.Case;

import java.util.HashSet;
import java.util.Set;

public class Father {
	private Integer id;
	private String name;
	Set<Son> son=new HashSet<Son>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Son> getSon() {
		return son;
	}
	public void setSon(Set<Son> son) {
		this.son = son;
	}

 @Override
public String toString() {
	
	return "[id]"+id+";[name]"+name;
}

}
