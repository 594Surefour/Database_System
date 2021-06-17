<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>图书归还页面</title>  
  </head>
  <body>
     <h1 align="center">图书归还</h1>
     <center>
     <%
     	//request.getSession(true);
     	String readerid=request.getParameter("readerid");
     	//session.setAttribute("readerid",readerid);
      %>
  	 <form id="bookreturncode" name="bookreturncode" method="post" action="ReaderTurnQuery.jsp?readerid=<%=readerid%>">
       <table>
        <tr>
           <td>图书条形码：</td>
           <td>
             <input name="bookcode"  type="text" title="图书条形码"/>
           </td>
        </tr>
        <tr>
           <td> </td>
           <td align="right">
             <input type="submit"  value="查询"/ >
           </td>
        </tr>  
      </table>  
    </form> 
    </center> 
  </body>
</html>