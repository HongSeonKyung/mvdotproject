<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<style>
	#wrap{width:960px;margin: 0 auto;}
	#top_left{text-align: left;}
#top_right{text-align: right; padding:0;} 

</style>
<script type="text/javascript">
 function showlog(){ 
		window.open("login.jsp", "","width=80, height=100,top=200px,left=400"); 
	 }

 function showlogout(){ 
		window.open("logout.jsp", "","width=80, height=100,,top=200px,left=400"); 
	 }

 </script>
</head>

<body>  


		<div id ="top">
			<div id ="top_left">
				<img src="images/logo_top.png" alt="website Logo"/>
			</div>
			<div id = "top_right">
			 <%
			String id = (String)session.getAttribute("id");
			if(id==null){
			
			%>
				<a class="btn" type="button" onClick="showlog();"><i class="icon-heart"></i>로그인</a>
				<a href="join.jsp" class="btn" type="button"><i class="icon-star"></i>회원가입 </a>
				
			<% }else{ %>
			 <i class="icon-heart"></i><% out.print("<b>" + session.getAttribute("id") + "</b> 님"); %>
			 <a class="btn" type="button" onClick="showlogout();"><i class="icon-off"></i>로그아웃</a>
			<%} %>
				
				
				<a href="mypage.jsp" class="btn" type="button"><i class="icon-user"></i> my page </a>
				
			</div>
		</div>	


</body>
</html>
		