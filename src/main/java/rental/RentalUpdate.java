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
 * Servlet implementation class RentalUpdate
 */
@WebServlet("/rentalUpdate.do")
public class RentalUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentalUpdate() {
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


	String bookUpdate(HttpServletRequest req) {
		String rId=req.getParameter("RNUM");
		String rnDate = req.getParameter("RNDATE");
		String rtDate = req.getParameter("RTDATE");
		String rUid = req.getParameter("RUID");
		String rBid = req.getParameter("RBID");
		String update = "update rental_tbl set rental_date=?,return_date=?,user_id=?,book_num=? where rental_num=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		String result="";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			pstmt=con.prepareStatement(update);
			pstmt.setString(1,rnDate);
			pstmt.setString(2,rtDate);
			pstmt.setString(3,rUid);
			pstmt.setString(4,rBid);
			pstmt.setString(5,rId);
			pstmt.executeUpdate();
			result="OK";
		} catch (Exception e) {
			e.printStackTrace();
			result = "NOK";
		}finally {
			try {
				con.close(); pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return result;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String btn = request.getParameter("btn");
		if (btn.equals("¼öÁ¤")) {
			String result = bookUpdate(request);
			response.sendRedirect("rentalUpdateResult.jsp?R="+result);
		}
	}

}
