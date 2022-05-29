<%@page import="com.dto.Boarddto"%>
<%@page import="java.util.List"%>
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
<style>
	tr,th{
	text-align: center;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function allchk(bool) {
		let chk = $("input[name=chk]");
		for(let i=0;i<chk.length;i++){
			chk[i].checked=bool;
		} 
	};
	 
	 $(function () {
		
	 $("input[name=chk]").click(function(){
		 console.log($("input[name=chk]:checked").length);
		  if($("input[name=chk]:checked").length != $("input[name=chk]").length){
			  $("input[name=all]").prop("checked",false);
		  }
	  });
	}); 
</script>
<body>
<%
	List<Boarddto> list = (List<Boarddto>)request.getAttribute("allList");
	
%>
<table border="1">
	<col width="20px"><col width="20px"><col width="50px"><col width="300px"><col width="120px">
	<tr>
		<th><input type="checkbox" name="all" onclick="allchk(this.checked)"></th>
		<th>NO</th>
		<th>WRITER</th>
		<th>TITLE</th> 
		<th>DATE</th>
	</tr>
<%
	if(list.size()==0){
		%>
		<tr>
			<td colspan="4"><b>----글이 존재하지 않습니다----</b></td>
		</tr>
		<%
	}else{
		for(int i=0;i<list.size();i++){
		%>
		<tr>
			<th><input type="checkbox" name="chk" value="<%=list.get(i).getSeq() %>"></th>
			<td><%=list.get(i).getSeq() %></td>
			<td><%=list.get(i).getWriter() %></td>
			<td><a><%=list.get(i).getTitle() %></a></td> 
			<td><%=list.get(i).getRegdate() %></td>
		</tr>
		<%
		}
	}

		%>
</table>

</body>
</html>