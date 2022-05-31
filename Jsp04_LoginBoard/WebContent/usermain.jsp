<%@page import="com.login.dto.MyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; chaeset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function opendto() {
		 if(document.getElementsByTagName("table")[0].style.display=="inline-block"){
			 document.getElementsByTagName("table")[0].style.display="none";
		 }else{
			 document.getElementsByTagName("table")[0].style.display="inline-block";
		 }
	}
	function change() {
		let doc = document.getElementsByTagName("input")[0];
		let id =  document.getElementsByTagName("td")[1].innerText;
		let pw =  document.getElementsByTagName("td")[2].innerText;
		console.log(id);
		location.href="logincontroller.jsp?command=pwchk&tmp="+doc.value.trim()+"&id="+id.trim()+"&pw="+pw.trim(); 
	}
</script>
</head>
<body>
 <%
 	MyMemberDto dto = (MyMemberDto)session.getAttribute("dto");
 %>
<div>
 	<span><%=dto.getMyname() %> 님 환영합니다. (등급: <%=dto.getMyrole() %>)</span>
 	<a href="logincontroller.jsp?command=logout">로그아웃</a>
</div>

<h1>메인화면</h1> 
<div>
	<div>
		<button onclick="opendto();">내정보보기</button>
	</div>
	<div>
		<a href="mycontroller.jsp?command=boardlist" >게시판 목록</a>
	</div>
</div>
<table border="1" style="text-align: center; display:none;">
	<col width="30PX"><col width="200px">
	<tr>
		<th>NO</th>
		<td><%= dto.getMyno() %></td>
	</tr>
	<tr>
		<th>I D</th>
		<td><%= dto.getMyid() %></td>
	</tr>
	<tr>
		<th>P W</th>
		<td><%= dto.getMypw() %></td>
	</tr>
	<tr>
		<th>NAME</th>
		<td><%= dto.getMyname() %></td>
	</tr>
	<tr>
		<th>ADDR</th>
		<td><%= dto.getMyaddr() %></td>
	</tr>
	<tr>
		<th>PHONE</th>
		<td><%= dto.getMyphone() %></td>
	</tr>
	<tr>
		<th>EMAIL</th>
		<td><%= dto.getMyemail() %></td>
	</tr>
	<tr>
		<th>ENABLED</th>
		<td><%= dto.getMyenabled() %></td>
	</tr>
	<tr>
		<th>MYROLE</th>
		<td><%= dto.getMyrole() %></td>
	</tr>
	<tr>
		 <th>
		<button style="text-align:right;" onclick="change();">비번수정</button>
		</th>
		<td><input type="text" name="pw" placeholder="수정할 비번을 입력하시오."></td> 
	</tr>
</table>

</body>
</html>