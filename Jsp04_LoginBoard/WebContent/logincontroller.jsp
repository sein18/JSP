<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@page import="com.login.dto.MyMemberDto"%>
<%@page import="com.login.dao.MyMemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String command = request.getParameter("command");
	System.out.println("[command: "+command+"]");
	
	MyMemberDao dao = new MyMemberDao();
	
	if(command.equals("login")){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MyMemberDto dto = dao.login(id, pw);

		if (dto.getMyid() != null) {
			session.setAttribute("dto", dto);
			
			//session에 담긴 객체가 살아있는 시간
			session.setMaxInactiveInterval(60*60);
			
			if(dto.getMyrole().equals("admin")){
				response.sendRedirect("adminmain.jsp");
			}else if(dto.getMyrole().equals("user")){
				response.sendRedirect("usermain.jsp");
			}
		}else{
%>
		<script type="text/javascript">
			alert("ligin 실패");
			location.href="index.jsp";
		</script>
<%
		}
	}
	
	else if(command.equals("logout")){
		//session 정보 삭제
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
	
	else if(command.equals("userlistall")){
		List<MyMemberDto> list = dao.selectAll();
		
		request.setAttribute("list", list);
		pageContext.forward("userlistall.jsp");
	}
	
	else if(command.equals("registform")){
		 response.sendRedirect("registform.jsp");
	}
	else if(command.equals("idchk")){
		String myid = request.getParameter("id");
		String res = dao.idChk(myid);
		
		boolean idnotused = true;
		
		if(res != null){
			idnotused = false;
		}
		response.sendRedirect("idchk.jsp?idnotused="+idnotused);
	}
	else if(command.equals("insertuser")){
		String myid = request.getParameter("myid");	
		String mypw = request.getParameter("mypw");	
		String myname = request.getParameter("myname");	
		String myaddr = request.getParameter("myaddr");	
		String myphone = request.getParameter("myphone");	
		String myemail = request.getParameter("myemail");	
		
		MyMemberDto dto = new MyMemberDto();
		dto.setMyid(myid);
		dto.setMypw(mypw);
		dto.setMyname(myname);
		dto.setMyaddr(myaddr);
		dto.setMyphone(myphone);
		dto.setMyemail(myemail);
		
		int res = dao.insertUser(dto);
		if(res>0){
%>
		<script type="text/javascript">
		alert("회원가입 성공");
		location.href="index.jsp";
		</script>

<%
		}else{
%>
		<script type="text/javascript">
		alert("회원가입 실패");
		location.href="logincontroller.jsp?command=registform";
		</script>
<%
		}
	}
	else if(command.equals("pwchk")){
		String tem = request.getParameter("tmp");
		String myid = request.getParameter("id");
		String mypw = request.getParameter("pw"); 
		int res = dao.updatepw(tem, myid);
		
		if(res>0){
%>
		<script type="text/javascript">
		alert("비밀번호 수정 성공"); 
		</script>
<%
		response.sendRedirect("logincontroller.jsp?command=login&id="+myid+"&pw="+tem); 
		}else{
%>
		<script type="text/javascript">
		alert("비밀번호 수정 실패");
		response.sendRedirect("logincontroller.jsp?command=login&id="+myid+"&pw="+mypw);
		</script>
<%
		}
	}
%>
</body>
</html>