<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세 글 보기</h1>
	<table border="1">
		<tr>
			<th>N O</th>
			<th>${dto.seq}</th>		
		</tr>
		<tr>
			<th>WRITER</th>
			<th>${dto.writer}</th>		
		</tr>
		<tr>
			<th>TITLE</th>
			<th>${dto.title}</th>		
		</tr>		
		<tr>
			<th>CONTENT</th>
			<th><textarea rows="10" cols="60" readonly="readonly">${dto.content}</textarea></th>		
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='controller.do?command=updateform&seq=${dto.seq}'"> 
				<input type="button" value="삭제" onclick="location.href='controller.do?command=delete&seq=${dto.seq}'"> 
				<input type="button" value="목록" onclick="location.href='controller.do?command=list'"> 
			</td>
		</tr>
		
	</table>
	
</body>
</html>