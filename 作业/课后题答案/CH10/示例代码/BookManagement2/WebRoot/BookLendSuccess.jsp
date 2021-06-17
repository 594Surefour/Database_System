<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>借阅图书成功页面</title>  
  </head>
  <body> 
   <center>
     <h3>借阅图书成功！</h3>
     <%
     	request.getSession();
     	out.println("<a href="+"ReaderBorrowInformation.jsp?readerid="+session.getAttribute("readerid")+">读者继续借阅</a>");
      %>
     <br><br>
     <a href="AdminMain.jsp">返回</a>
   </center>  
  </body>
</html>