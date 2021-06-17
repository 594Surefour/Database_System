package cn.hibernate.manyToMany;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.envers.tools.ArraysTools;
import org.junit.Test;

public class App {
	// 初始化
	private static SessionFactory sessionFactory = null;
	static {
		Configuration cfg = new Configuration();
		cfg.configure()// 读取指定的主配置文件
				.addClass(Student.class)//
				.addClass(Teacher.class);//
		sessionFactory = cfg.buildSessionFactory();// 根据主配置文件生成session工厂

	}

	// 保存，关联关系
	@Test
	public void testSave() throws Exception {

		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务

		// 创建对象
		Student student1 = new Student();
		student1.setName("王同学");
		Student student2 = new Student();
		student2.setName("李同学");

		Teacher teacher1 = new Teacher();
		teacher1.setName("张老师");
		Teacher teacher2 = new Teacher();
		teacher2.setName("赵老师");

		// 关联起来
		// 注意：
		// 1）要两边都写，即teacher和student两边关联关系都写，那么一个的set属性里面的inverse值就必须
		// 设置成为true，只要一边维护。2）要么就写一边的关联关系即可，inverse属性不用写，即为false
		student1.getTeachers().add(teacher1);
		student1.getTeachers().add(teacher2);
		student2.getTeachers().add(teacher1);
		student2.getTeachers().add(teacher2);

		teacher1.getStudents().add(student1);
		teacher1.getStudents().add(student2);
		teacher2.getStudents().add(student1);
		teacher2.getStudents().add(student2);

		// 保存
		session.save(student1);
		session.save(student2);
		session.save(teacher1);
		session.save(teacher2);

		tx.commit();// 提交事务
		session.close();

	}

	// 可以获取到关联的对方
	@Test
	public void testGet() {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		// 获取一方信息
		Teacher teacher = (Teacher) session.get(Teacher.class, 3L);
		System.out.println(teacher);
		System.out.println(teacher.getStudents());

		// 获取另一方信息

		Student student = (Student) session.get(Student.class, 3L);
		System.out.println(student);
		System.out.println(student.getTeachers());

		tx.commit();
		session.close();
	}

	// 解除关联关系，删除对象的影响
	@Test
	public void testRemoveRelation() throws Exception {

		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务

		//如果inverse=true，则不能解除关联关系
		Teacher teacher = (Teacher) session.get(Teacher.class, 4L);
		System.out.println(teacher);
		teacher.getStudents().clear();

		tx.commit();// 提交事务
		session.close();

	}

	@Test
	public void testDelete() throws Exception {

		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务

		  //删除员工(一的一方)  
		//a:如果没有关联的员工：可以删除
	
		//c:如果有关联员工且inverse=false：由于可以维护关联关系，他可以删除中间表，再删除自己，
//		Teacher teacher = (Teacher) session.get(Teacher.class, 5L);
//		System.out.println(teacher);
//		session.delete(teacher);
		
		//b：如果有有关联员工且inverse=true：由于不能维护关系，因此直接执行删除就会有异常
		Student student = (Student) session.get(Student.class, 7L);
		System.out.println(student);
		session.delete(student);
		
		tx.commit();// 提交事务
		session.close();

	}
}
