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

		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			if (conn != null) {
				int result = 0;
				request.setCharacterEncoding("utf-8");
				String id = (String) session.getAttribute("id"); //사용자 아이디
				String subject = request.getParameter("subject");
				String content = request.getParameter("content");
				stmt = conn.prepareStatement("INSERT INTO REVIEW_BOARD(user_id,subject,content,writetime) " + "VALUES(?, ?, ?, NOW())");
				stmt.setString(1, id);
				stmt.setString(2, subject);
				stmt.setString(3, content);
				
				result = stmt.executeUpdate();
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
	<jsp:include page="header.jsp">
		<jsp:param name="current" value="write" />
	</jsp:include>
	<table border="1">
		<tbody>
			<tr>
				<td>추천수</td>
				<td>공감해요</td>
				<td>제목</td>
				<td>조회수</td>
				<td>날짜</td>
			</tr>
<%
				if (result != 0) {
					stmt = conn.prepareStatement("SELECT subject, DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time FROM REVIEW_BOARD");
					rs = stmt.executeQuery();
					while (rs.next()) {
						out.print("<tr>");
						out.print("<td>" + 0 + "</td>");
						out.print("<td>" + 0 + "</td>");
						out.print("<td>" + rs.getString("subject") + "</td>");
						out.print("<td>" + 0 + "</td>");
						out.print("<td>" + rs.getString("time") + "</td>");
						out.print("</tr>");
					}
				}
			}
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
		</tbody>
	</table>
	<div>
		<a href="main.html">목록으로</a>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>