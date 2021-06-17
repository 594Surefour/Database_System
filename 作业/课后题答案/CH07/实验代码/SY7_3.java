import java.sql.*;
public class SY7_3{
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
			Statement stmt = conn.createStatement();
			String sql = "select * from students";
			ResultSet rs = stmt.executeQuery(sql);
			String id,name,sex,department;
			System.out.println("id" + " | " +"name" + " | "+"sex"+ " | "+"department");
			while(rs.next()){
				id = rs.getString(1);	
				name = rs.getString(2);	
				sex = rs.getString(3);
				department=rs.getString(4);
				System.out.println(id + " | " +name + " | "+sex+ " | "+department);	
			}
			rs.close();
			stmt.close(); 
			conn.close(); 
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}