package cn.hibernate.manyToMany;

import java.util.HashSet;
import java.util.Set;

public class Student {
	/**
	 * 学生
	 */
	private Long id;
	private String name;
	// 关联的老师
	private Set<Teacher> teachers = new HashSet<Teacher>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}

	@Override
	public String toString() {

		return "[id]=" + id + ";[name]=" + name;
	}

}
