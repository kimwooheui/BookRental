<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*, book.*" %>
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
	<h2 align="center">å��� ��ȸ/����</h2>
	<div align="center">
		<table border="1" style="border-spacing: 0;">
			<tr><th>å��ȣ</th><th>å�̸�</th><th>���ǻ�</th></tr>
			
			<%
				ArrayList books = (ArrayList)request.getAttribute("BOALL");//�������κ��� get
				int size = books.size();
				for(int i=0; i<size; i++){
					Book bok = (Book)books.get(i);
				
			%>
			<tr><!-- �ݺ��� ������ å ����Ʈ �¸��� �����ϱ� -->
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