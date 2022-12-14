<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, book.*, member.*" %>
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
	String rId=request.getParameter("RNUM");
	//String member=request.getParameter("RNUM");
%>
	<h1 align="center"><a href="index.jsp">도서 대여 시스템 ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">대여정보 등록</h2>
	<form action="rentalRegister.do" method="post" onSubmit="return check(this)">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>대여번호(자동생성)</th><td><input type="text" name="RNUM" readonly value="<%= rId %>"></td></tr>
				<tr><th>대여날짜</th><td><input type="date" name="RNDATE"/></td></tr>
				<tr><th>반납날짜</th><td><input type="date" name="RTDATE"/></td></tr>
				<tr><th>대여자ID</th><td><input type="text" name="RUID" ></td></tr>
				<tr><th>책번호</th><td><input type="text" name="RBID" ></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="등록" name="btn">
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
	function check(frm) {
		if (frm.RNDATE.value == '') {
			alert("대여날짜가 공란입니다.")
			return false;
		}
		if (frm.RUID.value == '') {
			alert("대여자ID가 공란입니다.")
			return false;
		}	
		if (frm.RBID.value == '') {
			alert("책번호가 공란입니다.")
			return false;
		}	
		if (confirm("입력한 내용이 맞습니까?")) {
			return true;						
		}else{
			return false;			
		}
	}
	function doSelect() {
		if (confirm("정말로 조회하겠습니까?")) {
			location.href="rentalList.do";
		}
	}
</script>
</body>
</html>