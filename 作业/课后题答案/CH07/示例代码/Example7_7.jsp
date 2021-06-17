<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MySQL连接池应用</title>
</head>
<body>
<%
try {
	Context initCtx = new InitialContext();//创建InitialContext对象
	DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/datasource");//tomcat服务器配置文件中数据源名称
    Connection conn = ds.getConnection();
	Statement statement = conn.createStatement();
	ResultSet rs = statement.executeQuery("select * from users");
	int userid;
	String name,password;
	while (rs.next()) {
		userid = rs.getInt(1);
		name = rs.getString(2);
		password = rs.getString(3);
		out.println(userid + ", " +name + ", "+password+"<br/>");
	}
	conn.close();
} catch (NamingException e) {
    e.printStackTrace();
} catch (Exception e) {
    e.printStackTrace();
}
 %>
</body>
</html>