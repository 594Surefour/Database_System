package cn.hibernate.Case;

import java.util.HashSet;
import java.util.Set;

/**
 * 岗位
 * 
 * @author xh
 * 
 */
public class Role {
	private Long id;
	private String name;
	private Set<User> users = new HashSet<User>();

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "id+name="+id+name;
	}

}
