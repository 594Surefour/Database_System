<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="databasemanage.DatabaseManage" %>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <title>读者类型参数信息</title>  
  </head>
  <body>
  <h1 align="center">读者类型参数信息</h1>
  <center>
  	<%
  		request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		DatabaseManage dm=new DatabaseManage();
		Connection con=null;
		ResultSet rs=null;
		con=dm.getConnection();
		String sql="select * from tb_readertype";
		if(con!=null){
			rs=dm.executeQuery(sql);
		}
		try{
			if(rs!=null&&rs.next()){
				out.println("<table width=60% border=1 cellspacing=0>");
				out.println("<tr>");
				out.println("<th>读者类型</th>");
				out.println("<th>借书数量</th>");
				out.println("<th>借期天数</th>");
				out.println("<th>超期还书时每日罚款金额</th>");
				out.println("<th>操作</th>");
				out.println("</tr>");
				rs.beforeFirst();
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString("readertype")+"</td>");
					out.println("<td>"+rs.getInt("bookamount")+"</td>");
					out.println("<td>"+rs.getInt("bookdays")+"</td>");
					out.println("<td>"+rs.getBigDecimal("dayfine")+"</td>");
					out.println("<td>");
					out.println("<a href="+"ReaderTypeModify.jsp?readertype="+rs.getString("readertype")+">修改</a>");					
					out.println("</td>");
					out.println("</tr>");					
				}
				out.println("</table>");				
			}						
		}
		catch(Exception e){
			e.printStackTrace();
		}
		dm.close();		
  	%>
  	<br><br>
  	<a href="ReaderTypeAdd.jsp">添加读者类型</a><br><br>
  	<a href="AdminMain.jsp">返回</a>
  	</center>
  </body>
</html>
