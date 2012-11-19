<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 중복체크</title>
</head>
<body bgcolor="#FFFFCC">
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";
		String id = request.getParameter("id");
		boolean hasID = false;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			String sql = "select * from users where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			hasID = false;
			while (rs.next()) {

				hasID = true;
			}

		} catch (Exception e) {
			out.print(e);
		}

		if (hasID == true) {
			out.println(id + "는 이미 존재하는 ID입니다. 사용할 수 없습니다.");
		} else {
			out.println(id + "는 사용가능합니다.");
		}
	%>

	<br>
	<center>
		<p>
			<a href="join.jsp" onClick="javascript:self.close()">닫기</a>
	</center>
</body>
</html>