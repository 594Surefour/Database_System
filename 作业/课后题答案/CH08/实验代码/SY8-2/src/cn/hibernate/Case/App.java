package cn.hibernate.Case;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

public class App {
	//初始化
	private static SessionFactory sessionFactory=null;
	static
	{
		Configuration cfg=new Configuration();
		cfg.configure()//读取指定的主配置文件
		.addClass(Father.class)//
		.addClass(Son.class);//
		sessionFactory = cfg.buildSessionFactory();//根据主配置文件生成session工厂
		
	}
	//保存，关联关系
	@Test
	public void testSave() throws Exception
	{
		//构建对象
		Father father=new Father();
		father.setName("张某某");
		Son son1=new Son();
		son1.setName("张三");
		Son son2=new Son();
		son2.setName("张四");
		//关联起来
		son1.setFather(father);
		son2.setFather(father);
		father.getSon().add(son1);
		father.getSon().add(son2);
		Session session=sessionFactory.openSession();//打开session
		Transaction tx=session.beginTransaction();//开始事务
		
	    //保存
		session.save(father);
		session.save(son1);
		session.save(son2);
		
		tx.commit();//提交事务
		session.close();

	}
	//可以获取到关联的对方
	@Test
	public void testGet()
	{
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		
		//获取一方
		Father father=(Father) session.get(Father.class, 1);
		System.out.println(father);
		System.out.println(father.getSon());
		
		//显示另一方信息
		Son son=(Son) session.get(Son.class, 2);
		System.out.println(son);
		System.out.println(son.getFather());
	
		tx.commit();
		session.close();
	}
	//解除关联关系
	@Test
	public void testRemoveRelation() throws Exception
	{
		Session session=sessionFactory.openSession();//打开session
		Transaction tx=session.beginTransaction();//开始事务
		//从“一”的一方解除关系
		Father father=(Father) session.get(Father.class, 1);
		father.getSon().clear();
		//从“多”的一方解除关系
		Son son=(Son) session.get(Son.class, 2);
		son.setFather(null);
		
		tx.commit();//提交事务
		session.close();
	}
	//删除关联关系
	@Test
	public void testDelete() throws Exception {

		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务
		
		//删除儿子（多的一方）对对方没有影响
//		Son son = (Son) session.get(Son.class, 2);
//		session.delete(son);
		
        //删除父亲(一的一方)  
		//a:如果没有关联的员工：可以删除
		//b：如果有有关联员工且inverse=true：由于不能维护关系，因此直接执行删除就会有异常
		//c:如果有关联员工且inverse=false：由于可以维护关联关系，因此就会先把关联的员工的外键列设为null，
		//再执行删除命令，这样就不会出现异常
		Father father=(Father) session.get(Father.class, 1);
		session.delete(father);//会报错
		tx.commit();// 提交事务
		session.close();

	}
}