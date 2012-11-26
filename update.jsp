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
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
		String dbUser = "mvtest";
		String dbPassword = "mv541830";
		
		String id;
		
		try {
			if(session.getAttribute("id") == null) {
				id = "";
			} else {
				id = (String)session.getAttribute("id");
			}
		} catch (Exception e) {
			id = "";
		}
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String facebook_id = request.getParameter("facebook_id");
		String facebook_address = request.getParameter("facebook_address");
		
		List<String> errorMsg = new ArrayList<String>();
		int result = 0;
	
		if(userid == null || userid.trim().length() == 0){
			errorMsg.add("아이디를 반드시 입력해주세요.");
		}
		
	
		if(name == null || name.trim().length() == 0){
			errorMsg.add("이름을 반드시 입력해주세요.");
		}
		
		if(nickname == null || nickname.trim().length() == 0){
			errorMsg.add("닉네임을 반드시 입력해주세요.");
		}
		
		if(facebook_id == null || facebook_id.trim().length() == 0){
			errorMsg.add("페이스북 아이디를 반드시 입력해주세요.");
		}
		
		if(facebook_address == null || facebook_address.trim().length() == 0){
			errorMsg.add("페이스북 주소를 반드시 입력해주세요.");
		}
		if(errorMsg.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"UPDATE users " +
					"SET  name=?, nickname=?, facebook_id=?, facebook_address=?" +
					"WHERE id=?"
					);
		
			stmt.setString(1, name);
			stmt.setString(2, nickname);
			stmt.setString(3, facebook_id);
			stmt.setString(4, facebook_address);
			stmt.setString(5, id);
			
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsg.add("변경에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsg.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원가입감사</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="temp.css" type="text/css" rel="stylesheet"/>
	 <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div id = "wrap">
 			<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
 <div class="container">
 <% if(errorMsg.size() > 0){%>
 <div class="alert alert-error">
 	<h3>오류:</h3>
 	<ul>
 		<% for(String msg: errorMsg){ %>
 			<li><%=msg%></li>
 			<%} %>
 	</ul>
 	</div>
 	<div>
 		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
 	</div>
 	<%} else if(result == 1){%>
 	<div>
 		<b><%=nickname%></b> 님 수정되었습니다.
 	</div>
 	 	<div>
 		<a href="main.jsp">목록으로</a>
 	</div>
 	<%} %>
 </div>
	<jsp:include page="footer.jsp"></jsp:include> 
</div>
</body>
</html>