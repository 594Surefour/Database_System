import java.sql.*;
public class Example7_4{
	public static void main(String arg[]){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			System.out.println("加载数据库驱动时抛出异常！");
			e.printStackTrace();
		}
		try {
			String url="jdbc:mysql://localhost:3306/bookstore";
			String user="root";
			String password="123456";
			Connection conn = DriverManager.getConnection(url,user,password);
			Statement stmt = conn.createStatement();
			stmt.addBatch("insert into users(u_name,u_pwd) values ('user1', '000000')");
			stmt.addBatch("insert into users(u_name,u_pwd) values ('user2', '000000')");
			stmt.addBatch("update users set u_pwd='000000' where u_name='linli'");
			stmt.addBatch("delete from users where u_name='zhangh'");
			stmt.executeBatch();
			stmt.close(); 
			conn.close(); 
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}


