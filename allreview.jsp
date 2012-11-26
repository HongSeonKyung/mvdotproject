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
		<jsp:include page="top.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
 		
		<div id="header" >
			<form class="navbar-form pull-left">
				<jsp:include page="slideshow.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
			</form>
		</div>
		<div id="menuBar">
			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
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
	
		<div id="footer">
		회사소개 | copyright | 유해게시물신고 | 문의하기
		</div>
	</div><br>
</body>
</html>