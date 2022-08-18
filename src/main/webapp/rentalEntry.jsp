<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, book.*, member.*" %>
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
	String rId=request.getParameter("RNUM");
	//String member=request.getParameter("RNUM");
%>
	<h1 align="center"><a href="index.jsp">���� �뿩 �ý��� ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">�뿩���� ���</h2>
	<form action="rentalRegister.do" method="post" onSubmit="return check(this)">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>�뿩��ȣ(�ڵ�����)</th><td><input type="text" name="RNUM" readonly value="<%= rId %>"></td></tr>
				<tr><th>�뿩��¥</th><td><input type="date" name="RNDATE"/></td></tr>
				<tr><th>�ݳ���¥</th><td><input type="date" name="RTDATE"/></td></tr>
				<tr><th>�뿩��ID</th><td><input type="text" name="RUID" ></td></tr>
				<tr><th>å��ȣ</th><td><input type="text" name="RBID" ></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="���" name="btn">
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
	function check(frm) {
		if (frm.RNDATE.value == '') {
			alert("�뿩��¥�� �����Դϴ�.")
			return false;
		}
		if (frm.RUID.value == '') {
			alert("�뿩��ID�� �����Դϴ�.")
			return false;
		}	
		if (frm.RBID.value == '') {
			alert("å��ȣ�� �����Դϴ�.")
			return false;
		}	
		if (confirm("�Է��� ������ �½��ϱ�?")) {
			return true;						
		}else{
			return false;			
		}
	}
	function doSelect() {
		if (confirm("������ ��ȸ�ϰڽ��ϱ�?")) {
			location.href="rentalList.do";
		}
	}
</script>
</body>
</html>