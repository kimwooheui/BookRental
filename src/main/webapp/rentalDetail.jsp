<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="rental.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link type="text/css" rel="stylesheet" href="style.css">
<title>도서 대여 시스템</title>
</head>
<body>
<header>
<%
	Rental rental = (Rental)request.getAttribute("REN");
%>
	<h1 align="center"><a href="index.jsp">도서 대여 시스템 ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">대여 목록 수정</h2>
	<form action="rentalUpdate.do" method="post" onSubmit="return check()">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>대여번호</th><td><input type="text" name="RNUM" readonly value="<%= rental.getRenNum() %>"></td></tr>
				<tr><th>대여날짜</th><td><input type="date" name="RNDATE" value="<%= rental.getRenDate() %>"></td></tr>
				<tr><th>반납날짜</th><td><input type="date" name="RTDATE" value="<%= rental.getRenReturn() %>"></td></tr>
				<tr><th>대여자ID</th><td><input type="text" name="RUID" value="<%= rental.getRenUid() %>"></td></tr>
				<tr><th>책번호</th><td><input type="text" name="RBID" value="<%= rental.getRenBnum() %>"></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="수정" name="btn">
					<input type="button" value="조회" onClick="doSelect()"/>
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
		if (confirm("정말로 조회하겠습니까?")) {
			location.href="rentalList.do";
		}
	}
	function check() {
		if (confirm("작업을 진행합니까?")) {
			return true;
		}else{
			return false;
		}
	}
</script>
</body>
</html>