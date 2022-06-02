<%@page import="com.login.dto.MyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyMemberDto dto = (MyMemberDto)request.getAttribute("dto");
%>
<h1>회원등급 변경 패이지</h1>
<form action="logincontroller.jsp" method="post">
	<input type="hidden" name="command" value="updaterole">
	<input type="hidden" name="myno" value="<%=dto.getMyno()%>">
	<table border="1">
		<col width="50"><col width="200">
		<tr>
			<th>NO</th>
			<td><%=dto.getMyno() %></td>
		</tr>
		<tr>
			<th>NAME</th>
			<td><%=dto.getMyname() %></td>
		</tr>
		<tr>
			<th>ROLE</th>
			<td>
				<select name="myrole">
					<option value="user" <%=dto.getMyrole().equals("user")? "selected":""%>>일반회원</option>
					<option value="manager" <%=dto.getMyrole().equals("manager")? "selected":""%>>매니저</option>
					<option value="admin" <%=dto.getMyrole().equals("admin")? "selected":""%>>관리자</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="변경완료">
			</td>
		</tr>
	</table>
</form>
</body>
</html>