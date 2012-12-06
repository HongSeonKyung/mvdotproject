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
	
	String review_id = null;
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			int result = 0;
			request.setCharacterEncoding("utf-8");
			String keyword = request.getParameter("keyword");
			System.out.println(keyword);
			//review_board에서 글을 가져오고 최신글이 맨 위에 있게 배치
			stmt = conn.prepareStatement("SELECT R.review_id, (SELECT nickname FROM users WHERE id=R.user_id) nickname, " + 
					"R.subject, COUNT(DISTINCT V.user_id) vote_point, R.vote_cnt, IFNULL(AVG(S.star_point),0) star_avg, "+
					"DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time " +
					"FROM review_board R " +
					"LEFT JOIN star_points S ON R.review_id=S.review_id " + 
					"LEFT JOIN vote V ON R.review_id=V.review_id " + 
					"WHERE SUBJECT LIKE ? "+
					"GROUP BY R.review_id " +
					"ORDER BY review_id DESC");
			stmt.setString(1, "%"+keyword+"%");
			rs = stmt.executeQuery();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
	<link href="temp.css" type="text/css" rel="stylesheet"/>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript">
	function goPage(review_id){
		window.location="show.jsp?review_id=" + review_id; 
	}//게시물 아이디를 파라메터로 같이 넘기기!!!
	</script>
</head>
<body>
		<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
		</jsp:include>
		<div id="header">
			<jsp:include page="slideshow.jsp">
				<jsp:param name="current" value="slide" />
			</jsp:include>
		</div>
		<div id="menuBar">
			<jsp:include page="menubar.jsp">
				<jsp:param name="current" value="menubar" />
			</jsp:include>
		</div>

	<div id="main">	
		<table border="1" class="table table-striped">
			<tbody>
			<tr>
				<td><strong>공감수</strong></td>
				<td><strong>추천별점</strong></td>
				<td><strong>제목</strong></td>
				<td><strong>조회수</strong></td>
				<td><strong>날짜</strong></td>
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
						out.print("<td onclick='javascript:goPage("+rs.getInt("review_id")+");' style='cursor:hand;'>" + rs.getString("subject") + "</td>");
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
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>