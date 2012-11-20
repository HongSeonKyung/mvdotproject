
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
#navbar{width:960px;height:30px; background-color:  #6F83D6;} 
#navbar ul{margin:5; padding:0;}
#navbar ul li{float:left;}
#navbar ul li a{
		color: #000; background-color:#66A1D2;
		display:block;
		text-align:center;
		padding:5px 0px;
		width: 120px;
		margin-right:1px;
		text-decoration:none;
}
#navbar ul li a:hover{background-color:#7373D9;}
</style>
</head>
<body>
<div id = "wrap">
		<div id ="top">
			<div id ="top_left">
				<img src="images/logo_top.png" alt="website Logo"/>
			</div>
			<div id = "top_right">
				<a href="login.jsp"> 로그인 </a>
				<a href="join.jsp"> 회원가입 </a>
				<a href="mypage.jsp"> my page </a>
			</div>
		</div>
		
		
			<div id="navbar">
			<ul>
				<li><a href="main.html">Home</a></li>
				<li><a href="allreview.jsp">모든리뷰</a></li>
				<li><a href="nowreview.html" >현재상영작리뷰</a></li>	
			</ul>
			</div>
		
</div>

</body>
</html>
		