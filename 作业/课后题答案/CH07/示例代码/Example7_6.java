import java.sql.*;
public class Example7_6{
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
			String sql = "insert into users(u_name,u_pwd) values(?,?)";
			PreparedStatement pstmt  = conn.prepareStatement(sql);
			//添加动态SQL
			pstmt.setString(1,"user5");
	    	pstmt.setString(2,"000000");
	    	pstmt.addBatch();
	    	pstmt.setString(1,"user6");
	    	pstmt.setString(2,"000000");
	    	pstmt.addBatch();
	    	//添加静态SQL 
            pstmt.addBatch("update users set u_pwd = '111111' where u_name='user1'"); 
			pstmt.executeBatch();
			pstmt.close(); 
			conn.close(); 
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}

