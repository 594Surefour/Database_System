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
	//初始化
	private static SessionFactory sessionFactory=null;
	static
	{
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");//读取指定的主配置文件
		sessionFactory = cfg.buildSessionFactory();//根据主配置文件生成session工厂
		
	}
	
	@Test
	public void testSave() throws Exception
	{

		//保存
		Student user=new Student();
		user.setName("张三");
		Session session=sessionFactory.openSession();//打开session
		Transaction tx=session.beginTransaction();//开始事务
		session.save(user);
		System.out.println(user);
		tx.commit();//提交事务
		session.close();

	}
	@Test
	public void testGet()
	{
		
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		Student user=(Student) session.get(Student.class, 1);//获取id为1的user对象
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
		Session session=sessionFactory.openSession();//打开session
		Transaction tx=session.beginTransaction();//开始事务
		List<Student> list = session.createCriteria(Student.class)
		//查询条件设置为姓名为张三
		.add( Restrictions.eq("name", "张三") )
		//设置查询条件为id>1的
		.add(Restrictions.gt("id", 1))
		//按照ID的降序进行排序
		.addOrder(Order.desc("id"))
		.list();
		
		for (Student u : list) {
			System.out.println(u);
		}
		tx.commit();//提交事务
		session.close();
    }

	
	
}
