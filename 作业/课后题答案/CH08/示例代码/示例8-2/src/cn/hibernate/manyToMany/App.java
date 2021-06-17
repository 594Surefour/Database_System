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
	// ��ʼ��
	private static SessionFactory sessionFactory = null;
	static {
		Configuration cfg = new Configuration();
		cfg.configure()// ��ȡָ�����������ļ�
				.addClass(Student.class)//
				.addClass(Teacher.class);//
		sessionFactory = cfg.buildSessionFactory();// �����������ļ�����session����

	}

	// ���棬������ϵ
	@Test
	public void testSave() throws Exception {

		Session session = sessionFactory.openSession();// ��session
		Transaction tx = session.beginTransaction();// ��ʼ����

		// ��������
		Student student1 = new Student();
		student1.setName("��ͬѧ");
		Student student2 = new Student();
		student2.setName("��ͬѧ");

		Teacher teacher1 = new Teacher();
		teacher1.setName("����ʦ");
		Teacher teacher2 = new Teacher();
		teacher2.setName("����ʦ");

		// ��������
		// ע�⣺
		// 1��Ҫ���߶�д����teacher��student���߹�����ϵ��д����ôһ����set���������inverseֵ�ͱ���
		// ���ó�Ϊtrue��ֻҪһ��ά����2��Ҫô��дһ�ߵĹ�����ϵ���ɣ�inverse���Բ���д����Ϊfalse
		student1.getTeachers().add(teacher1);
		student1.getTeachers().add(teacher2);
		student2.getTeachers().add(teacher1);
		student2.getTeachers().add(teacher2);

		teacher1.getStudents().add(student1);
		teacher1.getStudents().add(student2);
		teacher2.getStudents().add(student1);
		teacher2.getStudents().add(student2);

		// ����
		session.save(student1);
		session.save(student2);
		session.save(teacher1);
		session.save(teacher2);

		tx.commit();// �ύ����
		session.close();

	}

	// ���Ի�ȡ�������ĶԷ�
	@Test
	public void testGet() {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		// ��ȡһ����Ϣ
		Teacher teacher = (Teacher) session.get(Teacher.class, 3L);
		System.out.println(teacher);
		System.out.println(teacher.getStudents());

		// ��ȡ��һ����Ϣ

		Student student = (Student) session.get(Student.class, 3L);
		System.out.println(student);
		System.out.println(student.getTeachers());

		tx.commit();
		session.close();
	}

	// ���������ϵ��ɾ�������Ӱ��
	@Test
	public void testRemoveRelation() throws Exception {

		Session session = sessionFactory.openSession();// ��session
		Transaction tx = session.beginTransaction();// ��ʼ����

		//���inverse=true�����ܽ��������ϵ
		Teacher teacher = (Teacher) session.get(Teacher.class, 4L);
		System.out.println(teacher);
		teacher.getStudents().clear();

		tx.commit();// �ύ����
		session.close();

	}

	@Test
	public void testDelete() throws Exception {

		Session session = sessionFactory.openSession();// ��session
		Transaction tx = session.beginTransaction();// ��ʼ����

		  //ɾ��Ա��(һ��һ��)  
		//a:���û�й�����Ա��������ɾ��
	
		//c:����й���Ա����inverse=false�����ڿ���ά��������ϵ��������ɾ���м����ɾ���Լ���
//		Teacher teacher = (Teacher) session.get(Teacher.class, 5L);
//		System.out.println(teacher);
//		session.delete(teacher);
		
		//b��������й���Ա����inverse=true�����ڲ���ά����ϵ�����ֱ��ִ��ɾ���ͻ����쳣
		Student student = (Student) session.get(Student.class, 7L);
		System.out.println(student);
		session.delete(student);
		
		tx.commit();// �ύ����
		session.close();

	}
}
