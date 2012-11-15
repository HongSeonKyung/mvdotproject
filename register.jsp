<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	
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
	
	if(pwd == null || pwd.trim().length() == 0){
		errorMsg.add("비밀번호는 6자 이상 입력해주세요.");
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
	
	if(errorMsg.size() == 0){
		try{
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("INSERT INTO USERS " + 
			"VALUES(?, ?, ?, ?, ?, ?)");
			stmt.setString(1, userid);
			stmt.setString(2, pwd);
			stmt.setString(3, name);
			stmt.setString(4, nickname);
			stmt.setString(5, facebook_id);
			stmt.setString(6, facebook_address);
			
			result = stmt.executeUpdate();
			if(result != 1){
				errorMsg.add("등록에 실패하였습니다.");
			}
		} catch(SQLException e){
			errorMsg.add("SQL 오류: " + e.getMessage());
		} finally{
			if(rs != null) try{rs.close();} catch(SQLException e){}
			if(stmt != null) try{stmt.close();} catch(SQLException e){}
			if(conn != null) try{conn.close();} catch(SQLException e){}
		}
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원가입감사</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	 <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
 <jsp:include page="header.jsp">
 	<jsp:param name="current" value="Login"/>
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
 		<b><%=nickname%></b> 님 등록해주셔서 감사합니다.
 	</div>
 	 	<div>
 		<a href="main.html">목록으로</a>
 	</div>
 	<%} %>
 </div>
	<jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>