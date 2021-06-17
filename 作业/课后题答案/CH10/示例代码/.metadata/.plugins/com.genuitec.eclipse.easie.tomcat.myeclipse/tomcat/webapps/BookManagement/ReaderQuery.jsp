<%@ page contentType="text/html;charset=UTF-8" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
 %>
<html>
  <head>
    <title>读者图书查询页面</title>  
  </head>
  <body>
     <h1 align="center">图书查询</h1>
     <center>
  	 <form id="bookquery" name="bookquery" method="post" action="BookQuery.jsp">
       <table>
        <tr>
           <td>图书名称：</td>
           <td>
              <input name="bookname"  type="text" title="图书名称"/>
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