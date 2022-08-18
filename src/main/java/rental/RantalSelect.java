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


/**
 * Servlet implementation class RantalSelect
 */
@WebServlet("/rentalSelect.do")
public class RantalSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RantalSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rId=request.getParameter("RNUM");
		String select = "select rental_num, to_char(rental_date,'YYYY-MM-DD'), to_char(return_date,'YYYY-MM-DD'), user_id, book_num from rental_tbl where upper(rental_num)=upper('"+rId+"')";
		Connection con=null; 
		Statement stmt=null;
		ResultSet rs = null; 
		Rental ren = new Rental();
		System.out.println(rId);
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);
			rs.next();
			ren.setRenNum(rs.getString(1));
			ren.setRenDate(rs.getString(2));
			ren.setRenReturn(rs.getString(3));
			ren.setRenUid(rs.getString(4));
			ren.setRenBnum(rs.getString(5));
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
		request.setAttribute("REN", ren);
		RequestDispatcher r =
				request.getRequestDispatcher("rentalDetail.jsp");
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
