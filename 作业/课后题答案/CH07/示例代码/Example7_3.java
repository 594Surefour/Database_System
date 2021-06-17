import java.sql.*;
public class Example7_3{
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
			String sql = "select * from users where u_sex='女'";
			ResultSet rs = stmt.executeQuery(sql);
			int id;
			String name,sex,phone;
			System.out.println("id" + " | " +"name" + " | "+"sex"+ " | "+"phone");
			while(rs.next()){
				id = rs.getInt(1);	
				name = rs.getString(2);	
				sex = rs.getString(4);
				phone=rs.getString(5);
				System.out.println(id + " | " +name + " | "+sex+ " | "+phone);	
			}
			rs.close();
			stmt.close(); 
			conn.close(); 
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}