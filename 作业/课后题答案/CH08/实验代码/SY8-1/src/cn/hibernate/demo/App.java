package cn.hibernate.demo;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;


public class App {
	//��ʼ��
	private static SessionFactory sessionFactory=null;
	static
	{
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");//��ȡָ�����������ļ�
		sessionFactory = cfg.buildSessionFactory();//�����������ļ�����session����
		
	}
	
	@Test
	public void testSave() throws Exception
	{

		//����
		Student user=new Student();
		user.setName("����");
		Session session=sessionFactory.openSession();//��session
		Transaction tx=session.beginTransaction();//��ʼ����
		session.save(user);
		System.out.println(user);
		tx.commit();//�ύ����
		session.close();

	}
	@Test
	public void testGet()
	{
		
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		Student user=(Student) session.get(Student.class, 1);//��ȡidΪ1��user����
		System.out.println(user.getName());
		tx.commit();
		session.close();
	}
	@Test
	public void queryTest()
    {
        Student student = new Student();
        Session session = HibernateUtils.opennSession();
        
        Query query = session.createQuery("from Student");
        List list = query.list();
        for(int i = 0 ; i <list.size(); i++)
        {
        	student = (Student)list.get(i);
            System.out.println(student.getId());
            System.out.println(student.getName());
        }
    }
	
	@Test
	public void criteriaTest()
    {
		Session session=sessionFactory.openSession();//��session
		Transaction tx=session.beginTransaction();//��ʼ����
		List<Student> list = session.createCriteria(Student.class)
		//��ѯ��������Ϊ����Ϊ����
		.add( Restrictions.eq("name", "����") )
		//���ò�ѯ����Ϊid>1��
		.add(Restrictions.gt("id", 1))
		//����ID�Ľ����������
		.addOrder(Order.desc("id"))
		.list();
		
		for (Student u : list) {
			System.out.println(u);
		}
		tx.commit();//�ύ����
		session.close();
    }

	
	
}
