<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String review_id = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			int result = 0;
			request.setCharacterEncoding("utf-8");
			review_id = request.getParameter("review_id");
			String user_id = (String) session.getAttribute("id"); //사용자 아이디
			String content = request.getParameter("reply");
			String stars = request.getParameter("star");
			//댓글에 들어갈 디비를 삽입하기
			stmt = conn.prepareStatement("INSERT INTO reply(review_id, user_id, content, writetime) VALUE(?,?,?,NOW())");
			stmt.setInt(1, Integer.parseInt(review_id));
			stmt.setString(2, user_id);
			stmt.setString(3, content);
			stmt.executeUpdate();
			//별점에 들어갈 디비 삽입
			stmt = conn.prepareStatement("INSERT INTO star_points(review_id, user_id, star_point) VALUE(?,?,?)");
			stmt.setInt(1, Integer.parseInt(review_id));
			stmt.setString(2, user_id);
			stmt.setInt(3, Integer.parseInt(stars));
			stmt.executeUpdate();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
</head>
<body>
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
			response.sendRedirect("show.jsp?review_id=" + review_id);
		}
	%>
</body>
</html>