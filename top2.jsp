
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
 function showlogout(){ 
		window.open("logout.jsp", "","width=130, height=210"); 
	 }
 </script>
</head>

<body>

		<div id ="top">
			<div id ="top_left">
				<img src="images/logo_top.png" alt="website Logo"/>
			</div>
			<div id = "top_right">
				<i class="icon-heart"></i><% out.print("<b>" + session.getAttribute("id") + "</b> 님"); %>
				<a class="btn btn-info" type="button" onClick="showlogout();"><i class="icon-off"></i>로그아웃</a>
				<a href="mypage.jsp" class="btn btn-info" type="button"><i class="icon-user"></i> my page </a>				
			</div>
		</div>	


</body>
</html>
		