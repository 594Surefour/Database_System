package cn.hibernate.Case;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;


public class App {
	// 初始化
	private static SessionFactory sessionFactory = null;
	static {
		Configuration cfg = new Configuration();
		cfg.configure()// 读取指定的主配置文件
				.addClass(Role.class)//
				.addClass(Department.class)//
				.addClass(User.class);
		sessionFactory = cfg.buildSessionFactory();// 根据主配置文件生成session工厂
	}

	// 保存，关联关系
	@Test
	public void testSave() throws Exception {
		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务
		// 创建对象
		User user1 = new User();
		user1.setName("王刚");
		user1.setGender("男");
		
		User user2 = new User();
		user2.setName("李红");
		user2.setGender("女");
		
        Department department1=new Department();
        department1.setName("销售部");
        department1.setDescription("负责销售和客户关系维护");
        
        Department department2=new Department();
        department2.setName("研发部");
        department2.setDescription("负责产品开发");
        
        Role role1=new Role();
        role1.setName("部门经理");
        
        Role role2=new Role();
        role2.setName("工程师");
        
        department1.getUsers().add(user1);
        department1.getUsers().add(user2);
        
        role1.getUsers().add(user1);
        role2.getUsers().add(user2);

		// 保存
		session.save(user1);
		session.save(user2);
		session.save(department1);
		session.save(department2);
		session.save(role1);
		session.save(role2);

		tx.commit();// 提交事务
		session.close();
	}

	// 可以获取到关联的对方
	@Test
	public void testGet() {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		// 通过员工获取获部门信息
		User user = (User) session.get(User.class, 1L);
		System.out.println(user);
		System.out.println("通过员工获取获部门信息"+user.getDepartment());

	   // 通过部门获取获员工信息
		Department department = (Department) session.get(Department.class, 1L);
		System.out.println(department);
		System.out.println("通过部门获取获员工信息:"+department.getUsers());

		// 通过员工获取获角色信息
		User user1 = (User) session.get(User.class, 1L);
		User user2 = (User) session.get(User.class, 2L);
		System.out.println(user1);
		System.out.println(user2);
		System.out.println("通过员工1获取获角色信息:"+user1.getRoles());
		System.out.println("通过员工2获取获角色信息:"+user2.getRoles());
		

		// 通过角色获取获员工信息
		Role role1 = (Role) session.get(Role.class, 1L);
		Role role2 = (Role) session.get(Role.class, 2L);
		System.out.println(role1);
		System.out.println(role2);
		System.out.println("通过角色1获取获员工信息:"+role1.getUsers());
		System.out.println("通过角色2获取获员工信息:"+role2.getUsers());
		
		tx.commit();
		session.close();
	}

	// 解除关联关系，删除对象的影响
	@Test
	public void testRemoveRelation() throws Exception {

		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务
		//如果inverse=true，则不能解除关联关系
		//需要解除id为1的user1在部门1的关系,
		//如果从"多"的一方进行设置
		User user1 = (User) session.get(User.class, 1L);
		user1.setDepartment(null);
		//如果从"一"的一方进行设置
		Department department = (Department) session.get(Department.class, 1L);
		department.getUsers().clear();
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
		User user1 = (User) session.get(User.class, 1L);
		session.delete(user1);
		tx.commit();// 提交事务
		session.close();

	}
}
