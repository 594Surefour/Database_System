package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import databasemanage.DatabaseManage;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.math.BigDecimal;
public class ReaderTypeAddServlet extends HttpServlet {
	public ReaderTypeAddServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); 
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String readertype=request.getParameter("readertype");
		int bookamount=Integer.parseInt(request.getParameter("bookamount"));	
		int bookdays=Integer.parseInt(request.getParameter("bookdays"));	
		BigDecimal dayfine=new BigDecimal(request.getParameter("dayfine"));	
		DatabaseManage dm=new DatabaseManage();
		Connection con=dm.getConnection();
		int num=0;
		try{
			PreparedStatement pstmt=con.prepareStatement("insert into tb_readertype values(?,?,?,?)");
			pstmt.setString(1, readertype);
			pstmt.setInt(2, bookamount);
			pstmt.setInt(3, bookdays);
			pstmt.setBigDecimal(4, dayfine);	
			num=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(num==0){
			response.sendRedirect("../ReaderTypeAddFailer.jsp");
		}
		else{
			response.sendRedirect("../ReaderTypeAddSuccess.jsp");
		}	
		dm.close();				
		
	}	
	public void init() throws ServletException {
		super.init();
	}
}
