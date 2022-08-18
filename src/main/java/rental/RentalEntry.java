package rental;

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
 * Servlet implementation class RentalEntry
 */
@WebServlet("/rentalEntry.do")
public class RentalEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentalEntry() {
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
		
		String select = "select max(rental_num) from rental_tbl";
		String rental_num = "";
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
			rental_num = rs.getString(1);
			String rnStr = rental_num.substring(0,2);//
			Integer rnInt = Integer.parseInt(rental_num.substring(2));//숫자분리&정수화
			rental_num = rnStr+(String.format("%04d",rnInt+1));//숫자에 0000붙이기 +1아이디추가
			System.out.println(rental_num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			} catch (Exception e2) {	}
		}
		
		RequestDispatcher rd = 
				request.getRequestDispatcher(
					"rentalEntry.jsp?RNUM="+rental_num);
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
