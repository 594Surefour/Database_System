<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>增添图书馆藏信息页面</title>  
  </head>
  <body>
     <h1 align="center">增添图书馆藏基本信息</h1>
     <center>
  	 <form id="bookinfoadd" name="bookinfoadd" method="post" action="servlet/BookInfoAddServlet">
       <table>
       <tr>
           <td align=right>图书条形码：</td>
           <td>
              <input name="bookcode"  type="text" title="图书条形码"/>
           </td>
        </tr>
        <tr>
           <td align=right>图书国际标准书号：</td>
           <td>
              <input name="isbn"  type="text" title="图书国际标准书号"/>
           </td>
        </tr>
        <tr>
           <td align=right>图书是否可借：</td>
           <td>
              <input name="status"  type="text" title="图书是否可借"/>
           </td>
        </tr>
        
        
       
        <tr>
           <td> </td>
           <td align="right">
             <input type="submit"  value="确认添加"/ >
           </td>
        </tr>  
      </table>  
    </form> 
    </center> 
  </body>
</html>