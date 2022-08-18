<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<%
		String m = request.getParameter("M");
		if(m != null){
	%>
		<script type="text/javascript">
			alert("서비스를 이용하시려면, 로그인 해야 합니다.");
		</script>
	<% 	} %>
	<div class="loginForm">
		<h2 align="center">로 그 인</h2>
		<div align="center">
		<form action="login.do" method="post" onSubmit="return check(this)">
		계 정 : <input type="text" name="ID" size="10"/><br/>
		암 호 : <input type="password" name="PWD" size="10"/><br/><br/>
		<input type="submit" value="로그인"/>
		<input type="reset" value="취 소"/>
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
		alert("계정을 입력하세요."); return false;
	}
	if(f.PWD.value == ''){
		alert("암호를 입력하세요."); return false;
	}
}
</script>
</body>
</html>