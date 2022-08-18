<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	String bId=request.getParameter("BNUM");
%>
	<h1 align="center"><a href="index.jsp">���� �뿩 �ý��� ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">���� ���</h2>
	<form action="bookRegister.do" method="post" onSubmit="return check(this)">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>å��ȣ(�ڵ�����)</th><td><input type="text" name="BNUM" readonly value="<%= bId %>"></td></tr>
				<tr><th>å�̸�</th><td><input type="text" name="BNAME" ></td></tr>
				<tr><th>���ǻ�</th><td><input type="text" name="BPUB" ></td></tr>
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
		if (frm.BNUM.value == '') {
			alert("�Ͼ��̵� �����Դϴ�.")//�Ͼ��̵�� �ڵ��������� �ұ�?
			return false;
		}
		if (frm.BNAME.value == '') {
			alert("�������� �����Դϴ�.")
			return false;
		}
		if (frm.BPUB.value == '') {
			alert("���ǻ簡 �����Դϴ�.")
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
			location.href="bookList.do";
		}
	}
</script>
</body>
</html>