<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement stmt = null, stmt2 = null;
	ResultSet rs = null, rs2 = null, rs3 = null, rs4 = null;
	String review_id = null;
	String user_id = null;
	String id = null;
	String comment_id = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	
	
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			request.setCharacterEncoding("utf-8");
			review_id = request.getParameter("review_id"); //게시물 아이디만을 요청해서 가져온다.
			id = (String)session.getAttribute("id"); //로그인된 아이디를 가져오기!!
			//클릭한 게시글의 아이디로 제목, 내용, 날짜를 가져온다.
			stmt = conn.prepareStatement("SELECT user_id, subject, content, DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time, (SELECT nickname FROM users WHERE id=user_id) nickname FROM REVIEW_BOARD "
							+ "WHERE review_id=?"); 
			stmt.setInt(1, Integer.parseInt(review_id));//게시물 아이디를 설정한다.
			rs = stmt.executeQuery();
			
			//댓글의 정보를 가져오기
			stmt = conn.prepareStatement("SELECT user_id, content, (SELECT nickname FROM users WHERE id=user_id) nickname, DATE_FORMAT(writetime, '%Y-%m-%d %H:%i') time, (SELECT star_point FROM star_points WHERE star_points.user_id=reply.user_id AND review_id=?) stars, comment_id FROM reply WHERE review_id=?");
			stmt.setInt(1, Integer.parseInt(review_id));
			stmt.setInt(2, Integer.parseInt(review_id));
			rs2 = stmt.executeQuery();
			
			
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show review</title>
<link href="write.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">

</script>
</head>
<body>
<div id="wrap">
	<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
	</jsp:include>
	<jsp:include page="menubar.jsp">
		<jsp:param name="current" value="menubar" />
	</jsp:include>
	<div id="main_content">
		<%
			while (rs.next()) {
				user_id = rs.getString("user_id");	
				out.print("<div id='submit'> 제목 : " + rs.getString("subject") + "</div>");
				out.print("<div> 작성자 :"  + rs.getString("nickname") + "</div>");
		%>
		<div id="write_style">
			<div class="image"></div>
			<div class="information"></div>
		</div>
		<%	
					out.print("<div id='text'>" + rs.getString("content") + "</div>");
					out.print("<div>" + rs.getString("time") + "</div>");
				}
		%>
	</div>
	<% // 작성된 댓글 프린트 하기.
			while (rs2.next()) {
				String starString = "";
				int i =0;
				//별점 보이게 하기
				for( i=0;i<rs2.getInt("stars");i++){
					starString += "★";
				}
				for(;i<5;i++){
					starString+="☆";
				}
				//댓글 출력 
				out.print("<div>" + rs2.getString("nickname") + starString + ": " + rs2.getString("content") + "</div>");
				out.print("<div>" + rs2.getString("time") + "</div>");
				user_id = rs2.getString("user_id");
				comment_id = rs2.getString("comment_id");
		
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
			if (rs2 != null)
				try {
					rs2.close();
				} catch (SQLException e) {
				}
			if (rs3 != null)
				try {
					rs3.close();
				} catch (SQLException e) {
				}
			if (rs4 != null)
				try {
					rs4.close();
				} catch (SQLException e) {
				}
		}
	%>
	<div>

	</div>
	<div>
		<a href="master.jsp">목록으로</a>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</div>	
</body>
</html>