<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="databasemanage.DatabaseManage" %>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <title>读者类型参数修改</title>  
  </head>
  <body>
  <h1 align="center">读者类型参数修改</h1>
  	<%
  		request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		String readertype=request.getParameter("readertype");	
  		DatabaseManage dm=new DatabaseManage();
		Connection con=null;
		ResultSet rs=null;
		con=dm.getConnection();
		String sql="select * from tb_readertype where readertype='"+readertype+"'";
		if(con!=null){
			rs=dm.executeQuery(sql);
			rs.absolute(1);
		}
	%>
	<center>
		<form id="readertypemodify" name="readertypemodify" method="post" action="servlet/ReaderTypeModiServlet">
		<table>
		<tr>
			<td align=right>读者类型：</td>
			<td>
				<input name="readertype"  type="text" value=<%=rs.getString(1) %> readonly>
			</td>
		</tr>
		<tr align=right>
			<td align=right>借书数量：</td>
			<td>
				<input name="bookamount"  type="text" value=<%=rs.getInt(2) %> >
			</td>
		</tr>
		<tr>
			<td align=right>借期天数：</td>
			<td>
				<input name="bookdays"  type="text" value=<%=rs.getInt(3) %> >
			</td>
		<tr>
			<td align=right>超期还书时每日罚款金额：</td>
			<td>
				<input name="dayfine"  type="text" value=<%=rs.getBigDecimal(4) %> >
			</td>
		</tr>
		<tr>
			<td></td>
  	        <td align="right">
               <input type="submit"  value="修改"/ >
           </td>
        </tr>
     </table>
  	</form>
  	</center>
  	<%	
		dm.close();		
  	%>
  </body>
</html>
