//调用
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

public class Main {
    Connection con;
    public void getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("数据库驱动加载成功");
        } catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        //String sql = "SELECT * FROM customer";
        try {
            String url ="jdbc:mysql://localhost:3306/bank_2";
            String user="root";    //访问数据库的用户名
            String password="123456";    //访问数据库的密码
            con= DriverManager.getConnection(url,user,password);
            System.out.println("连接数据库成功！");

        } catch (SQLException ex) {
            System.out.println("连接数据库失败！");
            ex.printStackTrace();
        }
    }
    public void Procedure(){
        try {
            String call="{call pro_updateAccount()}";
            CallableStatement callableStatement = con.prepareCall(call);
            callableStatement.execute();

            System.out.println("procedure 调用成功！");
            con.close();
        }catch(SQLException ec){
            System.out.println("procedure 调用失败！");
            ec.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Main c = new Main();
        c.getConnection();
        c.Procedure();
    }
}