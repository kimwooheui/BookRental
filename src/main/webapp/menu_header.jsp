<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<div class="nav1" align="center" >
<table class="nav">
	<tr>
		<td><a href="memberEntry.do">회원등록</a>&nbsp;</td>
		<td><a href="memberList.do">회원 조회/수정</a>&nbsp;</td>
		<td><a href="bookEntry.do">도서 등록</a>&nbsp;</td>
		<td><a href="bookList.do">도서 조회/수정</a>&nbsp;</td>
		<td><a href="rentalEntry.do">대여등록</a>&nbsp;</td>
		<td><a href="rentalList.do">대여목록</a>&nbsp;</td>
		<td><a href="index.jsp">홈으로</a>&nbsp;</td>
<%
	String id = (String)session.getAttribute("LOGINID");
	if(id == null){
%>
		<td><a href="login.jsp">로그인</a>&nbsp;</td>
	</tr>
	</table>
</div>
<div class="allignR2"></div>


<%
	}else{
%>
		<td><a href="logout.do">로그아웃</a>&nbsp;</td>
	</tr>
	</table>
</div>
<div class="allignR" style="text-align: right;"><span>환영합니다<br><%= id %>님</span></div>
	
<%
	}
%>
