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
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			if (conn != null) {
				request.setCharacterEncoding("utf-8");
				String review_id = request.getParameter("review_id"); //게시물 아이디만을 요청해서 가져온다.
				stmt = conn.prepareStatement("SELECT subject, content, DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time FROM REVIEW_BOARD " + 
						"WHERE review_id=?"); //클릭한 게시글의 아이디로 제목, 내용, 날짜를 가져온다.
				stmt.setInt(1, Integer.parseInt(review_id));//게시물 아이디를 설정한다.
				rs = stmt.executeQuery();
			}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show review</title>
<script type="text/javascript">
	function add(){
	}
</script>
</head>
<body>
<jsp:include page="top.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
 <jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
	<%
					while (rs.next()) {
						out.print("<div>" + rs.getString("subject") + "</div>");
						out.print("<div>" + rs.getString("time") + "</div>");
						out.print("<div>" + rs.getString("content") + "</div>");
					}
	%>
			<div>
				<input type="button" name="vote" value="공감하기" onclick="javascript:add()" style="cursor: hand;"/>
			</div>	
		<div>
			<a href="allreview.jsp">목록으로</a>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%			 
		}catch (SQLException e) {
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
</body>
</html>