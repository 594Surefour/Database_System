package cn.hibernate.demo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	//全局只需要一个SesssionFactory就可以了
	private static SessionFactory sessionFactory;
	//初始化session
	static{
		Configuration cfg=new Configuration();
	//	cfg.configure();//读取默认配置文件（hibernate.cfg.xml）
//		//cfg.configure("hibernate.cfg.xml");//读取指定位置的配置文件
//		sessionFactory = cfg.buildSessionFactory();
		
		//cfg.addResource("org/synu/a_helloworld/User.hbm.xml");
		//cfg.addClass(User.class);//去User类所在的包里面名称为User，后缀为.hbm.xml的文件。这个方法常用
		
		sessionFactory=cfg.configure().buildSessionFactory();
		
		
	}
	
	/**
	 * 获取全局唯一SessionFactory
	 * @return sessionFactory
	 */
	public static SessionFactory getSessionFactory()
	{
		return sessionFactory;
		
	}
	
	public static Session opennSession()
	{
		return sessionFactory.openSession();
		
	}

}
