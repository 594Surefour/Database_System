package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import databasemanage.DatabaseManage;
import java.sql.*;
import java.math.BigDecimal;
import javax.servlet.http.*;
import java.text.*;
import java.util.Calendar;
public class ReaderTurnServlet extends HttpServlet {
	public ReaderTurnServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); 
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		String readerid=request.getParameter("readerid");
		String bookcode=request.getParameter("bookcode");
		System.out.println(readerid);
		System.out.println(bookcode);
		DatabaseManage dm=new DatabaseManage();
		Connection con=dm.getConnection();
		ResultSet rs=null;
		int num1=0;
		int num2=0;
		try{
			con.setAutoCommit(false);
			PreparedStatement pstmt=con.prepareStatement("select * from tb_booklend where bookcode=? and readerid=? and returndate is NULL");
			pstmt.setString(1, bookcode);
			pstmt.setString(2, readerid);
			rs=pstmt.executeQuery();
			rs.next();
			java.sql.Date duedate=rs.getDate("duedate");
			String sql="select * from tb_reader where readerid="+"\'"+readerid+"\'";
		    if(con!=null){
				rs=dm.executeQuery(sql);
		    }
		    rs.next();
		    String readertype=rs.getString(9);
		    sql="select * from tb_readertype where readertype="+"\'"+readertype+"\'";
				if(con!=null){
			  	rs=dm.executeQuery(sql);
		    }
		    rs.next();
		    BigDecimal dayfine=rs.getBigDecimal(4);		    
		    Calendar cal = Calendar.getInstance();     
            long time1 = cal.getTimeInMillis();                 
            cal.setTime(duedate);    
            long time2 = cal.getTimeInMillis();         
            long between_days=(time1-time2)/(1000*3600*24);  
            int days=(int)between_days;           
		    BigDecimal total=dayfine.multiply(new BigDecimal(days));
		    sql="update tb_booklend set returndate=?, overdueday=?,fine=? where  bookcode="+bookcode+" and readerid="+readerid+" and returndate is NULL";
		    pstmt=con.prepareStatement(sql);
		    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
	        c.setTime(new java.util.Date());
			pstmt.setDate(1, java.sql.Date.valueOf(df.format(new java.util.Date())));
			pstmt.setInt(2, days);
			pstmt.setBigDecimal(3, total);		
		    if(duedate.before(new java.util.Date())){
				num1=pstmt.executeUpdate();	
			}
		    else{
		    	sql="update tb_booklend set returndate=? where  bookcode="+bookcode+" and readerid="+readerid+" and returndate is NULL";
			    pstmt=con.prepareStatement(sql);
			    df=new SimpleDateFormat("yyyy-MM-dd");
				c=Calendar.getInstance();
		        c.setTime(new java.util.Date());
				pstmt.setDate(1, java.sql.Date.valueOf(df.format(new java.util.Date())));
				num1=pstmt.executeUpdate();	
		    }
		    pstmt=con.prepareStatement("update tb_bookinfo set status=? where bookcode=?");
			pstmt.setString(1, "ÊÇ");
			pstmt.setString(2, bookcode);
			num2=pstmt.executeUpdate();
			con.commit();		    
		}catch(Exception e){
			e.printStackTrace();
			try{
				con.rollback();
				con.setAutoCommit(false);		
			}catch(Exception ee){
				ee.printStackTrace();		
			}
		}
		if(num1==1&& num2==1){
			response.sendRedirect("../BookReturnSuccess.jsp");
		}
		else{
			response.sendRedirect("../BookReturnFailer.jsp");
		}	
		dm.close();		
	}	
	public void init() throws ServletException {
		super.init();
	}
}
