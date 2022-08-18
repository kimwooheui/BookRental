<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="book.*" %>
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
	Book book = (Book)request.getAttribute("BOO");
%>
	<h1 align="center"><a href="index.jsp">도서 대여 시스템 ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">도서 목록 수정</h2>
	<form action="bookUpdate.do" method="post" onSubmit="return check()">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>책번호</th><td><input type="text" name="BNUM" readonly value="<%= book.getbId() %>"></td></tr>
				<tr><th>책이름</th><td><input type="text" name="BNAME" value="<%= book.getbName() %>"></td></tr>
				<tr><th>출판사</th><td><input type="text" name="BPUB" value="<%= book.getbPub() %>"></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="수정" name="btn">
					<input type="button" value="조회" onClick="doSelect()"/>
					<input type="submit" value="삭제" name="btn">
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
			location.href="bookList.do";
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