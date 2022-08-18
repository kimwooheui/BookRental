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
	<h2 align="center">ȸ�� ���</h2>
	<form action="memberRegister.do" method="post" onSubmit="return check(this)">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>���̵�</th><td><input type="text" name="ID"></td></tr>
				<tr><th>�̸�</th><td><input type="text" name="NAME" ></td></tr>
				<tr><th>����ó</th><td><input type="text" name="TEL" ></td></tr>
				<tr><th>�н�����</th><td><input type="password" name="PWD" ></td></tr>
				<tr><th>�ּ�</th><td><input type="text" name="ADDR" ></td></tr>
				<tr><td colspan="2" align="center">
					<input type="submit" value="���" name="btn">
					<input type="button" value="��ȸ" onClick="doSelect()"/>
				</td></tr>				
			</table>
		</div>
	</form>	
</section>
<footer>
	<h3 align="center">Copyright 2022 KIMWOOHEUI. ALL RIGHTS RESERVED.</h3>
</footer>
<script type="text/javascript">
	function doSelect(){
		if(confirm("������ ��ȸ�ϰڽ��ϱ�?")){
			location.href="memberList.do";
		}
	}
	function check(frm) {
		if(frm.ID.value == ''){
			alert("���̵� �Է��Ͻÿ�");
			return false;
		}
		if(frm.NAME.value == ''){
			alert("�̸��� �Է��Ͻÿ�");
			return false;
		}
		if(frm.TEL.value == ''){
			alert("����ó�� �Է��Ͻÿ�");
			return false;
		}
		if(frm.PWD.value == ''){
			alert("�н����带 �Է��Ͻÿ�");
			return false;
		}
		if(frm.ADDR.value == ''){
			alert("�ּҸ� �Է��Ͻÿ�");
			return false;
		}
		if(confirm("�Է��� ������ �½��ϱ�?")){
			return true;
		}else{
			return false;
		}
	}
</script>
</body>
</html>