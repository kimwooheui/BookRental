<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<div class="nav1" align="center" >
<table class="nav">
	<tr>
		<td><a href="memberEntry.do">ȸ�����</a>&nbsp;</td>
		<td><a href="memberList.do">ȸ�� ��ȸ/����</a>&nbsp;</td>
		<td><a href="bookEntry.do">���� ���</a>&nbsp;</td>
		<td><a href="bookList.do">���� ��ȸ/����</a>&nbsp;</td>
		<td><a href="rentalEntry.do">�뿩���</a>&nbsp;</td>
		<td><a href="rentalList.do">�뿩���</a>&nbsp;</td>
		<td><a href="index.jsp">Ȩ����</a>&nbsp;</td>
<%
	String id = (String)session.getAttribute("LOGINID");
	if(id == null){
%>
		<td><a href="login.jsp">�α���</a>&nbsp;</td>
	</tr>
	</table>
</div>
<div class="allignR2"></div>


<%
	}else{
%>
		<td><a href="logout.do">�α׾ƿ�</a>&nbsp;</td>
	</tr>
	</table>
</div>
<div class="allignR" style="text-align: right;"><span>ȯ���մϴ�<br><%= id %>��</span></div>
	
<%
	}
%>
