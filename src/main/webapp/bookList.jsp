<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*, book.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link type="text/css" rel="stylesheet" href="style.css">
<title>도서 대여 시스템</title>
</head>
<body>
<header>
	<h1 align="center"><a href="index.jsp">도서 대여 시스템 ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">책목록 조회/수정</h2>
	<div align="center">
		<table border="1" style="border-spacing: 0;">
			<tr><th>책번호</th><th>책이름</th><th>출판사</th></tr>
			
			<%
				ArrayList books = (ArrayList)request.getAttribute("BOALL");//서블릿으로부터 get
				int size = books.size();
				for(int i=0; i<size; i++){
					Book bok = (Book)books.get(i);
				
			%>
			<tr><!-- 반복문 돌려서 책 리스트 좌르르 나열하기 -->
				<td><a href="bookSelect.do?BNUM=<%= bok.getbId() %>"><%= bok.getbId() %></td>
				<td><%= bok.getbName() %></td>
				<td><%= bok.getbPub() %></td>
			</tr>
			
			<%
				}
			%>
		</table>
	</div>
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
</body>
</html>