package cn.hibernate.Case;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户
 * 
 * @author xh
 */
public class User {
	private Long id;
	private Department department;
	private Set<Role> roles = new HashSet<Role>();

	private String name; // 真实姓名
	private String gender; // 性别



	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "id+name="+id+name;
	}


}
