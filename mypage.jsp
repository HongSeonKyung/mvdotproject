<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>mypage</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
 <jsp:include page="header.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";
		
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		
	%>
 <h3> 님 환영합니다.</h3>
 <div>
 	<ul>
 		<li>회원정보수정</li>
 		<li>작성한게시글보기</li>
 		<li>작성한댓글보기</li>
 	</ul>
 </div>
 <div>
 	<ol>
 		<li> 아이디 : </li>
 		<li> 이름 : </li>
 		<li> 닉네임 : </li>
 		<li> 페이스북 아이디 : </li>
 		<li> 페이스북 주소 : </li>
 	</ol>
 </div>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>