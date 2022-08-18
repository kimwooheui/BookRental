package member;

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
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/memberUpdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
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
	
	String memberUpdate(HttpServletRequest req) {
		String id=req.getParameter("ID");
		String name=req.getParameter("NAME");
		String tel=req.getParameter("TEL");
		String pwd=req.getParameter("PWD");
		String addr=req.getParameter("ADDR");
		String update="update user_tbl set user_name=?, user_tel=?, user_pwd=?, user_addr=? where user_id=?";
		//String delete="delete from user_tbl where user_id = ?";
		Connection con=null; PreparedStatement pstmt=null;
		String result="";
		
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			pstmt=con.prepareStatement(update);
			pstmt.setString(1, name);//43���� NAME�� ���Ե�. ���� �Է��Ѵ�� ������.
			pstmt.setString(2, tel);
			pstmt.setString(3, pwd);
			pstmt.setString(4, addr);
			pstmt.setString(5, id);//���ǹ��� id�� ��������.
			pstmt.executeUpdate();
			result="OK";
		}catch(Exception e) {
			result="NOK";
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {	}
		}
		return result;
	}
	String memberDelete(HttpServletRequest req) {
		String id=req.getParameter("ID");
		
		String delete="delete from user_tbl where user_id = ?";
		Connection con=null; PreparedStatement pstmt=null;
		String result="";
		
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/xe",
					"hr","hr");
			pstmt=con.prepareStatement(delete);
			pstmt.setString(1, id);//���ǹ��� id�� ��������.
			pstmt.executeUpdate();
			result="OK";
		}catch(Exception e) {
			result="NOK";
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {	}
		}
		return result;
	}
	
	//��� ������ ����Ʈ ��
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String btn=request.getParameter("btn");
		if(btn.equals("����")) {
			String result = memberUpdate(request);
			response.sendRedirect("updateResult.jsp?R="+result);//R�� ����Ʈ��
			
		}else if(btn.equals("����")) {
			String result = memberDelete(request);
			response.sendRedirect("deleteResult.jsp?R="+result);
		}
	}

}
