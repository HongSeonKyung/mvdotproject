<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String review_id = null;
	boolean addpoint = false;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
		  request.setCharacterEncoding("utf-8");
			 review_id = request.getParameter("review_id"); //게시물 아이디만을 요청해서 가져온다.
				stmt = conn.prepareStatement("SELECT * FROM vote WHERE review_id=? AND user_id=?");
				stmt.setInt(1, Integer.parseInt(review_id));
				stmt.setString(2, (String)session.getAttribute("id"));
			  rs = stmt.executeQuery();
				while(rs.next()){
					addpoint = true;
				}
				// 공감하기를 안했다면 공감수 추가됨
			 if(addpoint == false){	 
					//vote테이블에 데이터 삽입
				 stmt = conn.prepareStatement("INSERT INTO VOTE(review_id, user_id) VALUE(?,?)");
				 stmt.setInt(1, Integer.parseInt(review_id));
				 stmt.setString(2, (String)session.getAttribute("id"));
				 stmt.executeUpdate(); 
			 } else {
				 stmt.close();
				 stmt = conn.prepareStatement("DELETE FROM vote WHERE review_id= ? AND user_id=?");
				 stmt.setInt(1, Integer.parseInt(review_id));
				 stmt.setString(2, (String)session.getAttribute("id"));
				 stmt.executeUpdate();
			 }
		} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공감추가</title>
	<link href="temp.css" type="text/css" rel="stylesheet"/>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<% 
	} catch (SQLException e) {
		
	} finally {
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
		response.sendRedirect("show.jsp?review_id=" + review_id);
	}
%>
</body>
</html>