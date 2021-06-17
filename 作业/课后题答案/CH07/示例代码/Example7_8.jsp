<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页显示</title>
<style type="text/css">
body{font-size:14px;}
</style>
</head>
<body>
<% 
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
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); 
        String sql = "select b_name,b_author,b_publisher,b_marketprice,b_saleprice from bookinfo"; 
	 	//返回可滚动的结果集 
	 	rs = stmt.executeQuery(sql);
	 	out.print("<h2 align='center'>图书基本信息表</h2>"); 
	 	out.print("<table border='1px' width='90%' align='center'>"); 
        out.print("<tr>"); 
        out.print("<th>"+"图书名称"); 
        out.print("<th>"+"作者"); 
        out.print("<th>"+"出版社"); 
        out.print("<th>"+"市场价格"); 
        out.print("<th>"+"销售价格"); 
       	out.print("</tr>"); 
       	String str=(String)request.getParameter("page"); 
       	if(str==null) 
       	{ 
       		str="1"; 
       	} 
       		 	int pageSize=3;   //每页显示的记录数 
	 	rs.last();		//将游标移动到最后一行 
	 	int recordCount=rs.getRow();   	//获取最后一行的行号，即记录总数 
	 	//计算分页后的总页数 
	 	int pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1); 
	 	int currentPage=Integer.parseInt(str);		//当前显示的页数	 
       	if(currentPage<1) 
       	{ 
       		currentPage=1; 
       	} 
       	else if(currentPage>pageCount) 
       	{ 
       		currentPage=pageCount; 
       	} 
	 	rs.absolute((currentPage-1)*pageSize+1);	//设置游标的位置 
		for(int i=1;i<=pageSize;i++) 
		{ 
			out.print("<tr>"); 
        	out.print("<td>"+rs.getString("b_name")+"</td>"); 
        	out.print("<td>"+rs.getString("b_author")+"</td>"); 
        	out.print("<td>"+rs.getString("b_publisher")+"</td>"); 
        	out.print("<td>"+rs.getFloat("b_marketprice")+"</td>"); 
        	out.print("<td>"+rs.getFloat("b_saleprice")+"</td>"); 
	       	out.print("</tr>"); 
	       	if(!rs.next()) break; 
	    } 
	    out.print("</table>"); 
%>
<p align="center">当前页数：[<%=currentPage%>/<%=pageCount%>]&nbsp;
<%
	if(currentPage>1)
	{
%>
<a href="Example7_8.jsp?page=1">第一页</a>
<a href="Example7_8.jsp?page=<%=currentPage-1%>">上一页</a>
<%
	}
	if(currentPage<pageCount)
	{
%>
<a href="Example7_8.jsp?page=<%=currentPage+1%>">下一页</a>
<a href="Example7_8.jsp?page=<%=pageCount%>">最后一页</a>
<%
		}
        rs.close();
        stmt.close();            
        conn.close();         
	} catch (SQLException ex) {
    	ex.printStackTrace();
	}
%>
</p>
</body>
</html>