<%@page import="mail.MailSender"%>
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
<title>비밀번호 찾기</title>
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

		//이름이 가입한목록에 있는지 없는지 

		if (conn != null) {
			String id, facebook_id = null;
			String dbfacebook_id = null;
			String nickname = null, password = null;
			id = request.getParameter("id");
			facebook_id = request.getParameter("facebook_id");
			stmt = conn
					.prepareStatement("SELECT FACEBOOK_ID , NICKNAME, PASSWORD FROM USERS WHERE ID= ?");
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			boolean hasID = false;
			while (rs.next()) {
				dbfacebook_id = rs.getString("FACEBOOK_ID");
				nickname = rs.getString("NICKNAME");
				password = rs.getString("PASSWORD");
				hasID = true;
			}
			if (hasID == false) {
				response.sendRedirect("./finderror.jsp");

			} else if (facebook_id.equals(dbfacebook_id)) {
				MailSender mailSender = new MailSender();
				mailSender.sendMail(facebook_id, nickname, password);
				response.sendRedirect("./pwdis.jsp");
				//response.sendRedirect("");
				//그아이디에 메일주소 맞으면 메일로 비밀번호 보내주기
			} else {
				response.sendRedirect("./finderror.jsp");
				// 그 아이디와 메일주소가 맞지않으면 에러!!
			}
		}
	%>
</body>
</html>