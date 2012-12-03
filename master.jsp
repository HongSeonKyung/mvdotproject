<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지</title>
</head>
<body>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
 function mblgo(){ 
		window.location.href("masterboardlist.jsp"); 
	 }
 function mulgo(){ 
		window.location.href("masteruserlist.jsp"); 
	 }
 </script>
</head>
<body>
<div id = "wrap">
 			<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
 
 	<div id="mastermenubar">
 	<a class="btn btn-large btn-primary" type="button" onClick="mblgo();" >게시글 관리</a>
 	<a class="btn btn-large btn-primary" type="button" onClick="mulgo();" >회원 관리</a>
 	 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 </div>
</body>
</html>