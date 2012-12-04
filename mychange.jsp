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
		request.setCharacterEncoding("utf-8");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		review_id = request.getParameter("review_id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		stmt = conn.prepareStatement("UPDATE review_board SET subject=?, content=? WHERE review_id=?");
		stmt.setString(1, subject);
		stmt.setString(2, content);
		stmt.setInt(3, Integer.parseInt(review_id));
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
		response.sendRedirect("mywrite2.jsp?review_id=" + review_id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>

</body>
</html>