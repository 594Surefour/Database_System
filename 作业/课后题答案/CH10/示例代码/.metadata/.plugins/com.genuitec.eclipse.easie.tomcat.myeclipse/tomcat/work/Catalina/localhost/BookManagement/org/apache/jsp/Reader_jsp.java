package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import databasemanage.DatabaseManage;
import java.sql.*;

public final class Reader_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <title>读者信息</title>  \r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("  <h1 align=\"center\">读者信息</h1>\r\n");
      out.write("  <center>\r\n");
      out.write("  \t");

  	    request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		request.getSession();
  		String readerid=(String)session.getAttribute("readerid");
  		DatabaseManage dm=new DatabaseManage();
		Connection con=null;
		ResultSet rs=null;
		con=dm.getConnection();
		String readertype=null;
		int bookamount=0;
		String sql="select * from tb_reader where readerid="+"\'"+readerid+"\'";
		if(con!=null){
			rs=dm.executeQuery(sql);
		}
		try{
			if(rs!=null&&rs.next()){
			    out.println("读者基本信息："+"<br>");
				out.println("<table width=100% border=1 cellspacing=0>");
				out.println("<tr>");
				out.println("<th>读者姓名</th>");
				out.println("<th>读者性别</th>");
				out.println("<th>读者单位</th>");
				out.println("<th>读者联系方式</th>");
				out.println("<th>读者办证日期</th>");
				out.println("<th>借书证注销日期</th>");
				out.println("<th>读者类型</th>");
				out.println("</tr>");
				rs.beforeFirst();
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString("readername")+"</td>");
					out.println("<td>"+rs.getString("readergender")+"</td>");
					out.println("<td>"+rs.getString("readerunit")+"</td>");
					out.println("<td>"+rs.getString("readertel")+"</td>");
					out.println("<td>"+rs.getDate("readerstart")+"</td>");
					out.println("<td>"+rs.getDate("readerend")+"</td>");
					out.println("<td>"+(readertype=(rs.getString("readertype")))+"</td>");						
					out.println("</tr>");
				}
				out.println("</table>");				
			}						
		}
		catch(Exception e){
			e.printStackTrace();
		}
		sql="select * from tb_readertype where readertype="+"\'"+readertype+"\'";
		if(con!=null){
			rs=dm.executeQuery(sql);
		}
		try{
			if(rs!=null&&rs.next()){
			    out.println("<br>");
			    out.println("读者类型基本信息："+"<br>");
				out.println("<table width=100% border=1 cellspacing=0>");
				out.println("<tr>");
				out.println("<th>读者类型</th>");
				out.println("<th>借书数量</th>");
				out.println("<th>借期天数</th>");
				out.println("<th>超期还书时每日罚款金额</th>");
				out.println("</tr>");
				rs.beforeFirst();
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString("readertype")+"</td>");
					out.println("<td>"+rs.getInt("bookamount")+"</td>");
					bookamount=rs.getInt("bookamount");
					out.println("<td>"+rs.getInt("bookdays")+"</td>");
					out.println("<td>"+rs.getBigDecimal("dayfine")+"</td>");										
					out.println("</tr>");
				}
				out.println("</table>");				
			}						
		}
		catch(Exception e){
			e.printStackTrace();
		}
		sql="select * from tb_booklend where readerid="+"\'"+readerid+"\'"+" and returndate is NULL";
		int count=0;
		int finecount=0;
		if(con!=null){
			rs=dm.executeQuery(sql);
		}
		try{
			if(rs!=null&&rs.next()){
			    out.println("<br>");
			    out.println("读者当前借阅信息："+"<br>");
				out.println("<table width=100% border=1 cellspacing=0>");
				out.println("<tr>");
				out.println("<th>图书条形码</th>");
				out.println("<th>图书名称</th>");
				out.println("<th>图书作者</th>");
				out.println("<th>出版社</th>");
				out.println("<th>借书日期</th>");
				out.println("<th>应还日期</th>");
				out.println("</tr>");
				rs.beforeFirst();
				while(rs.next()){
				    String bc=rs.getString("bookcode");
					String sqlisbn="select * from tb_bookinfo where bookcode="+"\""+bc+"\"";
					ResultSet rsisbn=dm.executeQuery(sqlisbn);
					rsisbn.next();
					String isbn=rsisbn.getString("isbn");
					String sqlbook="select * from tb_book where isbn="+"\""+isbn+"\"";
					ResultSet rsbook=dm.executeQuery(sqlbook);
					rsbook.next();
					out.println("<tr>");
					out.println("<td>"+rs.getString("bookcode")+"</td>");
					out.println("<td>"+rsbook.getString("bookname")+"</td>");
					out.println("<td>"+rsbook.getString("bookauthor")+"</td>");
					out.println("<td>"+rsbook.getString("bookpublisher")+"</td>");
					out.println("<td>"+rs.getDate("borrowdate")+"</td>");
					out.println("<td>"+rs.getDate("duedate")+"</td>");
					if(rs.getDate("duedate").before(new java.util.Date())){
						finecount++;
					}								
					out.println("</tr>");
					count++;
				}
				out.println("</table>");				
			}						
		}
		catch(Exception e){
			e.printStackTrace();
		}	
		dm.close();	
		out.println("<br>");
		out.println("读者当前借阅"+count+"本");	
		out.println("<br>");
		out.println("读者当前超期"+finecount+"本");
		if(count==bookamount)
			out.println("已达到最大借阅数！");
		if(finecount!=0)
			out.println("有超期图书！");
  	    out.println("<br><br>");
  		out.println("<a href=ReaderMain.jsp>返回</a>");	
  	 
      out.write("\r\n");
      out.write("  \t</center>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
