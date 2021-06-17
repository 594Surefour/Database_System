<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>借阅图书页面</title>  
  </head>
  <body>
     <h1 align="center">借阅图书</h1>
     <center>
  	 <form id="booklend" name="booklend" method="post" action="servlet/BookLendServlet">
       <table>
        <tr>
           <td>图书条形码：</td>
           <td>
              <input name="bookcode"  type="text" title="图书条形码"/>
           </td>
        </tr>
        <tr>
           <td>读者借书证号码：</td>
           <td>
             <input name="readerid"  type="text" title="读者借书证号码"/>
           </td>
        </tr>
        <tr>
           <td> </td>
           <td align="right">
             <input type="submit"  value="借书"/ >
           </td>
        </tr>  
      </table>  
    </form> 
    </center> 
  </body>
</html>