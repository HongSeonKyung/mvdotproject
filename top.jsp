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
<<<<<<< HEAD


 function showlogout(){ 
		window.open("logout.jsp", "","width=80, height=100,,top=200px,left=400"); 
	 }


 </script>
</head>


<body>  




=======
 function showlogout(){ 
		window.open("logout.jsp", "","width=80, height=100,,top=200px,left=400"); 
	 }
 </script>
</head>
<body>  
<link href="temp.css" type="text/css" rel="stylesheet"/>
>>>>>>> cb5fe7f2083c02fc125885061c0e259b24c3e687
		<div id ="top">
			<div id ="top_left">
				<img src="images/logo_top.png" alt="website Logo"/>
			</div>
			<div id = "top_right">
<<<<<<< HEAD
			<%String id = (String)session.getAttribute("id");
			if(id==null){%>
				<a class="btn" type="button" onClick="showlog();"><i class="icon-heart"></i>로그인</a>
				<a href="join.jsp" class="btn" type="button"><i class="icon-star"></i>회원가입 </a>
			<% }else{
				if(id.equals("nanhee")){%>
				 <i class="icon-heart"></i><% out.print("mater 님"); %>
				 <a class="btn" type="button" onClick="showlogout();"><i class="icon-off"></i>로그아웃</a>
				 <a href="master.jsp" class="btn" type="button"><i class="icon-user"></i> 관리자 페이지 </a>
				<% }else{ %>
				 <i class="icon-heart"></i><% out.print("<b>" + session.getAttribute("id") + "</b> 님"); %>
				 <a class="btn" type="button" onClick="showlogout();"><i class="icon-off"></i>로그아웃</a>
				<a href="mypage.jsp" class="btn" type="button"><i class="icon-user"></i> my page </a>
				
				<% } 
			}%>
=======
			 <%
			String id = (String)session.getAttribute("id");
			if(id==null){


			%>
				<a class="btn" type="button" onClick="showlog();"><i class="icon-heart"></i>로그인</a>
				<a href="join.jsp" class="btn" type="button"><i class="icon-star"></i>회원가입 </a>
<<<<<<< HEAD


			<% }else{ %>
=======
				
			<% }else if(id.equals("nanhee")){%>
				 <i class="icon-heart"></i><% out.print("mater 님"); %>
				 <a class="btn" type="button" onClick="showlogout();"><i class="icon-off"></i>로그아웃</a>
				<a href="master.jsp" class="btn" type="button"><i class="icon-user"></i> 관리자 페이지 </a>
				<%
			}else if((id!=null)&&(id!="nanhee")){%>
>>>>>>> cb5fe7f2083c02fc125885061c0e259b24c3e687
			 <i class="icon-heart"></i><% out.print("<b>" + session.getAttribute("id") + "</b> 님"); %>
			 <a class="btn" type="button" onClick="showlogout();"><i class="icon-off"></i>로그아웃</a>
			<a href="mypage.jsp" class="btn" type="button"><i class="icon-user"></i> my page </a>
			
			<%} %>
<<<<<<< HEAD




				<a href="mypage.jsp" class="btn" type="button"><i class="icon-user"></i> my page </a>
=======
>>>>>>> 1ac6cbf8895f3a3058b0e0d57887111083a46905
				
				
				
>>>>>>> cb5fe7f2083c02fc125885061c0e259b24c3e687
			</div>
		</div>	
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> cb5fe7f2083c02fc125885061c0e259b24c3e687
