<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>读者基本信息修改</title>  
  </head>
  <body>
     <h1 align="center">读者基本信息修改</h1>
     <center>
  	 <form id="readerid" name="readerid" method="post" action="servlet/ReaderIdCheck">
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
             <input type="submit"  value="确认提交"/ >
           </td>
        </tr>  
      </table>  
    </form> 
    </center> 
  </body>
</html>