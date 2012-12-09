<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null, stmt2 = null;
	ResultSet rs = null, rs2 = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			request.setCharacterEncoding("utf-8");
			//공감에 대한 best글 리스트
			stmt = conn.prepareStatement("SELECT R.review_id, (SELECT nickname FROM users WHERE id=R.user_id) nickname,"+
			"R.subject, COUNT(DISTINCT V.user_id) vote_point, R.vote_cnt, IFNULL(AVG(S.star_point),0) star_avg, DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time "+
					"FROM review_board R " +
					"LEFT JOIN star_points S ON R.review_id=S.review_id " + 
					"LEFT JOIN vote V ON R.review_id=V.review_id " + 
					"GROUP BY R.review_id " +
					"ORDER BY vote_point DESC LIMIT 3");
			rs = stmt.executeQuery();
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script type="text/javascript">
	function goPage(review_id){
		window.location="show.jsp?review_id=" + review_id; 
	}//게시물 아이디를 파라메터로 같이 넘기기!!!
	</script>
	</head>
	
		<jsp:include page="top.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
		  <div id="header" >
			
				<jsp:include page="slideshow.jsp">
		 		<jsp:param name="current" value="slide"/>
		 		</jsp:include>
			
		</div>
		<div id="menuBar">
			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
		</div>
		<div id="main">
			<div id="main-content">
				<div>
					<h4>Best 공감수 TOP 3</h4>
					<table class="table table-hover">
						<tbody>
							<tr>
								<td><strong>공감수</strong></td>
								<td><strong>추천별점</strong></td>
								<td><strong>제목</strong></td>
								<td><strong>조회수</strong></td>
								<td><strong>작성일</strong></td>
							</tr>
							<%
					while (rs.next()) {
						String starString = "";
						int i =0;
						//별점 보이게 하기
						for( i=0;i<rs.getDouble("star_avg");i++){
							starString += "★";
						}
						for(;i<5;i++){
							starString+="☆";
						}
						out.print("<tr>");
						out.print("<td>" + rs.getString("vote_point") + "</td>");
						out.print("<td>" + starString + "(" + rs.getDouble("star_avg") + ")" + "</td>");
						out.print("<td onclick='javascript:goPage("+rs.getInt("review_id")+");'>" + rs.getString("subject") + "</td>");
						out.print("<td>" + rs.getString("vote_cnt") + "</td>");
						out.print("<td>" + rs.getString("time") + "</td>");
						out.print("</tr>");
						}
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
				try {
					conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
					if (conn != null) {
						request.setCharacterEncoding("utf-8");
						//별점에 대한 best글 리스트
						stmt = conn.prepareStatement("SELECT R.review_id, (SELECT nickname FROM users WHERE id=R.user_id) nickname, "+
								"R.subject, COUNT(DISTINCT V.user_id) vote_point, R.vote_cnt, IFNULL(AVG(S.star_point),0) star_avg, " +
								"DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time " +
								"FROM review_board R " +
								"LEFT JOIN star_points S ON R.review_id=S.review_id " + 
								"LEFT JOIN vote V ON R.review_id=V.review_id " + 
								"GROUP BY R.review_id " +
								"ORDER BY star_avg DESC " + 
								"LIMIT 3; ");
						rs = stmt.executeQuery();
					}
			%>
							</tbody>
						</table>
					</div>
					<div>
						<h4>Best 별점 TOP 3</h4>
					<table class="table table-hover">
						<tbody>
							<tr>
								<td><strong>공감수</strong></td>
								<td><strong>추천별점</strong></td>
								<td><strong>제목</strong></td>
								<td><strong>조회수</strong></td>
								<td><strong>작성일</strong></td>
							</tr>
							<%
					while (rs.next()) {
						String starString = "";
						int i =0;
						//별점 보이게 하기
						for( i=0;i<rs.getDouble("star_avg");i++){
							starString += "★";
						}
						for(;i<5;i++){
							starString+="☆";
						}
						out.print("<tr>");
						out.print("<td>" + rs.getString("vote_point") + "</td>");
						out.print("<td>" + starString + "(" + rs.getDouble("star_avg") + ")" + "</td>");
						out.print("<td onclick='javascript:goPage("+rs.getInt("review_id")+");'>" + rs.getString("subject") + "</td>");
						out.print("<td>" + rs.getString("vote_cnt") + "</td>");
						out.print("<td>" + rs.getString("time") + "</td>");
						out.print("</tr>");
						}
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
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>		
	</body>
</html>