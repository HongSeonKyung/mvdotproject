<%@ page language="java" contentType="text/html; charset=EUC-KR"	
pageEncoding="EUC-KR"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
refreshParent = function() {		window.opener.document.location.href = "main.jsp";	};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onload="refreshParent()">
	<%		
	session.invalidate();	
	%>
		로그아웃 되었습니다.
		</body>
		</html> 









