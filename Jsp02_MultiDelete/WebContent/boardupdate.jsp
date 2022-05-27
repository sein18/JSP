<%@page import="com.multi.dto.MDBoardDto"%>
<%@page import="com.multi.dao.MDBoardDao"%>
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
	int seq = Integer.parseInt(request.getParameter("seq"));

	MDBoardDao dao =new MDBoardDao();
	MDBoardDto dto = dao.selectOne(seq);
%>
<%@ include file="./form/header.jsp" %>

<form action="boardupdate_res.jsp" method="post">
	<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
	<h1>게시글 수정</h1>
	<table border="1">
		<tr>
			<th>NO</th>
			<td><%=dto.getSeq() %></td>
		</tr>
		<tr>
			<th>WRITER</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>DATE</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td><input name="title" value="<%=dto.getTitle() %>"></td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td><textarea rows="10" cols="60" name="content"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="location.href='boarddetail.jsp?seq=<%=dto.getSeq()%>'">				 
			</td>
		</tr>
	</table>
</form>
<%@ include file="./form/footer.jsp" %>
</body>
</html>