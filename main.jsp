<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
		 		<jsp:param name="current" value="slide"/>
		 		</jsp:include>
			 </form>
		</div>
		<div id="menuBar">
			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
		</div>
		<div id="main">
		</div>	
	
		<div id="footer">
		 회사소개 | copyright | 유해게시물신고 | 문의하기
		</div>
	</div>
</body>
</html>