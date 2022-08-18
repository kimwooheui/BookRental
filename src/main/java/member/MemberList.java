package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberList
 */
@WebServlet("/memberList.do")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberList() {
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
		
		
		String select = "select * from user_tbl";
		Connection con =null; Statement stmt = null;
		ResultSet rs = null;
		ArrayList memberAll = new ArrayList();
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);
			while (rs.next()) {
				Member memb = new Member();
				memb.setId(rs.getString(1));
				memb.setName(rs.getString(2));
				memb.setTel(rs.getString(3));
				memb.setPwd(rs.getString(4));
				memb.setAddr(rs.getString(5));
				memberAll.add(memb);
				
			}
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch(Exception e) {}
		}
		request.setAttribute("ALL", memberAll);
		RequestDispatcher rd = 
				request.getRequestDispatcher("memberList.jsp");
			rd.forward(request, response);
		//	RequestDispatcher rd2 = 
		//			request.getRequestDispatcher("rentalEntry.jsp");
		//	rd2.forward(request, response);
			
		
			
		}//if(id==null)ÀÇ else
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
