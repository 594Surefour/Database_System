<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>增添图书信息页面</title>  
  </head>
  <body>
     <h1 align="center">增添图书基本信息</h1>
     <center>
  	 <form id="bookadd" name="bookadd" method="post" action="servlet/BookAddServlet">
       <table>
        <tr>
           <td align=right>图书国际标准书号：</td>
           <td>
              <input name="isbn"  type="text" title="图书国际标准书号"/>
           </td>
        </tr>
        <tr>
           <td align=right>图书名称：</td>
           <td>
              <input name="bookname"  type="text" title="图书名称"/>
           </td>
        </tr>
        <tr>
           <td align=right>作者：</td>
           <td>
              <input name="bookauthor"  type="text" title="作者"/>
           </td>
        </tr>
        <tr>
           <td align=right>译者：</td>
           <td>
              <input name="booktranslator"  type="text" title="译者"/>
           </td>
        </tr>
        <tr>
           <td align=right>出版社：</td>
           <td>
              <input name="bookpublisher"  type="text" title="出版社"/>
           </td>
        </tr>
        <tr>
           <td align=right>出版日期：</td>
           <td>
              <input name="publishdate"  type="text" title="出版日期"/>
           </td>
        </tr>
        <tr>
           <td align=right>页数：</td>
           <td>
              <input name="bookpage"  type="text" title="页数"/>
           </td>
        </tr>
        <tr>
           <td align=right>定价：</td>
           <td>
              <input name="bookprice"  type="text" title="定价"/>
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