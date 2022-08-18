<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, rental.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link type="text/css" rel="stylesheet" href="style.css">
<title>���� �뿩 �ý���</title>
</head>
<body>
<header>
	<h1 align="center"><a href="index.jsp">���� �뿩 �ý��� ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">�뿩��� ��ȸ</h2>
	<div align="center">
		<table border="1" style="border-spacing: 0;">
			<tr><th>�뿩��ȣ</th><th>�뿩��¥</th><th>�ݳ���¥</th><th>�뿩��ID</th><th>å��ȣ</th><th>å�̸�</th></tr>
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