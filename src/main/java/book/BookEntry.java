package book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookEntry
 */
@WebServlet("/bookEntry.do")
public class BookEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookEntry() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id==null) {
			response.sendRedirect("login.jsp?M=Y");
		}else {
		
		String select = "select max(book_num) from book_info_tbl";
		String book_num = "";
		Connection con= null; Statement stmt=null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs= stmt.executeQuery(select);
			rs.next();
			book_num = rs.getString(1);
			String bnStr = book_num.substring(0,2);//BN분리
			Integer bnInt = Integer.parseInt(book_num.substring(2));//숫자분리&정수화
			book_num = bnStr+(String.format("%04d",bnInt+1));//숫자에 0000붙이기 +1아이디추가
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			} catch (Exception e2) {	}
		}
		
		RequestDispatcher rd = 
				request.getRequestDispatcher(
					"bookEntry.jsp?BNUM="+book_num);
		rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
