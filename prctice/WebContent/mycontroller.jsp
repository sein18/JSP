<%@page import="com.dto.Boarddto"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Boarddao"%>
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
	String command = request.getParameter("command");
	
	Boarddao dao = new Boarddao();

	if(command.equals("boardlist")){
		List<Boarddto> list = dao.selectAll();
		
		request.setAttribute("allList", list);
		pageContext.forward("boardlist.jsp");
	}
	else if(command.equals("detail")){
		
	}
%>
</body>
</html>