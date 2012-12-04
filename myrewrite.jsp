<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	
	String review_id= null;
	String subject= "";
	String content= "";

	int id = 0;
	try {	
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			review_id = request.getParameter("review_id");
			stmt = conn.prepareStatement("SELECT user_id, subject, content FROM REVIEW_BOARD "
					+ "WHERE review_id=?");
			stmt.setInt(1, Integer.parseInt(review_id));
			rs = stmt.executeQuery();
			
			if(rs.next()){
				subject = rs.getString("subject");
				content = rs.getString("content");
			}
	} catch (SQLException e){
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
	}%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<div id="main_content">
<form action="mychange.jsp" method="post">
	<div id="subject">
		제목 <input type="text" name="subject" size="85px" value='<%=subject%>'/>
	</div>
<div id="text">
		<textarea id="write" rows="15px" cols="85px" name="content">
		<%=content %>
		</textarea>
	</div>
	<div id="buttons">
		<input type="hidden" name="review_id" value='<%=review_id%>'>
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="history.back();"> 
	</div>
</form>
</div>
</body>
</html>