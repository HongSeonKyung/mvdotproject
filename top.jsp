
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
		window.open("login.jsp", "","width=130, height=210"); 
	 }
 </script>
</head>

<body>

		<div id ="top">
			<div id ="top_left">
				<img src="images/logo_top.png" alt="website Logo"/>
			</div>
			<div id = "top_right">
				<a class="btn" type="button" onClick="showlog();"><i class="icon-heart"></i>로그인</a>
				<a href="join.jsp" class="btn" type="button"><i class="icon-star"></i>회원가입 </a>
				<a href="mypage.jsp" class="btn" type="button"><i class="icon-user"></i> my page </a>
				<a href="update.jsp" class="btn" type="button"> 수정페이지 </a>
			</div>
		</div>	


</body>
</html>
		