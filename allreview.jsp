<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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
	
	boolean disabled = false;
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			request.setCharacterEncoding("utf-8");
			String id = (String) session.getAttribute("id"); 
			//로그인이 안되어있으면 null값이다.
			if(id == null){
				//로그인이 안되있으면 글을 못쓰게 한다.
				disabled = true;
			}
		}
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>모든 리뷰</title>
	<link href="temp.css" type="text/css" rel="stylesheet"/>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript">
		function writeAlert(){
			window.alert("로그인후 이용하실 수 있습니다.");
			window.open("login.jsp", "","width=80, height=100,top=200px,left=400"); 
		}
	</script>
</head>
<body>
	<div id = "wrap">
		<jsp:include page="top.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
 		
		<div id="header" >
			<form class="navbar-form pull-left">
				<jsp:include page="slideshow.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
			</form>
		</div>
		<div id="menuBar">
			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
		</div>
		<div id="main">
		<form action="write.html" method=post>
			<div>
				<input name="board_write" value="글작성" 
				<%//만약 로그인이 안되어 있으면 writeAlert을 호출한다.
					if(disabled){%>
						tyep="button"
						onclick="javascript:writeAlert()"
					<%} else {//로그인이 되어있으면 write.html로 이동%>
						type="submit"
					<%} %>
					>					
			</div>
		</form>	
		<jsp:include page="boardlist.jsp">
			<jsp:param name="current" value="view" />
		</jsp:include>
		</div>
		<%
	} catch (SQLException e) {
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
					}	
				%>
		<div id="footer">
		회사소개 | copyright | 유해게시물신고 | 문의하기
		</div>
	</div><br>
</body>
</html>