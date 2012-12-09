<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;

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
			if (id == null) {
				//로그인이 안되있으면 글을 못쓰게 한다.
				disabled = true;
			}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
	</jsp:include>
	<div id="header">
		<jsp:include page="slideshow.jsp">
			<jsp:param name="current" value="top" />
		</jsp:include>
	</div>
	<div id="menuBar">
		<div id="navbar" class="navbar navbar-inverse" style="position:static;">
			<div class="navbar-inner">
			<div class="container">
			<a class="brand" href="main.jsp">HOME</a>
		<div class="nav-collapse collapse navbar-inverse-collapse">
				<ul class="nav">
					
					<li class="active"><a href="allreview.jsp">모든영화리뷰</a></li>
					<li ><a href="nowreview.jsp" >이번달영화리뷰</a></li>	
				</ul>
		
			</div>
		</div>		
</div>
</div>


	</div>
	<div id="main">
		<form action="writereview.jsp" method=post>
			<div>
				<input name="board_write" value="글작성" class="btn btn-large"
					<%//만약 로그인이 안되어 있으면 writeAlert을 호출한다.
				if (disabled) {%>
					type="button" onclick="javascript:writeAlert()"
					<%} else {//로그인이 되어있으면 write.html로 이동%> type="submit"<%}%>>
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
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	%>
	</body>
</html>