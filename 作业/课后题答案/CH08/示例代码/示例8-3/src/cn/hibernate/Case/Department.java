package cn.hibernate.Case;

import java.util.HashSet;
import java.util.Set;

/**
 * 部门
 * 
 * @author xh
 * 
 */
public class Department {
	private Long id;
	private Set<User> users = new HashSet<User>();
	private Set<Department> children = new HashSet<Department>();

	private String name;
	private String description;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<Department> getChildren() {
		return children;
	}

	public void setChildren(Set<Department> children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "id+name="+id+name;
	}
}
