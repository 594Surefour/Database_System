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
	//初始化
	private static SessionFactory sessionFactory=null;
	static
	{
		Configuration cfg=new Configuration();
		//读取指定的主配置文件
		cfg.configure("hibernate.cfg.xml");
		//根据主配置文件生成session工厂
		sessionFactory = cfg.buildSessionFactory();
	}
	//添加操作
	@Test
	public void saveTest()
	{
		//保存
		Student student=new Student();
		student.setName("李刚");
		student.setAge(22);
		//打开session
		Session session=sessionFactory.openSession();
		//开始事务
		Transaction tx=session.beginTransaction();
		//将数据存储到数据表中
		session.save(student);
		//提交事务
		tx.commit();
		//关闭session
		session.close();
	}
	@Test
	public void testGet()
	{
		
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		//获取id为1的student对象
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
		//获取id为1的student对象
		Student student=(Student) session.get(Student.class, 1);
		System.out.println(student.getName());
		tx.commit();
		session.close();
	}
	
	@Test
	public void testUpdate()
	{
		
		//保存
		Student student=new Student();
		student.setId(1);
		student.setName("张红");
		student.setAge(28);
		//打开session
		Session session=sessionFactory.openSession();
		//开始事务
		Transaction tx=session.beginTransaction();
		//将数据更新到数据表中
		session.update(student);
		//提交事务
		tx.commit();
		//关闭session
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
		Session session=sessionFactory.openSession();//打开session
		Transaction tx=session.beginTransaction();//开始事务
		List<Student> list = session.createCriteria(Student.class)
		//查询条件设置为姓名为张三
		.add( Restrictions.like("name", "李%") )
		//设置查询条件为id>1的
		.add(Restrictions.ge("id", 1))
		//按照ID的降序进行排序
		.addOrder(Order.desc("id"))
		.list();
		
		for (Student u : list) {
			System.out.println(u);
		}
		tx.commit();//提交事务
		session.close();
    }
	
	@Test
	public void deleteTest()
    {
        Session session = sessionFactory.openSession();
        Transaction tx=session.beginTransaction();//开始事务
    	//Student student=(Student) session.get(Student.class, 1);
        Student student=new Student();
        student.setId(2);
    	session.delete(student);
        System.out.println(student);
		tx.commit();//提交事务
		session.close();
    }
	
	@Test
	public void deleteHQLTest()
    {
        Session session = sessionFactory.openSession();
        Transaction tx=session.beginTransaction();//开始事务
        String hql = "delete Student where age>22";
        Query query = session.createQuery(hql);
        int ref = query.executeUpdate();
        System.out.println(ref);
		tx.commit();//提交事务
		session.close();
    }
	
}
