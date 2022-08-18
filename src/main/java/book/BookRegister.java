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
 * Servlet implementation class BookRegister
 */
@WebServlet("/bookRegister.do")
public class BookRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookRegister() {
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
		String bId = request.getParameter("BNUM");
		String bName = request.getParameter("BNAME");
		String bPub = request.getParameter("BPUB");
		String insert = "insert into book_info_tbl values("+
				"?,?,?)";
		Connection con = null; PreparedStatement pstmt = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			pstmt=con.prepareStatement(insert);
			pstmt.setString(1, bId);//최대번호로 자동생성. 폼을 봐야...
			pstmt.setString(2, bName);
			pstmt.setString(3, bPub);
		//	pstmt.setString(4, "");//대여번호는 안 넣음(추후추가하는 식)
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
		response.sendRedirect("bookRegisterResult.jsp?R="+result);
	}

}
