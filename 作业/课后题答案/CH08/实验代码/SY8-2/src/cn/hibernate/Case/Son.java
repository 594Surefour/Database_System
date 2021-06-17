package cn.hibernate.Case;

public class Son {
	private Integer id;
	private String name;
	
	private Father father=new Father();

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

	public Father getFather() {
		return father;
	}

	public void setFather(Father father) {
		this.father = father;
	}
	 @Override
	 public String toString() {
	 	
	 	return "[id]"+id+";[name]"+name;
	 }

}
