import java.sql.*;//�����
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
			System.out.println("�������ݿ�ɹ���");
		} catch (SQLException ex) {
		    System.out.println("�������ݿ�ʧ�ܣ�");
		    ex.printStackTrace();
		}		
	}
}
