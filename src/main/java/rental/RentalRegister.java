package rental;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RentalRegister
 */
@WebServlet("/rentalRegister.do")
public class RentalRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentalRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String rId = request.getParameter("RNUM");
		String rnDate = request.getParameter("RNDATE");
		String rtDate = request.getParameter("RTDATE");
		String rUid = request.getParameter("RUID");
		String rBid = request.getParameter("RBID");
		String insert = "insert into rental_tbl values("+
				"?,?,?,?,?)";
		Connection con = null; PreparedStatement pstmt = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			pstmt=con.prepareStatement(insert);
			pstmt.setString(1, rId);//최대번호로 자동생성
			pstmt.setString(2, rnDate);
			pstmt.setString(3, rtDate);
			pstmt.setString(4, rUid);
			pstmt.setString(5, rBid);
			pstmt.executeUpdate();//인서트 실행
			result="OK";
		}catch(Exception e) {
			e.printStackTrace();
			result="NOK";
		}finally{
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {	}
		}
		response.sendRedirect("rentalRegisterResult.jsp?R="+result);
	}

}
