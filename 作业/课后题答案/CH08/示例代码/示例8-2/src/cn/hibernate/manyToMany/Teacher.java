package cn.hibernate.manyToMany;

import java.util.HashSet;
import java.util.Set;

public class Teacher {
	/**
	 * 老师
	 */
	private Long id;
	private String name;
	// 关联的学生
	private Set<Student> students = new HashSet<Student>();

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

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	@Override
	public String toString() {

		return "[id]=" + id + ";[name]=" + name;
	}

}
