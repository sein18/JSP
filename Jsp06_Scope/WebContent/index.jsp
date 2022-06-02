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
	//page : jsp페이지 내에서만 객체를 공유하는 영역<% % >
	//request : 요청을 받아서 응답하기 까지 객체가 유요한 영역 request.
	//session : 하나의 브라우저당 1개의 session객체가 공유. request.getSession()
	//application : 하나의 app 당 1개의 application객체가 공유. request.getServletContext()
	
	pageContext.setAttribute("pageId", "myPageIdVal");
	request.setAttribute("reqId","myReqIdVal"); 
	session.setAttribute("sessionId","mySessionIdVal");
	application.setAttribute("appId","myAppIdVal");
%>

<h1>index</h1>

pageId: <%=pageContext.getAttribute("pageId") %> <br>
request: <%=request.getAttribute("reqId") %> <br>
session: <%= session.getAttribute("sessionId") %><br>
qpplicationId: <%= application.getAttribute("appId") %> <br>

<br>
<a href="result.jsp">이동(result.jsp)</a>
<a href="MyServlet.do">이동(controller)</a>

</body>
</html>