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
		String content = "";
		String user_id = "";
		String comment_id="";
		String review_id = null;
		try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		review_id = "";
		user_id  = "";
		content = "";
		comment_id="";
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		stmt = conn.prepareStatement("SELECT REVIEW_ID, USER_ID, COMMENT_ID,CONTENT FROM REPLY WHERE USER_ID = ?");
		stmt.setString(1, id);
		rs = stmt.executeQuery();
		// 수행%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_borad</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function delectmyreply(){
	alert("정말 삭제하시겠습니까?");
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
				<td>id</td>
				<td>content</td>
				<td></td>
	<%
	 while(rs.next()) {
			out.print("<tr>");
			review_id = rs.getString("review_id");
			out.print("<td>"+rs.getString("user_id")+"</td>");
			out.print("<td>" + rs.getString("content") + "</td>");
			comment_id = rs.getString("comment_id");
	%>
		<td>
				<form action="deletemyreply.jsp" method="post">
					<input type="hidden" name="comment_id" value='<%=comment_id%>'>			
					<input type="hidden" name="review_id" value='<%=review_id%>'>			
					<input type="submit" name="delete" value="삭제" style="cursor: hand;" onclick='javascript:deletemyreply()'>
				</form>
		</td>
	</tr>
	<%
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