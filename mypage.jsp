<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String errorMsg=null;
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
		String name="";
		String nickname="";
		String facebook_id="";
		String facebook_address="";
				try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				stmt = conn.prepareStatement("SELECT NAME, NICKNAME,FACEBOOK_ID, FACEBOOK_ADDRESS FROM USERS WHERE ID= ?");
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				if(rs.next()){

					name=rs.getString("name");
					nickname=rs.getString("nickname");
					facebook_id=rs.getString("facebook_id");
					facebook_address=rs.getString("facebook_address");
				}
			}
			catch (SQLException e){
				errorMsg = "SQL ERROR : "+e.getMessage();
				System.out.println(errorMsg);
			}	finally{
				if(rs!=null)try{rs.close();} catch(SQLException e){}
				if(stmt!=null)try{stmt.close();} catch(SQLException e){}
				if(conn!=null)try{rs.close();} catch(SQLException e){}
			}
		

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>my page</title>
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
 
 <h3> 님 환영합니다.</h3>
 <div class ="form-actions">
  <a href="mypage.jsp">마이페이지</a>
  <a href ="repairmypage.jsp?id<%=id%>">수정</a>
  <a href ="delete.jsp?id<%=id%>">삭제</a>
  <a href ="mywrite.jsp?id<%=id%>">내가 쓴 글 확인하기</a>
  
 </div>
 <div>
 	<ol>
 		<li> 아이디 :<%=id%></li>
 		<li> 이름 :<%=name%></li>
 		<li> 닉네임 :<%=nickname%></li>
 		<li> 페이스북 아이디 :<%=facebook_id %></li>
 		<li> 페이스북 주소 :<%=facebook_address%></li>
 	</ol>
 </div>
 
 <jsp:include page="footer.jsp"></jsp:include>
 </div>
</body>
</html>