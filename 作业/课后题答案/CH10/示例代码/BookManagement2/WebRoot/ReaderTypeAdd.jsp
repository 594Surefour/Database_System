<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>读者类型添加</title>  
  </head>
  <body>
  <h1 align="center">读者类型添加</h1> 	
	<center>
		<form id="readertypeadd" name="readertypeadd" method="post" action="servlet/ReaderTypeAddServlet">
		<table>
		<tr>
			<td align=right>读者类型：</td>
			<td>
				<input name="readertype"  type="text" >
			</td>
		</tr>
		<tr>
			<td align=right>借书数量：</td>
			<td align=right>
				<input name="bookamount"  type="text"  >
			</td>
		</tr>
		<tr>
			<td align=right>借期天数：</td>
			<td>
				<input name="bookdays"  type="text" >
			</td>
		</tr>
		<tr>
			<td align=right>超期还书时每日罚款金额：</td>
			<td>
				<input name="dayfine"  type="text" >
			</td>
		</tr>
		<tr>
			<td></td>
  	        <td align="right">
               <input type="submit"  value="添加"/ >
           </td>
        </tr>
     </table>
  	</form>
  	</center>	
  </body>
</html>
