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
	<h2 align="center">도서 대여 시스템</h2>
	<p class="box" align="center">
	대여관리 시스템에 회원정보와 도서정보가 있습니다.<br><br>
	1. 회원등록<br>
	회원 정보를 등록할 수 있습니다. 아이디는 직접 입력합니다.<br><br>
	2. 회원 조회/수정<br>
	리스트에서 아이디를 눌러, 정보를 수정/삭제할 수 있습니다.<br><br>
	3. 도서등록<br>
	도서 정보를 등록할 수 있습니다. 책번호는 자동생성.<br><br>
	4. 회원 조회/수정<br>
	리스트에서 책번호를 눌러, 정보를 수정/삭제할 수 있습니다.<br><br>
	5. 대여등록<br>
	대여 정보를 등록할 수 있습니다. 대여번호는 자동생성.<br><br>
	6. 대여 조회/수정<br>
	리스트에서 대여번호를 눌러, 정보를 수정할 수 있습니다. 삭제는 되지 않습니다.<br><br>
	7. 홈으로<br>
	메인페이지로 돌아갑니다.<br><br>
	8. 로그인/로그아웃<br>
	로그인/로그아웃을 합니다.<br><br>
	</p>	
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
</body>
</html>