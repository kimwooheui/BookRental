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
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){
%>
	<script type="text/javascript">
		alert("도서등록 완료");
		location.href="index.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("도서등록 중 문제 발생");
		location.href="index.jsp";
	</script>
<%
	}
%>
</body>
</html>