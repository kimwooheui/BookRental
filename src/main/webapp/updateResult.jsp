<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 대여 시스템</title>
</head>
<body>
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){
%>
	<script type="text/javascript">
		alert("회원정보가 수정되었습니다.");
		location.href="index.jsp";
	</script>
<% } else { %>
	<script type="text/javascript">
		alert("회원정보가 수정되지 않았습니다.");
		location.href="index.jsp";
	</script>
<% } %>
</body>
</html>