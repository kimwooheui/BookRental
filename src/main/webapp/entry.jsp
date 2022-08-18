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
	<h1 align="center"><a href="index.jsp">도서 대여 시스템 ver1.0</a></h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">회원 등록</h2>
	<form action="memberRegister.do" method="post" onSubmit="return check(this)">
		<div align="center">
			<table border="1" style="border-spacing: 0;">
				<tr><th>아이디</th><td><input type="text" name="ID"></td></tr>
				<tr><th>이름</th><td><input type="text" name="NAME" ></td></tr>
				<tr><th>연락처</th><td><input type="text" name="TEL" ></td></tr>
				<tr><th>패스워드</th><td><input type="password" name="PWD" ></td></tr>
				<tr><th>주소</th><td><input type="text" name="ADDR" ></td></tr>
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
	function doSelect(){
		if(confirm("정말로 조회하겠습니까?")){
			location.href="memberList.do";
		}
	}
	function check(frm) {
		if(frm.ID.value == ''){
			alert("아이디를 입력하시오");
			return false;
		}
		if(frm.NAME.value == ''){
			alert("이름을 입력하시오");
			return false;
		}
		if(frm.TEL.value == ''){
			alert("연락처를 입력하시오");
			return false;
		}
		if(frm.PWD.value == ''){
			alert("패스워드를 입력하시오");
			return false;
		}
		if(frm.ADDR.value == ''){
			alert("주소를 입력하시오");
			return false;
		}
		if(confirm("입력한 내용이 맞습니까?")){
			return true;
		}else{
			return false;
		}
	}
</script>
</body>
</html>