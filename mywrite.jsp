<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			int result = 0;
		
		request.setCharacterEncoding("utf-8");
			String user_id = (String) session.getAttribute("review_id");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String review_id = request.getParameter("user_id");//사용자 아이디
			
			stmt = conn.prepareStatement("SELECT *FROM REVIEW_BOARD WHERE REVIEW_ID=");
			
			stmt.setString(1, user_id);
			stmt.setString(2, review_id);
			stmt.setString(3, subject);
			stmt.setString(4, content);
			rs = stmt.executeQuery("SELECT *FROM REVIEW_BOARD");
			while(rs.next()){
				out.println(rs.getString("user_id"));
				out.println(rs.getString("review_id"));
				out.println(rs.getString("subject"));
				out.println(rs.getString("content"));
			}
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
	<div id = "wrap">
 			<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
	<%
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
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