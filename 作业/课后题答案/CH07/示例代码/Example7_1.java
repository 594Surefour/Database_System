import java.sql.*;		//导入包
public class Example7_1{
public static void main(String arg[]){
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
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
		 String sql = "select u_id,u_name,u_sex from users";         
	 	 rs = stmt.executeQuery(sql);
	 	 int id;
	 	 String name,sex;
			while(rs.next()){
				id = rs.getInt(1);	
                name = rs.getString(2);		
			    sex = rs.getString(3);
		        System.out.println(id + ", " +name + ", "+sex);	
	    }
         rs.close();
         stmt.close();            
         conn.close();         
     } catch (SQLException ex) {
         ex.printStackTrace();
     }
	}
}
