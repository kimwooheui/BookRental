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
	<h1 align="center"><a href="index.jsp">���� �뿩 �ý��� ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<%
		String m = request.getParameter("M");
		if(m != null){
	%>
		<script type="text/javascript">
			alert("���񽺸� �̿��Ͻ÷���, �α��� �ؾ� �մϴ�.");
		</script>
	<% 	} %>
	<div class="loginForm">
		<h2 align="center">�� �� ��</h2>
		<div align="center">
		<form action="login.do" method="post" onSubmit="return check(this)">
		�� �� : <input type="text" name="ID" size="10"/><br/>
		�� ȣ : <input type="password" name="PWD" size="10"/><br/><br/>
		<input type="submit" value="�α���"/>
		<input type="reset" value="�� ��"/>
		</form>
		</div>
	</div>
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
<script type="text/javascript">
function check(f){
	if(f.ID.value == ''){
		alert("������ �Է��ϼ���."); return false;
	}
	if(f.PWD.value == ''){
		alert("��ȣ�� �Է��ϼ���."); return false;
	}
}
</script>
</body>
</html>