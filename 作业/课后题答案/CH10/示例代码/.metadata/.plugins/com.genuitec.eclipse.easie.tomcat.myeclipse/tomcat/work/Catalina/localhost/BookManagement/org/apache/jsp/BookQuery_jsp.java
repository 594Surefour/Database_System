package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import databasemanage.DatabaseManage;
import java.sql.*;

public final class BookQuery_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>图书查询</title>  \r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("  <h1 align=\"center\">图书查询</h1>\r\n");
      out.write("  <center>\r\n");
      out.write("  \t");

  	    request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		String bookname=request.getParameter("bookname");
  		request.getSession();
  		session.setAttribute("bookname",bookname);
	    DatabaseManage dm=new DatabaseManage();
		Connection con=null;
		ResultSet rs=null;
		con=dm.getConnection();
		String sql="select * from tb_book where bookname like \'%"+bookname+"%\'";
		if(con!=null){
			rs=dm.executeQuery(sql);
		}
		try{
			if(rs!=null&&rs.next()){
				out.println("<table width=100% border=1 cellspacing=0>");
				out.println("<tr>");
				out.println("<th>图书国际标准书号</th>");
				out.println("<th>图书名称</th>");
				out.println("<th>作者</th>");
				out.println("<th>译者</th>");
				out.println("<th>出版社</th>");
				out.println("<th>出版日期</th>");
				out.println("<th>页数</th>");
				out.println("<th>定价</th>");
				out.println("<th>操作</th>");
				out.println("</tr>");
				rs.beforeFirst();
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString("isbn")+"</td>");
					out.println("<td>"+rs.getString("bookname")+"</td>");
					out.println("<td>"+rs.getString("bookauthor")+"</td>");	
					out.println("<td>"+rs.getString("booktranslator")+"</td>");
					out.println("<td>"+rs.getString("bookpublisher")+"</td>");
					out.println("<td>"+rs.getDate("publishdate")+"</td>");
					out.println("<td>"+rs.getInt("bookpage")+"</td>");
					out.println("<td>"+rs.getBigDecimal("bookprice")+"</td>");
					out.println("<td>");
					out.println("<a href="+"BookInfoQuery.jsp?isbn="+rs.getString("isbn")+">查询</a>");
					out.println("</td>");
					out.println("</tr>");
				}
				out.println("</table>");				
			}
			else{
				out.println("没有找到查询结果！");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
  	 
      out.write("\r\n");
      out.write("  \t <br><br>\r\n");
      out.write("  \t <a href=\"ReaderMain.jsp\">返回</a>\r\n");
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
