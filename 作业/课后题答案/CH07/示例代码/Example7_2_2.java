
import java.sql.*;	
public class Example7_2_2{
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
	         String sql="insert into users(u_name,u_pwd) values(?,?)";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1,"zhangping2");
	         pstmt.setString(2,"123456");
		     int temp =pstmt.executeUpdate();	        
		 	 if(temp!=0){
		 		 System.out.println("记录添加成功！");
		 	 }
		 	 else{
		 		System.out.println("记录添加失败1！");
		 	 }
	          pstmt.close();            
	          conn.close();         
	     } catch (SQLException ex) {
	          ex.printStackTrace();
	     }
	}
}


