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
<header>
	<h1 align="center"><a href="index.jsp">���� �뿩 �ý��� ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">�α��� ���</h2>
	<p>
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){//�α��� ���� �޼��� ���
		out.print("�α��� ����<br/>");
		String id = (String)session.getAttribute("LOGINID");
		out.print("ȯ���մϴ�~ "+ id +"��~");
	}else if(result.equals("NOPWD")){//��ȣ����ġ �޼��� ���
		out.print("��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���ϼ���.");
	}else if(result.equals("NOID")){//�������� �޼��� ���
		out.print("������ �����ϴ�. ���� �� �̿��� �ּ���.");
	}
%>	
	</p>
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
</body>
</html>