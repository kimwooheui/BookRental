<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="book.*" %>
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
	Book book = (Book)request.getAttribute("BOO");
%>
	<h1 align="center"><a href="index.jsp">���� �뿩 �ý��� ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">���� ��� ����</h2>
	<form action="bookUpdate.do" method="post" onSubmit="return check()">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>å��ȣ</th><td><input type="text" name="BNUM" readonly value="<%= book.getbId() %>"></td></tr>
				<tr><th>å�̸�</th><td><input type="text" name="BNAME" value="<%= book.getbName() %>"></td></tr>
				<tr><th>���ǻ�</th><td><input type="text" name="BPUB" value="<%= book.getbPub() %>"></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="����" name="btn">
					<input type="button" value="��ȸ" onClick="doSelect()"/>
					<input type="submit" value="����" name="btn">
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
			location.href="bookList.do";
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