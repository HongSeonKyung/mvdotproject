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

		//이름이 가입한목록에 있는지 없는지 

		if (conn != null) {
			String name, nickname, dbid = null;
			String dbname, dbnickname = null;
			request.setCharacterEncoding("utf-8");
			name = request.getParameter("name");
			nickname = request.getParameter("nickname");
			stmt = conn.prepareStatement("SELECT ID,NICKNAME FROM USERS WHERE NAME= ?");
			stmt.setString(1, name);
			rs = stmt.executeQuery();

			boolean hasName = false;
			while (rs.next()) {
				dbid = rs.getString("ID");
				dbnickname = rs.getString("NICKNAME");
				hasName = true;

			}
			if (hasName == false) {
				out.print("등록된 사용자가 없습니다.");
			} else if (nickname.equals(dbnickname)) {
				response.sendRedirect("./idis.jsp?id=" + dbid);
				//그 이름에 닉네임이 맞으면  아이디 알려주기
			} else {
				response.sendRedirect("./finderror.jsp");
				// 그 이름에 닉네임이 맞지않으면 잘못됫다고 알려주기
			}
		}
	%>
</body>
</html>
