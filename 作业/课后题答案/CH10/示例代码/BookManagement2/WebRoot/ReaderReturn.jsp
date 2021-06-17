<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>图书归还页面</title>  
  </head>
  <body>
     <h1 align="center">图书归还</h1>
     <center>
  	 <form id="bookreturn" name="bookreturn" method="post" action="ReaderReturnCode.jsp">
       <table>
        <tr>
           <td>读者借书证号码：</td>
           <td>
             <input name="readerid"  type="text" title="读者借书证号码"/>
           </td>
        </tr>
        <tr>
           <td> </td>
           <td align="right">
             <input type="submit"  value="下一步"/ >
           </td>
        </tr>  
      </table>  
    </form> 
    </center> 
  </body>
</html>