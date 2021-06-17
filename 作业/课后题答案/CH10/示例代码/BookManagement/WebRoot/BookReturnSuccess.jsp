<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>还书成功页面</title>  
  </head>
  <body> 
   <center>
     <h3>还书成功！</h3>
     <%
     	request.getSession();
     	out.println("<a href="+"ReaderReturnCode.jsp?readerid="+session.getAttribute("readerid")+">读者继续还书</a>");
      %>
     <br><br>
     <a href="AdminMain.jsp">返回</a>
   </center>  
  </body>
</html>