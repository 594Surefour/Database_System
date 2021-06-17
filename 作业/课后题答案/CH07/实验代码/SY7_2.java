import java.sql.*;
public class SY7_2{
	public static void main(String arg[]){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			System.out.println("加载数据库驱动时抛出异常！");
			e.printStackTrace();
		}
		try {
			String url="jdbc:mysql://localhost:3306/studentmanage";
			String user="root";
			String password="123456";
			Connection conn = DriverManager.getConnection(url,user,password);
			String sql = "insert into students(sno,sname) values(?,?)";
			PreparedStatement pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1,"001");
	    	pstmt.setString(2,"张三");
	    	pstmt.addBatch();
	    	pstmt.setString(1,"002");
	    	pstmt.setString(2,"李四");
	    	pstmt.addBatch();
	    	pstmt.setString(1,"003");
	    	pstmt.setString(2,"王五");
	    	pstmt.addBatch();
			pstmt.executeBatch();
			pstmt.close(); 
			conn.close(); 
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}

