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
			stmt = conn.prepareStatement("SELECT user_id, subject, content, movie_title, movie_pubdate, movie_director, actor, movie_story, movie_img FROM REVIEW_BOARD "
					+ "WHERE review_id=?");
			stmt.setInt(1, Integer.parseInt(review_id));
			rs = stmt.executeQuery();
			
			if(rs.next()){
				subject = rs.getString("subject");
				content = rs.getString("content");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
	</jsp:include>
		<div id="menuBar">
		<jsp:include page="menubar.jsp">
			<jsp:param name="current" value="menubar" />
		</jsp:include>
		</div>
<div id="main_content">
<form action="mychange.jsp" method="post">
	<div id="subject">
		제목 <input type="text" name="subject" size="85px" value='<%=subject%>'/>
	</div>
	<div id="write_style">
			<div class="image">
			<% 
				out.print("<img id='mov_img' src='" + rs.getString("movie_img")  + "'/>");
			%>
			</div>
			<div class="information">
			<%
				out.print("<div id='mov_title'>" + rs.getString("movie_title") + "</div>");
				out.print("<div id='mov_tumbnail'>" + rs.getString("movie_pubdate") + "</div>");
				out.print("<div id='mov_director'>" + rs.getString("movie_director") + "</div>");
				out.print("<div id='mov_actor'>" + rs.getString("actor") + "</div>");
				out.print("<div id='mov_story'>" + rs.getString("movie_story") + "</div>");
			%>
			</div>
	</div>
	<div id="text">
		<textarea id="write" rows="3" name="content" cols="30px"><%=content %>
		</textarea>
	</div>
	<div id="buttons">
		<input type="hidden" name="review_id" value='<%=review_id%>'>
		<input type="submit" class="btn btn-primary" value="수정">
		<input type="button" class="btn" value="취소" onclick="history.back();"> 
		<%			}
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
	</div>
</form>
</div>
</body>
</html>