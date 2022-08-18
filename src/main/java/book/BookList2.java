package book;

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
 * Servlet implementation class BookList2
 */
@WebServlet("/bookList.do")
public class BookList2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookList2() {
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
		
		String select = "select book_num, book_id, book_pub from book_info_tbl";//북리스트 셀렉트
		Connection con=null; Statement stmt = null;
		ResultSet rs = null;
		ArrayList bookAll = new ArrayList();//bookAll 선언
		try {//트라이
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);//셀렉트 쿼리 실행
			while (rs.next()) {
				Book bookL = new Book();
				bookL.setbId(rs.getString(1));
				bookL.setbName(rs.getString(2));
				bookL.setbPub(rs.getString(3));
//				bookL.setbRentNum(rs.getString(4));
				bookAll.add(bookL);//필기노트 참고
				
			}
		}catch(Exception e) {
			e.printStackTrace();//문제가 있을 때 에러 찾기
		}finally {
			try {
				con.close();//파이널ㄹ리-닫기
				stmt.close();//파이널리-닫기
				rs.close();//파이널리-닫기
			}catch(Exception e) {  }
		}
		request.setAttribute("BOALL", bookAll);
		RequestDispatcher rd = 
				request.getRequestDispatcher("bookList.jsp");
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
