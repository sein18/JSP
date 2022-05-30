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
	window.onload=function(){
		let id = opener.document.getElementsByName("myid")[0].value;
		
		document.getElementsByName("id")[0].value=id;
	}
	function confirm(bool) {
		if(bool=="true"){
			opener.document.getElementsByName("mypw")[0].focus();
			opener.document.getElementsByName("myid")[0].title='Y'; 
			//opener.document.getElementsByName("myid")[0].prop('readonly')=
		}else{
			opener.document.getElementsByName("myid")[0].focus();
		}
		self.close();
	}
</script>
</head>
<body>
<%
	String idnotused = request.getParameter("idnotused");
%>

<table border="1">
	<tr>
		<td><input type="text" name="id" readonly="readonly"></td>
	</tr>
	<tr>
		<td><%= idnotused.equals("true") ? "아이디 생성가능" : "중복 아이디 존재" %></td>
	</tr>
	<tr>
		<td>
		<input type="button" value="확인" onclick="confirm('<%= idnotused%>')">
		</td>
	</tr> 
</table>
</body>
</html>