<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>读者借阅图书页面</title>  
  </head>
  <body>
     <h1 align="center">读者借阅图书</h1>
     <center>
     <form id="readerborrow" name="readerborrow" method="post" action="ReaderBorrowInformation.jsp">
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
             <input type="submit"  value="查询"/ >
           </td>
        </tr>  
      </table>  
    </form> 
    </center> 
  </body>
</html>