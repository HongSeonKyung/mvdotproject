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
	boolean disabled = false;
	boolean addpoint = false;//공감하기를 했는지 확인
	boolean repldisabled = false;
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		if (conn != null) {
			request.setCharacterEncoding("utf-8");
			review_id = request.getParameter("review_id"); //게시물 아이디만을 요청해서 가져온다.
			id = (String)session.getAttribute("id"); //로그인된 아이디를 가져오기!!
			//클릭한 게시글의 아이디로 제목, 내용, 날짜를 가져온다.
			stmt = conn.prepareStatement("SELECT user_id, subject, content, DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time, (SELECT nickname FROM users WHERE id=user_id) nickname, movie_title, movie_pubdate, movie_director, actor, movie_story, movie_img FROM REVIEW_BOARD "
							+ "WHERE review_id=?"); 
			stmt.setInt(1, Integer.parseInt(review_id));//게시물 아이디를 설정한다.
			rs = stmt.executeQuery();
			//조회수를 하나씩 증가시키기
			stmt = conn.prepareStatement("UPDATE review_board SET vote_cnt= vote_cnt + 1 WHERE review_id= ?");
			stmt.setInt(1, Integer.parseInt(review_id));
			stmt.executeUpdate();
			//댓글의 정보를 가져오기
			stmt = conn.prepareStatement("SELECT user_id, content, (SELECT nickname FROM users WHERE id=user_id) nickname, DATE_FORMAT(writetime, '%Y-%m-%d %H:%i') time, (SELECT star_point FROM star_points WHERE star_points.user_id=reply.user_id AND review_id=?) stars, comment_id FROM reply WHERE review_id=?");
			stmt.setInt(1, Integer.parseInt(review_id));
			stmt.setInt(2, Integer.parseInt(review_id));
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
			stmt.setString(2, id);
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
function delectclick(){
	alert("정말 글을 삭제하시겠습니까?");
	window.location = "deletewrite.jsp?review_id=" + <%=review_id%>;
}	
function delectreply(){
	alert("정말 댓글을 삭제하시겠습니까?");
}	
function loginAlert() {
	window.alert("로그인후 이용하실 수 있습니다.");
	window.open("login.jsp", "", "width=80, height=100,top=200px,left=400");
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
	<div id="main-content">
		<%
			while (rs.next()) {
				user_id = rs.getString("user_id");	
				out.print("<div id='submit'> 제목 : " + rs.getString("subject") + "</div>");
				out.print("<div> 작성자 :"  + rs.getString("nickname") + "</div>");
		%>
		<div id="write_style">
			<div class="image">
			<% 
				out.print("<img id='mov_img' src='" + rs.getString("movie_img") + "'/>");
			%>
			</div>
			<div class="information">
			<%
			out.print("<div id='mov_title'>" + rs.getString("movie_title") + "</div>");
			out.print("<div id='mov_tumbnail'>" + rs.getString("movie_pubdate") + "</div>");
			out.print("<div id='mov_director'>" + rs.getString("movie_director") + "</div>");
			out.print("<div id='mov_actor'>" + rs.getString("actor") + "</div>");
			out.print("<div id='mov_story'>" + rs.getString("movie_story") + "</div>");
			
			%>
			</div>
		</div>
		<%	
					out.print("<div id='text'>" + rs.getString("content") + "</div>");
					out.print("<div>" + rs.getString("time") + "</div>");
				}
		%>
		<form action="rewrite.jsp" method="post" class="form-actions">
		<div id="buttons">
		<% if(addpoint != true) {
		%>
			<input type="button" class="btn btn-inverse" name="vote" value="공감하기" style="cursor: hand;" onclick="javascript:addPoint()"/>
		<%} else { %>
			<input type="button" class="btn btn-danger" name="vote" value="공감취소" style="cursor: hand;" onclick="javascript:addPoint()"/>
		<%} %>
		<% //내가 쓴 글이면 수정과 취소 버튼 보이게하기...
			if(user_id.equals(id)){ 
			%>
				<input type="hidden" name="review_id" value='<%=review_id%>' >
				<input type="submit" name="change" value="수정" class="btn btn-primary">
				<input type="button" name="cancel" value="삭제" class="btn" onclick='javascript:delectclick()'>
		<%} %>
		</div>
		</form>
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
				comment_id = rs2.getString("comment_id");
				out.print("<div class='reply-actions'>");
				out.print("<span class='reply'>"+ "<b>" + rs2.getString("nickname") + "</b>" + "</span>"); 
				out.print("<span class='reply'>" +starString + "</sapn>"); 
				out.print("<span class='reply'>" + rs2.getString("content") + "</span>");
				user_id = rs2.getString("user_id");
				if(user_id.equals(id)){	%>
				<form class='del-btn' action="deletereply.jsp" method="post">
					<input type="hidden" name="comment_id" value='<%=comment_id%>'>			
					<input type="hidden" name="review_id" value='<%=review_id%>'>			
					<input type="submit" name="delete" value="삭제" class="btn btn-danger" onclick='javascript:delectreply()'>
				</form>
				<%
				}
					out.print("<div class='time'>");
					out.print("<span class='reply'>" + rs2.getString("time") + "</span>");
				  out.print("</div>");
					out.print("</div>");
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
	<div class="input-append">
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
			<%if (id == null){ 
				repldisabled = true;
			}
			%>
			<input type="text" class="span2" id="appendedInputButton" name="reply"> 
			<input <%
			if(repldisabled){%>
				type="button" class="btn" onclick="javascript:loginAlert()" value="댓글"
			<%} else {%>
				type="submit" class="btn btn-success" name="reply_register" value="댓글">
			<%} %> 
			<input type="hidden" name="review_id" value="<%=review_id%>">
		</form>
	</div>
	<div class="btn btn-link">
		<a href="allreview.jsp">목록으로</a>
	</div>
</div>	
<div>
	<jsp:include page="footer.jsp"></jsp:include>	
</div>
</div>
</body>
</html>