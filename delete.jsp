<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	
	String actionUrl;
  String errorMsg=null;
  int result =0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";
		request.setCharacterEncoding("utf-8");
		String id=null;
		
		try {
			if(session.getAttribute("id") == null) {
				id = "";
			} else {
				id = (String)session.getAttribute("id");
			}
		} catch (Exception e) {
			id = "";
		}try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt=conn.prepareStatement("DELETE FROM users WHERE id=?");
			stmt.setString(1, id);
			result = stmt.executeUpdate();
			if(result!=1){
				errorMsg="삭제에 실패했습니다.";
			}
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
	<title>탈퇴되었습니다.</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	 <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrap">
 			<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
 <div class="container">
 <% if(errorMsg!=null){%>
 <div class="alert alert-error">
 	<h3>오류:</h3>
 	 <%=errorMsg%>
 	</div>
 	<%}else{ %>
 	<div>
 		<div class="alert alert-success">
 		사용자 정보를 삭제하였습니다. 
 	</div>
 	<%}%>
 	<div class ="form-action">
 		<a href="main.jsp">목록으로</a>
 	</div>
 </div>
	<jsp:include page="footer.jsp"></jsp:include> 
</div>
</body>
</html>