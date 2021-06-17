<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="databasemanage.DatabaseManage" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.*" %>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>图书归还处理</title>  
  </head>
  <body>
  <h1 align="center">图书归还处理</h1>
  <center>
  	<%
  		request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		DatabaseManage dm=new DatabaseManage();
  		request.getSession();
  		String bookcode=request.getParameter("bookcode");
  		session.setAttribute("bookcode",bookcode);
  		String readerid=(String)session.getAttribute("readerid");
		Connection con=null;
		ResultSet rs=null;
		con=dm.getConnection();
		try{
			PreparedStatement pstmt=con.prepareStatement("select * from tb_booklend where bookcode=? and readerid=? and returndate is NULL");
			pstmt.setString(1, bookcode);
			pstmt.setString(2, readerid);
			rs=pstmt.executeQuery();
			rs.next();
			java.sql.Date duedate=rs.getDate("duedate");
			String sql="select * from tb_reader where readerid="+"\'"+readerid+"\'";
		    if(con!=null){
				rs=dm.executeQuery(sql);
		    }
		    rs.next();
		    String readertype=rs.getString(9);
		    sql="select * from tb_readertype where readertype="+"\'"+readertype+"\'";
				if(con!=null){
			  	rs=dm.executeQuery(sql);
		    }
		    rs.next();
		    BigDecimal dayfine=rs.getBigDecimal(4);
		    Calendar cal = Calendar.getInstance();     
            long time1 = cal.getTimeInMillis();                 
            cal.setTime(duedate);    
            long time2 = cal.getTimeInMillis();         
            long between_days=(time1-time2)/(1000*3600*24);  
            int days=(int)between_days;           
			if(duedate.before(new java.util.Date())){
				out.println("图书已超期!");
				out.println("超期天数:"+days);
				out.println("罚款金额："+dayfine.multiply(new BigDecimal(days)));				
			}
		}catch(Exception e){
			e.printStackTrace();
		}						
		dm.close();		
  	%>
  	<br><br>
  	<a href="servlet/ReaderTurnServlet">还书</a><br><br>
  	</center>
  </body>
</html>
