<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="rental.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link type="text/css" rel="stylesheet" href="style.css">
<title>���� �뿩 �ý���</title>
</head>
<body>
<header>
<%
	Rental rental = (Rental)request.getAttribute("REN");
%>
	<h1 align="center"><a href="index.jsp">���� �뿩 �ý��� ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">�뿩 ��� ����</h2>
	<form action="rentalUpdate.do" method="post" onSubmit="return check()">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>�뿩��ȣ</th><td><input type="text" name="RNUM" readonly value="<%= rental.getRenNum() %>"></td></tr>
				<tr><th>�뿩��¥</th><td><input type="date" name="RNDATE" value="<%= rental.getRenDate() %>"></td></tr>
				<tr><th>�ݳ���¥</th><td><input type="date" name="RTDATE" value="<%= rental.getRenReturn() %>"></td></tr>
				<tr><th>�뿩��ID</th><td><input type="text" name="RUID" value="<%= rental.getRenUid() %>"></td></tr>
				<tr><th>å��ȣ</th><td><input type="text" name="RBID" value="<%= rental.getRenBnum() %>"></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="����" name="btn">
					<input type="button" value="��ȸ" onClick="doSelect()"/>
				</td></tr>				
			</table>
		</div>
	</form>	
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
<script type="text/javascript">
	function doSelect() {
		if (confirm("������ ��ȸ�ϰڽ��ϱ�?")) {
			location.href="rentalList.do";
		}
	}
	function check() {
		if (confirm("�۾��� �����մϱ�?")) {
			return true;
		}else{
			return false;
		}
	}
</script>
</body>
</html>