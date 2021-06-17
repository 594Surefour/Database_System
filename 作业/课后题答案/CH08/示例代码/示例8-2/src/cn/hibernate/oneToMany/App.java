package cn.hibernate.oneToMany;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

public class App {
	// ��ʼ��
	private static SessionFactory sessionFactory = null;
	static {
		Configuration cfg = new Configuration();
		cfg.configure()// ��ȡָ�����������ļ�
				.addClass(Employee.class)//
				.addClass(Department.class);//
		sessionFactory = cfg.buildSessionFactory();// �����������ļ�����session����

	}

	// ���棬������ϵ
	@Test
	public void testSave() throws Exception {

		// ��������
		Department department = new Department();
		department.setName("������");
		Employee employee1 = new Employee();
		employee1.setName("����");
		Employee employee2 = new Employee();
		employee2.setName("����");
		// ����������һ����˵�����߻��Ƕ����öԷ�,Ա��������ĳ������
		employee1.setDepartment(department);
		employee2.setDepartment(department);
		//������ҲҪ������Ա������
		department.getEmployee().add(employee1);
		department.getEmployee().add(employee2);
		Session session = sessionFactory.openSession();// ��session
		Transaction tx = session.beginTransaction();// ��ʼ����
		// ���߶�Ҫ����  ����ʱ��ע�⽫�������˵Ķ��󱣴��ں��棬�������Ķ������ǰ�汣�棬�����������Ч��
		session.save(department);
		session.save(employee1);
		session.save(employee2);
		tx.commit();// �ύ����
		session.close();

	}

	// ���Ի�ȡ�������ĶԷ�
	@Test
	public void testGet() {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		// ��ȡһ��
		Department department = (Department) session.get(Department.class, 1);
		System.out.println(department);
		System.out.println(department.getEmployee());

		// ��ʾ��һ����Ϣ
		Employee employee = (Employee) session.get(Employee.class, 1);
		System.out.println(employee);
		System.out.println(employee.getDepartment());

		tx.commit();
		session.close();
	}

	// ���������ϵ��ɾ�������Ӱ��
	@Test
	public void testRemoveRelation() throws Exception {

		Session session = sessionFactory.openSession();// ��session
		Transaction tx = session.beginTransaction();// ��ʼ����
		
		//��Ա�������
//		Employee employee = (Employee) session.get(Employee.class, 1);
//		employee.setDepartment(null);
		
		//�Ӳ��ŷ����  ������뽫Department.hbm.xml�е�Set�����е�inverse���Ը�Ϊfalse��
		//�����޸��޷���Ч
		Department department = (Department) session.get(Department.class, 1);
		department.getEmployee().clear();
		

		tx.commit();// �ύ����
		session.close();

	}
	@Test
	public void testDelete() throws Exception {

		Session session = sessionFactory.openSession();// ��session
		Transaction tx = session.beginTransaction();// ��ʼ����
		
		//ɾ��Ա�������һ�����ԶԷ�û��Ӱ��
//		Employee employee = (Employee) session.get(Employee.class, 4);
//		session.delete(employee);
		
        //ɾ������(һ��һ��)  
		//a:���û�й�����Ա��������ɾ��
		//b��������й���Ա����inverse=true�����ڲ���ά����ϵ�����ֱ��ִ��ɾ���ͻ����쳣
		//c:����й���Ա����inverse=false�����ڿ���ά��������ϵ����˾ͻ��Ȱѹ�����Ա�����������Ϊnull��
		//��ִ��ɾ����������Ͳ�������쳣
		Department department = (Department) session.get(Department.class, 1);
		session.delete(department);
		
		tx.commit();// �ύ����
		session.close();

	}
}
