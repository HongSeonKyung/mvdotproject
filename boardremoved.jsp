<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String actionUrl;
  String errorMsg=null;
  int result =0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";
		request.setCharacterEncoding("utf-8");
		String review_id=null;
		review_id=request.getParameter("review_id");
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt=conn.createStatement();

			result = stmt.executeUpdate("DELETE FROM review_board WHERE review_id='"+review_id+"'");
			
			
			
			
		}catch(SQLException e){
				errorMsg="SQL에러: "+e.getMessage();
		}finally{
				if(rs!=null)try{rs.close();}catch(SQLException e){}
				if(stmt!=null)try{stmt.close();}catch(SQLException e){}
				if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>강제 삭제시키기 </title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	 <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
</head>
<body onload="refreshParent()">
 			<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
 <div class="container">

 	<div>
 		<div class="alert alert-success">
 		게시물을 삭제하였습니다. 
 		<a href="masterboardlist.jsp" >목록으로</a>
 	</div>
 	
 	</div>
	<jsp:include page="footer.jsp"></jsp:include> 
</div>
</body>
</html>