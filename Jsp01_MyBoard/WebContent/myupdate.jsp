<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.my.dto.MyBoardDto"%>
<%@ page import="com.my.dao.MyBoardDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	MyBoardDao dao = new MyBoardDao();
	MyBoardDto dto = dao.selectOne(myno);
%>
<form action="myupdate_res.jsp" method="post">
	<input type="hidden" name="myno" value="<%=dto.getMyno()%>">
	<table>
		<tr>
			<th>이름</th>
			<td><%=dto.getMyname() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle" value="<%=dto.getMytitle() %>"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="mycontent"><%=dto.getMycontent() %></textarea></td>	
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정"></td>
		</tr>
	</table>
</form>
</body>
</html>