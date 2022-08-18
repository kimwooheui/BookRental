<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, rental.*" %>
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
	<h2 align="center">대여목록 조회</h2>
	<div align="center">
		<table border="1" style="border-spacing: 0;">
			<tr><th>대여번호</th><th>대여날짜</th><th>반납날짜</th><th>대여자ID</th><th>책번호</th><th>책이름</th></tr>
		<%		
		ArrayList rentals=(ArrayList)request.getAttribute("RENALL");
		int size = rentals.size();
		for(int i=0;i<size;i++){
			Rental ren = (Rental)rentals.get(i);
%>
			<tr>
				<td><a href="rentalSelect.do?RNUM=<%= ren.getRenNum() %>"><%= ren.getRenNum() %></td>
				<td><%= ren.getRenDate() %></td>
				<td><%= ren.getRenReturn() %></td>
				<td><%= ren.getRenUid() %></td>
				<td><%= ren.getRenBnum() %></td>
				<td><%= ren.getRenBidName() %></td>
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