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
				<input type="text" class="span2">
				<button type="submit" class="btn">Submit</button>
			</form>
		</div>
		<div id="menuBar">
			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
		</div>
		<div id="main">
		</div>
	</div>
	<div id="footer">
		ȸ��Ұ� | copyright | ���ذԽù��Ű� | �����ϱ�
	</div><br>
</body>
</html>