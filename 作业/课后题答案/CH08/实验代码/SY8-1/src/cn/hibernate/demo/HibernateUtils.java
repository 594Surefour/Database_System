package cn.hibernate.demo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	//ȫ��ֻ��Ҫһ��SesssionFactory�Ϳ�����
	private static SessionFactory sessionFactory;
	//��ʼ��session
	static{
		Configuration cfg=new Configuration();
	//	cfg.configure();//��ȡĬ�������ļ���hibernate.cfg.xml��
//		//cfg.configure("hibernate.cfg.xml");//��ȡָ��λ�õ������ļ�
//		sessionFactory = cfg.buildSessionFactory();
		
		//cfg.addResource("org/synu/a_helloworld/User.hbm.xml");
		//cfg.addClass(User.class);//ȥUser�����ڵİ���������ΪUser����׺Ϊ.hbm.xml���ļ��������������
		
		sessionFactory=cfg.configure().buildSessionFactory();
		
		
	}
	
	/**
	 * ��ȡȫ��ΨһSessionFactory
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
