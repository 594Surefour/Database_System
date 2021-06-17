<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>读者登录页面</title>  
  </head>
  <body>
     <h1 align="center">图书管理系统</h1>
     <center>
     <img src="images/login.jpg" width="600" height="200" />
  	 <form id="readerlogin" name="readerlogin" method="post" action="servlet/ReaderLoginCheck">
       <table>
        <tr>
           <td>用户名称：</td>
           <td>
              <input name="readername"  type="text" title="用户名称"/>
           </td>
        </tr>
        <tr>
           <td>密码：</td>
           <td>
             <input name="password"  type="password" title="密码"/>
           </td>
        </tr>
        <tr>
           <td> </td>
           <td align="right">
             <input type="submit"  value="登录"/ >
           </td>
        </tr>  
      </table>  
    </form> 
    </center> 
  </body>
</html>