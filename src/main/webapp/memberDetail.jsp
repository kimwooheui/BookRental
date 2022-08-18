<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.*" %>
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
	<h2 align="center">ȸ����� ����</h2>
	<div align="center">
		<form action="memberUpdate.do" method="post" onSubmit="return check()">
			<table border="1" style="border-spacing: 0;">
			
<%
	Member member = (Member)request.getAttribute("MEM");
%>
				<tr><th>���̵�</th><td><input type="text" name="ID" readonly value="<%= member.getId() %>"></td></tr>
				<tr><th>�̸�</th><td><input type="text" name="NAME" value="<%= member.getName() %>"></td></tr>
				<tr><th>����ó</th><td><input type="text" name="TEL" value="<%= member.getTel() %>"></td></tr>
				<tr><th>�н�����</th><td><input type="text" name="PWD" value="<%= member.getPwd() %>"></td></tr>
				<tr><th>�ּ�</th><td><input type="text" name="ADDR" value="<%= member.getAddr() %>"></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="����" name="btn">
					<input type="button" value="��ȸ" onClick="doSelect()">
					<input type="submit" value="����" name="btn">
				</td></tr>
			</table>
		</form>
	</div>
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
<script type="text/javascript">
	function doSelect(){
		if(confirm("������ ��ȸ�ϰڽ��ϱ�?")){
			location.href="memberList.do";
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