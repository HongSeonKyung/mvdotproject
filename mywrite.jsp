<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_borad</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function goPage(review_id){
		window.location="mywrite2.jsp?review_id=" + review_id; 
	}//게시물 아이디를 파라메터로 같이 넘기기!!!
	</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
		</jsp:include>
		<jsp:include page="menubar.jsp">
	<jsp:param name="current" value="menubar"/>
		</jsp:include>
		<table border="1">
			<tbody>
			<tr>
				<td>review_id</td>
				<td>user_id</td>
				<td>제목</td>
			</tr>
	<% 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";
		String subject = "";
		String user_id = "";
		
		try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		int result = 0;

		String review_id = "";
		user_id  = "";
		subject = "";
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id"); //사용자 아이디
		System.out.println(id);
		stmt = conn.prepareStatement("SELECT REVIEW_ID, USER_ID, SUBJECT FROM REVIEW_BOARD WHERE USER_ID = ?");
		stmt.setString(1, id);
		rs = stmt.executeQuery();
		// 수행
	 while(rs.next()) {
			out.print("<tr>");
			out.print("<td>"+rs.getString("review_id")+"</td>"); 
			out.print("<td>"+rs.getString("user_id")+"</td>");
			out.print("<td onclick='javascript:goPage("+rs.getInt("review_id")+");' style='cursor:hand;'>" + rs.getString("subject") + "</td>");
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
	
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>