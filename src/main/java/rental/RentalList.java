package rental;

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

import book.Book;

/**
 * Servlet implementation class RentalList
 */
@WebServlet("/rentalList.do")
public class RentalList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentalList() {
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
		
		String select = "select r.rental_num, TO_CHAR(rental_date,'YYYY-MM-DD'), NVL(TO_CHAR(return_date,'YYYY-MM-DD'), ' '), r.user_id, r.book_num, b.book_id "
				+ "from rental_tbl r, book_info_tbl b "
				+ "where r.book_num = b.book_num";
		Connection con=null; Statement stmt = null;
		ResultSet rs = null;
		ArrayList rentalAll = new ArrayList();
		try {//트라이
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);//셀렉트 쿼리 실행
			while (rs.next()) {
				Rental rentL = new Rental();
				rentL.setRenNum(rs.getString(1));
				rentL.setRenDate(rs.getString(2));
				rentL.setRenReturn(rs.getString(3));
				rentL.setRenUid(rs.getString(4));
				rentL.setRenBnum(rs.getString(5));
				rentL.setRenBidName(rs.getString(6));
				rentalAll.add(rentL);
				//System.out.println(select);
			}
		}catch(Exception e) {
			e.printStackTrace();//문제가 있을 때 에러 찾기
			System.out.println("NO");
		}finally {
			try {
				con.close();//파이널ㄹ리-닫기
				stmt.close();//파이널리-닫기
				rs.close();//파이널리-닫기
			}catch(Exception e) {  }
		}
		request.setAttribute("RENALL", rentalAll);
		RequestDispatcher rd = 
				request.getRequestDispatcher("rentalList.jsp");
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
