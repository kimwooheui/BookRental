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
<%
	String bId=request.getParameter("BNUM");
%>
	<h1 align="center"><a href="index.jsp">도서 대여 시스템 ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">도서 등록</h2>
	<form action="bookRegister.do" method="post" onSubmit="return check(this)">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>책번호(자동생성)</th><td><input type="text" name="BNUM" readonly value="<%= bId %>"></td></tr>
				<tr><th>책이름</th><td><input type="text" name="BNAME" ></td></tr>
				<tr><th>출판사</th><td><input type="text" name="BPUB" ></td></tr>
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
		if (frm.BNUM.value == '') {
			alert("북아이디가 공란입니다.")//북아이디는 자동생성으로 할까?
			return false;
		}
		if (frm.BNAME.value == '') {
			alert("도서명이 공란입니다.")
			return false;
		}
		if (frm.BPUB.value == '') {
			alert("출판사가 공란입니다.")
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
			location.href="bookList.do";
		}
	}
</script>
</body>
</html>