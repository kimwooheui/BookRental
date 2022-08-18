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
	<h2 align="center">로그인 결과</h2>
	<p>
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){//로그인 성공 메세지 출력
		out.print("로그인 성공<br/>");
		String id = (String)session.getAttribute("LOGINID");
		out.print("환영합니다~ "+ id +"님~");
	}else if(result.equals("NOPWD")){//암호불일치 메세지 출력
		out.print("암호가 일치하지 않습니다. 암호를 확인하세요.");
	}else if(result.equals("NOID")){//계정없슴 메세지 출력
		out.print("계정이 없습니다. 가입 후 이용해 주세요.");
	}
%>	
	</p>
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
</body>
</html>