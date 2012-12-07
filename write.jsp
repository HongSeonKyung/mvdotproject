<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			request.setCharacterEncoding("utf-8");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			stmt = conn.prepareStatement("INSERT INTO REVIEW_BOARD(user_id, subject, content, writetime, vote_cnt) " + "VALUES(?, ?, ?, NOW(), 0)");
			stmt.setString(1, (String) session.getAttribute("id"));
			stmt.setString(2, subject);
			stmt.setString(3, content);

			stmt.executeUpdate();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_borad</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="allreview.jsp"></jsp:include>
	<%
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>