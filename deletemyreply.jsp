<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String errorMsg = null;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String review_id = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	
	try{
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		request.setCharacterEncoding("utf-8");

		review_id = request.getParameter("review_id");
		String user_id = request.getParameter("user_id");
		String content = request.getParameter("content");
		String comment_id = request.getParameter("comment_id");
		
		stmt = conn.prepareStatement("DELETE FROM reply WHERE review_id=?");
		stmt.setInt(1, Integer.parseInt(review_id));
		
		stmt.executeUpdate();
	} catch (SQLException e){
		e.printStackTrace();
	} finally{
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
		response.sendRedirect("myreply.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>