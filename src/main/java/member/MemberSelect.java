package member;

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

/**
 * Servlet implementation class MemberSelect
 */
@WebServlet("/memberSelect.do")
public class MemberSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("ID");
		System.out.println(id);
		String select = "select * from user_tbl where lower(user_id) = lower('"+id+"')";
		Connection con=null; Statement stmt=null;
		ResultSet rs = null; Member mem = new Member();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);
			rs.next();
			mem.setId(rs.getString(1));
			mem.setName(rs.getString(2));
			mem.setTel(rs.getString(3));
			mem.setPwd(rs.getString(4));
			mem.setAddr(rs.getString(5));
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close(); stmt.close(); rs.close();				
			}catch(Exception e) {}
		}
		request.setAttribute("MEM", mem);
		RequestDispatcher r =
				request.getRequestDispatcher("memberDetail.jsp");
		r.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
