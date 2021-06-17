
import java.sql.*;	
	public class Example7_2_1{
	public static void main(String arg[]){
	    Connection conn = null;
	    Statement stmt = null;
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
		    conn = DriverManager.getConnection(url,user,password);
		    stmt = conn.createStatement();
			String sql = "insert into users(u_name,u_pwd) values('zhangping','123456')";
		 	int temp = stmt.executeUpdate(sql);
		 	if(temp!=0){
		 		System.out.println("记录添加成功！");
		 	}
		 	else{
		 		System.out.println("记录添加失败！");
		 	}
	        stmt.close();            
	        conn.close();         
	     } catch (SQLException ex) {
	          ex.printStackTrace();
	     }
		}
	}

