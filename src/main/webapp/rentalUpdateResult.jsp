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
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){
%>
	<script type="text/javascript">
		alert("�뿩������ �����Ǿ����ϴ�.");
		location.href="rentalList.do";
	</script>
<% } else { %>
	<script type="text/javascript">
		alert("�뿩������ �������� �ʾҽ��ϴ�.");
		location.href="rentalList.do";
	</script>
<% } %>
</body>
</html>