<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>모든 리뷰</title>
	<link href="temp.css" type="text/css" rel="stylesheet"/>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<div id = "wrap">
		<div id ="top">
			<div id ="top_left">
				<img src="images/logo_top.png" alt="website Logo"/>
			</div>
			<div id = "top_right">
				<a href="login.jsp">로그인</a>
				<a href="join.jsp">회원가입</a>
				<a href="mypage.jsp"> my page </a>
			</div>
		</div>
		<div id="header" >
			<form class="navbar-form pull-left">
				<input type="text" class="span2">
				<button type="submit" class="btn">Search</button>
			</form>
		</div>
		<div id="menuBar">
			<div id="navbar">
			<ul>
				<li><a href="main.html">Home</a></li>
				<li><a href="allreview.jsp">모든 리뷰</a></li>
				<li><a href="nowreview.html">이번달 리뷰</a></li>	
			</ul>
			</div>
		</div>
		<div id="main">
		<form action="write.html" method=post>
			<div>
				<input type="submit" name="board_write" value="글작성">
			</div>
		</form>	
		<jsp:include page="boardlist.jsp">
			<jsp:param name="current" value="view" />
		</jsp:include>
		</div>
	</div>
		<div id="footer">
		회사소개 | copyright | 유해게시물신고 | 문의하기
		</div>
	<br>
</body>
</html>