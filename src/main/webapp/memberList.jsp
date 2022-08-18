<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, member.*" %>
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
	<h2 align="center">회원목록 조회/수정</h2>
	<div align="center">
		<table border="1" style="border-spacing: 0;">
			<tr><th>아이디</th><th>이름</th><th>연락처</th><th>패스워드</th><th>주소</th></tr>
<%		
		ArrayList members=(ArrayList)request.getAttribute("ALL");
		int size = members.size();
		for(int i=0;i<size;i++){
			Member mem = (Member)members.get(i);
%>
		<tr><td><a href="memberSelect.do?ID=<%= mem.getId() %>"><%= mem.getId() %></td>
			<td><%= mem.getName() %></td>
			<td><%= mem.getTel() %></td>
			<td><%= mem.getPwd() %></td>
			<td><%= mem.getAddr() %></td>

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