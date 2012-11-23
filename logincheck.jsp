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
				 session.setAttribute("id", id);//세션에 id를 등록한다(로그인)%>
				<script type="text/javascript">
			    window.onload = function() {
			        setTimeout("window.close()",0);
			        window.opener.document.location.href = "main.jsp";
			  	 }
			    
				</script>
		
		<%	} else {%>
				<b>입력한 내용을 찾을 수 없습니다. 다시 입력해 주십시오.<b>
				<br><br><a span style= "color:red";>이 창은 3초 후 자동으로 종료됩니다. </a>
						<script type="text/javascript">
					    window.onload = function() {
					        setTimeout("window.close()",3000);
					  	 }
						</script>
			<% }
		}
	%>
</body>
</html>