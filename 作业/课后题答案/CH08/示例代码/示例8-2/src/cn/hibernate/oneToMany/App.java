package cn.hibernate.oneToMany;


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
				.addClass(Employee.class)//
				.addClass(Department.class);//
		sessionFactory = cfg.buildSessionFactory();// 根据主配置文件生成session工厂

	}

	// 保存，关联关系
	@Test
	public void testSave() throws Exception {

		// 构建对象
		Department department = new Department();
		department.setName("开发部");
		Employee employee1 = new Employee();
		employee1.setName("张三");
		Employee employee2 = new Employee();
		employee2.setName("李四");
		// 关联起来，一般来说，两边还是都设置对方,员工设置在某个部门
		employee1.setDepartment(department);
		employee2.setDepartment(department);
		//部门中也要将两个员工加入
		department.getEmployee().add(employee1);
		department.getEmployee().add(employee2);
		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务
		// 两者都要保存  保存时候，注意将依赖别人的对象保存在后面，被依赖的对象放在前面保存，这样可以提高效率
		session.save(department);
		session.save(employee1);
		session.save(employee2);
		tx.commit();// 提交事务
		session.close();

	}

	// 可以获取到关联的对方
	@Test
	public void testGet() {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		// 获取一方
		Department department = (Department) session.get(Department.class, 1);
		System.out.println(department);
		System.out.println(department.getEmployee());

		// 显示另一方信息
		Employee employee = (Employee) session.get(Employee.class, 1);
		System.out.println(employee);
		System.out.println(employee.getDepartment());

		tx.commit();
		session.close();
	}

	// 解除关联关系，删除对象的影响
	@Test
	public void testRemoveRelation() throws Exception {

		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务
		
		//从员工方解除
//		Employee employee = (Employee) session.get(Employee.class, 1);
//		employee.setDepartment(null);
		
		//从部门方解除  这里必须将Department.hbm.xml中的Set集合中的inverse属性改为false，
		//否则修改无法生效
		Department department = (Department) session.get(Department.class, 1);
		department.getEmployee().clear();
		

		tx.commit();// 提交事务
		session.close();

	}
	@Test
	public void testDelete() throws Exception {

		Session session = sessionFactory.openSession();// 打开session
		Transaction tx = session.beginTransaction();// 开始事务
		
		//删除员工（多的一方）对对方没有影响
//		Employee employee = (Employee) session.get(Employee.class, 4);
//		session.delete(employee);
		
        //删除部门(一的一方)  
		//a:如果没有关联的员工：可以删除
		//b：如果有有关联员工且inverse=true：由于不能维护关系，因此直接执行删除就会有异常
		//c:如果有关联员工且inverse=false：由于可以维护关联关系，因此就会先把关联的员工的外键列设为null，
		//再执行删除命令，这样就不会出现异常
		Department department = (Department) session.get(Department.class, 1);
		session.delete(department);
		
		tx.commit();// 提交事务
		session.close();

	}
}
