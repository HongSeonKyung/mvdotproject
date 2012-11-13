<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";

		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		if (conn != null) {
			String id, password, dbPwd = null;
			id = request.getParameter("id");
			password = request.getParameter("pwd");
			stmt = conn.prepareStatement("SELECT PASSWORD FROM USERS WHERE ID= ?");
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				dbPwd = rs.getString("PASSWORD");
			}
			if (password.equals(dbPwd)) {
				session.setAttribute("id", id);//세션에 id를 등록한다(로그인)
				out.print("<b>" + session.getAttribute("id") + "</b> 님 로그인해주셔서 감사합니다.");
			} else {
				out.print("<b>" + id + "</b> 님 로그인 실패하셨습니다.");
			}
		}
	%>
</body>
</html>