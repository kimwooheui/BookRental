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
		alert("������� �Ϸ�");
		location.href="index.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("������� �� ���� �߻�");
		location.href="index.jsp";
	</script>
<%
	}
%>
</body>
</html>