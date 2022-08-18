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

/**
 * Servlet implementation class BookSelect
 */
@WebServlet("/bookSelect.do")
public class BookSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String bId=request.getParameter("BNUM");
		String select = "select book_num, book_id, book_pub from book_info_tbl where upper(book_num)=upper('"+bId+"')";
		Connection con=null; 
		Statement stmt=null;
		ResultSet rs = null; 
		Book boo = new Book();
		System.out.println(bId);
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);
			rs.next();
			boo.setbId(rs.getString(1));
			boo.setbName(rs.getString(2));
			boo.setbPub(rs.getString(3));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				stmt.close();
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		request.setAttribute("BOO", boo);
		RequestDispatcher r =
				request.getRequestDispatcher("bookDetail.jsp");
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
