<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������</title>
</head>
<body>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
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
 	<a href="masterboardlist.jsp"class="btn" type="button">�Խñ� ����</a>
 	<a href="masteruserlist.jsp" class="btn" type="button" >ȸ�� ����</a>
 	 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 </div>
</body>
</html>