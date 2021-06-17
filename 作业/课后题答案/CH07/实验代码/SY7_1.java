import java.sql.*;//导入包
public class SY7_1 {
	public static void main(String arg[]){
	    try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		}
		try{
		    String url="jdbc:mysql://localhost:3306/studentmanage";
		    String user="root";
		    String password="123456";
			Connection conn = DriverManager.getConnection(url,user,password);
			System.out.println("连接数据库成功！");
		} catch (SQLException ex) {
		    System.out.println("连接数据库失败！");
		    ex.printStackTrace();
		}		
	}
}
