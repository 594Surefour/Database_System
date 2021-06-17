import java.sql.*;
public class Example7_5{
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
			pstmt.setString(1,"user3");
	    	pstmt.setString(2,"000000");
	    	pstmt.addBatch();
	    	pstmt.setString(1,"user4");
	    	pstmt.setString(2,"000000");
	    	pstmt.addBatch();
			pstmt.executeBatch();
			pstmt.close(); 
			conn.close(); 
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}
