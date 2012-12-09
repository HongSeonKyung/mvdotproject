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
 
 <h3> <%=name%>님 환영합니다.</h3>

 <ul class="nav nav-tabs">
  <li class="active"><a href="mypage.jsp">마이페이지</a></li>
 	<li> <a href ="repairmypage.jsp?id<%=id%>">수정</a></li>
  <li><a href ="delete2.jsp?id">탈퇴</a></li>   
  <li><a href ="mywrite.jsp?id<%=id%>">작성한 글</a></li>
   <li><a href ="myreply.jsp?id<%=id%>">작성한 댓글</a></li>
  </ul>
 
 <div>
 <table class="table table-bordered">
 <thead>
 	<tr>
 		<th></th>
 		<th>내 정보</th>
 	</tr>
 	</thead>
	 		<tbody>
	 		<tr>
	 		<td>아이디 </td>
	 		<td><%=id%></td>
	 		</tr>
	 		<tr>
	 		<td>이름 </td>
	 		<td><%=name%></td>
	 		</tr>
	 		<tr>
	 		<td>닉네임</td> 
	 		<td><%=nickname%></td>
	 		</tr>
	 		<tr>
	 		<td> 페이스북 아이디 </td>
	 		<td><%=facebook_id %></td>
	 		</tr>
	 		<tr>
	 		<td> 페이스북 주소 </td>
	 		<td><%=facebook_address%></td>
	 		</tr>
 	</tbody>
 	</table>
 </div>
 
 <jsp:include page="footer.jsp"></jsp:include>
 </div>
</body>
</html>