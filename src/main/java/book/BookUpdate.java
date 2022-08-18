package book;

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
 * Servlet implementation class BookUpdate
 */
@WebServlet("/bookUpdate.do")
public class BookUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookUpdate() {
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
		String bId=req.getParameter("BNUM");
		String bName = req.getParameter("BNAME");
		String bPub = req.getParameter("BPUB");
		String update = "update book_info_tbl set book_id=?,book_pub=? where book_num=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		String result="";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			pstmt=con.prepareStatement(update);
			pstmt.setString(1,bName);
			pstmt.setString(2,bPub);
			pstmt.setString(3,bId);
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
	
	String bookDelete(HttpServletRequest req) {
		String bId=req.getParameter("BNUM");
		String delete = "delete from book_info_tbl where book_num=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		String result="";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			pstmt=con.prepareStatement(delete);
			
			pstmt.setString(1,bId);
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
		if (btn.equals("수정")) {
			String result = bookUpdate(request);
			response.sendRedirect("bookUpdateResult.jsp?R="+result);
		}else if (btn.equals("삭제")) {
			String result = bookDelete(request);
			response.sendRedirect("bookDeleteResult.jsp?R="+result);
		}
	}

}
