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
			String movie_title = request.getParameter("mov_title");
			String movie_img = request.getParameter("mov_img");
			String movie_pubdate = request.getParameter("mov_open_info");
			String movie_director = request.getParameter("mov_director");
			String actor = request.getParameter("mov_actor");
			String movie_story = request.getParameter("mov_story");
			
			stmt = conn.prepareStatement("INSERT INTO REVIEW_BOARD(user_id, subject, content, writetime, vote_cnt, movie_title, movie_pubdate, movie_director, actor, movie_story, movie_img) " + "VALUES(?, ?, ?, NOW(), 0, ?, ?, ?, ?, ?, ?)");
			stmt.setString(1, (String) session.getAttribute("id"));
			stmt.setString(2, subject);
			stmt.setString(3, content);
			stmt.setString(4, movie_title);
			stmt.setString(5, movie_pubdate);
			stmt.setString(6, movie_director);
			stmt.setString(7, actor);
			stmt.setString(8, movie_story);
			stmt.setString(9, movie_img);
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
			response.sendRedirect("allreview.jsp");
		}
	%>
</body>
</html>