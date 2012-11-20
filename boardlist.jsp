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
			String id = (String) session.getAttribute("id"); //사용자 아이디
			stmt = conn.prepareStatement("SELECT review_id, subject, DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time FROM REVIEW_BOARD");
			rs = stmt.executeQuery();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
	<link href="temp.css" type="text/css" rel="stylesheet"/>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript">
	function goPage(review_id){
		window.location="show.jsp?review_id=" + review_id; 
	}//게시물 아이디를 파라메터로 같이 넘기기!!!
	</script>
</head>
<body>
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
					while (rs.next()) {
						out.print("<tr>");
						out.print("<td>" + 0 + "</td>");
						out.print("<td>" + 0 + "</td>");
						out.print("<td onclick='javascript:goPage("+rs.getInt("review_id")+");' style='cursor:hand;'>" + rs.getString("subject") + "</td>");
						out.print("<td>" + 0 + "</td>");
						out.print("<td>" + rs.getString("time") + "</td>");
						out.print("</tr>");
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
</body>
</html>