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
		
		String select = "select book_num, book_id, book_pub from book_info_tbl";//�ϸ���Ʈ ����Ʈ
		Connection con=null; Statement stmt = null;
		ResultSet rs = null;
		ArrayList bookAll = new ArrayList();//bookAll ����
		try {//Ʈ����
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select);//����Ʈ ���� ����
			while (rs.next()) {
				Book bookL = new Book();
				bookL.setbId(rs.getString(1));
				bookL.setbName(rs.getString(2));
				bookL.setbPub(rs.getString(3));
//				bookL.setbRentNum(rs.getString(4));
				bookAll.add(bookL);//�ʱ��Ʈ ����
				
			}
		}catch(Exception e) {
			e.printStackTrace();//������ ���� �� ���� ã��
		}finally {
			try {
				con.close();//���̳Τ���-�ݱ�
				stmt.close();//���̳θ�-�ݱ�
				rs.close();//���̳θ�-�ݱ�
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
