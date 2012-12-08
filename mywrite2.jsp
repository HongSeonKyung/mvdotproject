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
	String review_id = null;
	String user_id = null;
	String id = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	boolean disabled = false;
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			request.setCharacterEncoding("utf-8");
			review_id = request.getParameter("review_id"); //게시물 아이디만을 요청해서 가져온다.
			stmt = conn.prepareStatement("SELECT subject, content FROM REVIEW_BOARD "
							+ "WHERE review_id=?"); //클릭한 게시글의 아이디로 제목, 내용를 가져온다.
			System.out.println(review_id);
			stmt.setInt(1, Integer.parseInt(review_id));
			rs = stmt.executeQuery();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show review</title>
<link href="write.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
function delectclick(){
	alert("정말 삭제하시겠습니까?");
	window.location = "deletemywrite.jsp?review_id=" + <%=review_id%>;
}	
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
					out.print("<div id='submit'>" + rs.getString("subject") + "</div>");
		%>
		<div id="write_style">
			<div class="image"></div>
			<div class="information"></div>
		</div>
		<%
					out.print("<div id='text'>" + rs.getString("content") + "</div>");
			}
		%>
			<form action="myrewrite.jsp" method="post">
		<div id="buttons">
	
			<input type="hidden" name="review_id" value='<%=review_id%>'>
			<button type="submit" class="btn btn-primary" value="수정" style="cursor: hand;">수정</button>
			<input type="button" class ="btn" name="cancel" value="삭제" style="cursor: hand;" onclick='javascript:delectclick()'>
			</div>
		</form>
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
	<div>
		<a href="mywrite.jsp">목록으로</a>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</div>	
</body>
</html>