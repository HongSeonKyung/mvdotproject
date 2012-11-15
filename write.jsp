<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>	
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
</head>
<body>
 <jsp:include page="header.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
 <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
 	try{
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if(conn != null){
			int result = 0;
			request.setCharacterEncoding("utf-8");
			//int review_id = Integer.parseInt(request.getParameter("review_id"));
			String id = request.getParameter("id"); //사용자 아이디
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
		
			stmt = conn.prepareStatement("INSERT INTO REVIEW_BOARD(review_id, user_id,subject) "+ "VALUES(?, ?, ?)");
			stmt.setInt(1, 1);
			stmt.setString(2, "test");
			stmt.setString(3, subject);
	//		stmt.setString(4, content);
			
			result = stmt.executeUpdate();
			
			
			if(result != 0){
				stmt = conn.prepareStatement("SELECT * FROM REVIEW_BOARD WHERE SUBJECT = ?");
				stmt.setString(1, subject);
				rs = stmt.executeQuery();
				while(rs.next()){
					out.print(rs.getString("subject"));
				}
			}
		}
	} catch(SQLException e){
			e.printStackTrace();
	} finally{
		if(rs != null) try{rs.close();} catch(SQLException e){}
		if(stmt != null) try{stmt.close();} catch(SQLException e){}
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}
 %>
	<div>
		 <a href="main.html">목록으로</a>
	</div> 
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>