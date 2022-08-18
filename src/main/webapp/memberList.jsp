<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, member.*" %>
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
	<h2 align="center">ȸ����� ��ȸ/����</h2>
	<div align="center">
		<table border="1" style="border-spacing: 0;">
			<tr><th>���̵�</th><th>�̸�</th><th>����ó</th><th>�н�����</th><th>�ּ�</th></tr>
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