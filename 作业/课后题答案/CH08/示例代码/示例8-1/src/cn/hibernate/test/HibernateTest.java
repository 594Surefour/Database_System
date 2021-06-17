package cn.hibernate.test;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;

import cn.hibernate.demo.HibernateUtils;
import cn.hibernate.demo.Student;
public class HibernateTest {
	//��ʼ��
	private static SessionFactory sessionFactory=null;
	static
	{
		Configuration cfg=new Configuration();
		//��ȡָ�����������ļ�
		cfg.configure("hibernate.cfg.xml");
		//�����������ļ�����session����
		sessionFactory = cfg.buildSessionFactory();
	}
	//��Ӳ���
	@Test
	public void saveTest()
	{
		//����
		Student student=new Student();
		student.setName("���");
		student.setAge(22);
		//��session
		Session session=sessionFactory.openSession();
		//��ʼ����
		Transaction tx=session.beginTransaction();
		//�����ݴ洢�����ݱ���
		session.save(student);
		//�ύ����
		tx.commit();
		//�ر�session
		session.close();
	}
	@Test
	public void testGet()
	{
		
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		//��ȡidΪ1��student����
		Student student=(Student) session.get(Student.class, 1);
		System.out.println(student.getName());
		tx.commit();
		session.close();
	}
	
	

	@Test
	public void testLoad()
	{
		
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		//��ȡidΪ1��student����
		Student student=(Student) session.get(Student.class, 1);
		System.out.println(student.getName());
		tx.commit();
		session.close();
	}
	
	@Test
	public void testUpdate()
	{
		
		//����
		Student student=new Student();
		student.setId(1);
		student.setName("�ź�");
		student.setAge(28);
		//��session
		Session session=sessionFactory.openSession();
		//��ʼ����
		Transaction tx=session.beginTransaction();
		//�����ݸ��µ����ݱ���
		session.update(student);
		//�ύ����
		tx.commit();
		//�ر�session
		session.close();
	}
	
	@Test
	public void queryTest()
    {
        Student student = new Student();
        Session session = sessionFactory.openSession();
        
        
        Query query = session.createQuery("from Student");
        List list = query.list();
        for(int i = 0 ; i <list.size(); i++)
        {
        	student = (Student)list.get(i);
            System.out.println(student);
        }
    }
	@Test
	public void queryConTest()
    {
        Student student = new Student();
        Session session = sessionFactory.openSession();
        
        
        Query query = session.createQuery("from Student st where st.age>:age");
        query.setInteger("age", 25);
        List list = query.list();
        for(int i = 0 ; i <list.size(); i++)
        {
        	student = (Student)list.get(i);
            System.out.println(student);
        }
    }
	@Test
	public void criteriaTest()
    {
		Session session=sessionFactory.openSession();//��session
		Transaction tx=session.beginTransaction();//��ʼ����
		List<Student> list = session.createCriteria(Student.class)
		//��ѯ��������Ϊ����Ϊ����
		.add( Restrictions.like("name", "��%") )
		//���ò�ѯ����Ϊid>1��
		.add(Restrictions.ge("id", 1))
		//����ID�Ľ����������
		.addOrder(Order.desc("id"))
		.list();
		
		for (Student u : list) {
			System.out.println(u);
		}
		tx.commit();//�ύ����
		session.close();
    }
	
	@Test
	public void deleteTest()
    {
        Session session = sessionFactory.openSession();
        Transaction tx=session.beginTransaction();//��ʼ����
    	//Student student=(Student) session.get(Student.class, 1);
        Student student=new Student();
        student.setId(2);
    	session.delete(student);
        System.out.println(student);
		tx.commit();//�ύ����
		session.close();
    }
	
	@Test
	public void deleteHQLTest()
    {
        Session session = sessionFactory.openSession();
        Transaction tx=session.beginTransaction();//��ʼ����
        String hql = "delete Student where age>22";
        Query query = session.createQuery(hql);
        int ref = query.executeUpdate();
        System.out.println(ref);
		tx.commit();//�ύ����
		session.close();
    }
	
}
