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
	PreparedStatement stmt = null;
	ResultSet rs = null, rs2 = null, rs3 = null, rs4 = null;
	String review_id = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	boolean disabled = false;
	boolean addpoint = false;//공감하기를 했는지 확인
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			request.setCharacterEncoding("utf-8");
			review_id = request.getParameter("review_id"); //게시물 아이디만을 요청해서 가져온다.
			stmt = conn.prepareStatement("SELECT subject, content, DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time FROM REVIEW_BOARD "
							+ "WHERE review_id=?"); //클릭한 게시글의 아이디로 제목, 내용, 날짜를 가져온다.
			stmt.setInt(1, Integer.parseInt(review_id));//게시물 아이디를 설정한다.
			rs = stmt.executeQuery();
			//조회수를 하나씩 증가시키기
			stmt = conn.prepareStatement("UPDATE review_board SET vote_cnt= vote_cnt + 1 WHERE review_id= ?");
			stmt.setInt(1, Integer.parseInt(review_id));
			stmt.executeUpdate();
			//댓글의 정보를 가져오기
			stmt = conn.prepareStatement("SELECT user_id, content, (SELECT nickname FROM users WHERE id=user_id) nickname, DATE_FORMAT(writetime, '%Y-%m-%d %H:%i') time, (SELECT star_point FROM star_points WHERE star_points.user_id=reply.user_id AND review_id=?) stars FROM reply WHERE review_id=?");
			stmt.setInt(1, Integer.parseInt(review_id));stmt.setInt(2, Integer.parseInt(review_id));
			rs2 = stmt.executeQuery();
			//별점을 한번 등록했으면 그 다음부터는 등록 못하게 하기
			stmt = conn.prepareStatement("SELECT * FROM star_points WHERE user_id=? AND review_id=?");
			stmt.setString(1, (String)session.getAttribute("id"));
			stmt.setInt(2, Integer.parseInt(review_id));
			rs3 = stmt.executeQuery();
			while(rs3.next()){
				disabled = true;
			}
			//공감을 했는지 안했는지 알기..
			stmt = conn.prepareStatement("SELECT * FROM vote WHERE review_id=? AND user_id=?");
			stmt.setInt(1, Integer.parseInt(review_id));
			stmt.setString(2, (String)session.getAttribute("id"));
		  rs4 = stmt.executeQuery();
			while(rs4.next()){
				addpoint = true;
			}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show review</title>
<link href="write.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
function addPoint(){
	//이미공감을 했을때
	<%if(addpoint){%>
		alert("공감을 취소하시겠습니까?");
		window.location = "updatevote.jsp?review_id=" + <%=review_id%>;
	<%} else { //아직 공감을 안했을때%>
		alert("공감을 하나 추가하셨습니다.");		
		window.location = "updatevote.jsp?review_id=" + <%=review_id%>;
	<%}%>
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
					out.print("<div>" + rs.getString("time") + "</div>");
				}
		%>
		<div id="buttons">
		<% if(addpoint != true) {%>
			<input type="button" name="vote" value="공감하기" style="cursor: hand;" onclick="javascript:addPoint()"/>
		<%} else { %>
			<input type="button" name="vote" value="공감취소" style="cursor: hand;" onclick="javascript:addPoint()"/>
		<%} %>
		</div>
	</div>
	<%
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
		}
	%>
	<div>
		<form action="comment.jsp" method="post">
			<select name="star" size=1 class="stars" <%
			if(disabled){
				out.print("disabled");
			}
			%>>
			<%if(disabled){%>
				<option value="0">★★★★★</option>
				<option value="0">★★★★☆</option>
				<option value="0">★★★☆☆</option>
				<option value="0">★★☆☆☆</option>
				<option value="0">★☆☆☆☆</option>
			<%} else if(disabled == false){%>
				<option value="5">★★★★★</option>
				<option value="4">★★★★☆</option>
				<option value="3">★★★☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="1">★☆☆☆☆</option>
			<%} %>
			</select> 
			<input type="text" name="reply" size="80px"> 
			<input type="submit" name="reply_register" value="댓글"> 
			<input type="hidden" name="review_id" value="<%=review_id%>"/>
		</form>
	</div>
	<div>
		<a href="allreview.jsp">목록으로</a>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</div>	
</body>
</html>