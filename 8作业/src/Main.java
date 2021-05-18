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
    public void Select(){
        try {
            Statement stmt1 = con.createStatement();
            String sql1 = "SELECT CUST_ID, PRODUCT_CD, AVAIL_BALANCE FROM account WHERE AVAIL_BALANCE > 5000\n" +
                    "ORDER BY AVAIL_BALANCE ASC;";
            ResultSet res = stmt1.executeQuery(sql1);

            while (res.next())
            {
                String cust = res.getString(1);
                String type = res.getString(2);
                String amount = res.getString(3);
                System.out.println("cust_id:"+cust+", product_cd:"+type+", avail_balance:"+amount);
            }
            System.out.println("查询成功！");
            res.close();
            stmt1.close();
            con.close();
        }catch(SQLException ec){
            System.out.println("查询失败！");
            ec.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Main c = new Main();
        c.getConnection();
        c.Select();
    }
}