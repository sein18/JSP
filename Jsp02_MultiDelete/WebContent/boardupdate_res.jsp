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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int seq = Integer.parseInt(request.getParameter("seq"));
	MDBoardDto dto = new MDBoardDto(); 
	dto.setTitle(title);
	dto.setContent(content);
	dto.setSeq(seq);
	MDBoardDao dao = new MDBoardDao();
	
	int res = dao.update(dto);
	if(res>0){
%>
	<script type="text/javascript">
		alert("수정 성공");
		location.href = "boardlist.jsp";
	</script>	
<%
	}else{
%>
	<script type="text/javascript">
		alert("수정 실패");
		location.href = "boardlist.jsp";
	</script>	
<%
	}
%>
</body>
</html>