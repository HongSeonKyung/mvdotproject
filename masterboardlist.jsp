<%@page import="java.sql.Statement"%>
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
	Statement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	Class.forName("com.mysql.jdbc.Driver");
	// 페이지 설정
	int pageNo = 1;

	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {
	}

	int numInPage = 10; // 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; // 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages = 0;
	String review_id = null;

	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		if (conn != null) {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(*) FROM review_board");
			rs.next();
			numItems = rs.getInt(1);
			numPages = (int) Math.ceil((double) numItems
					/ (double) numInPage);

			
			int result = 0;
			request.setCharacterEncoding("utf-8");
			String id = (String) session.getAttribute("id"); //사용자 아이디
			review_id = request.getParameter("review_id");
			//review_board에서 글을 가져오고 최신글이 맨 위에 있게 배치
			String sql = "SELECT R.review_id, (SELECT nickname FROM users WHERE id=R.user_id) nickname, "
					+ "R.subject, COUNT(DISTINCT V.user_id) vote_point, R.vote_cnt, IFNULL(AVG(S.star_point),0) star_avg, "
					+ "DATE_FORMAT(writetime,'%Y-%m-%d %H:%i') time "
					+ "FROM review_board R "
					+ "LEFT JOIN star_points S ON R.review_id=S.review_id "
					+ "LEFT JOIN vote V ON R.review_id=V.review_id "
					+ "GROUP BY R.review_id "
					+ "ORDER BY review_id DESC " 
					+ "LIMIT " + startPos + ", " + numInPage;
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			// users 테이블: user 수 페이지수 개산
			
			

		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	function goPage(review_id) {
		window.location = "masterboardshow.jsp?review_id=" + review_id;
	}//게시물 아이디를 파라메터로 같이 넘기기!!!
	function del(review_id) {
		window.location.href("boardremoved.jsp?review_id=" + review_id);
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
		<div id="mastermenubar">
			<a href="masterboardlist.jsp" class="btn" type="button">게시글 관리</a> <a
				href="masteruserlist.jsp" class="btn" type="button">회원 관리</a>
		</div>
		<div class="container">


			<table class="table table-bordered table-stripped">
				<tbody>
				<thead>
					<tr>
						<th>삭제</th>
						<th>공감수</th>
						<th>추천별점</th>
						<th>제목</th>
						<th>조회수</th>
						<th>날짜</th>

					</tr>
					<%
						while (rs.next()) {
								String starString = "";
								int i = 0;
								//별점 보이게 하기
								for (i = 0; i < rs.getDouble("star_avg"); i++) {
									starString += "★";
								}
								for (; i < 5; i++) {
									starString += "☆";
								}
								out.print("<tr>");
					%><td><input type="button" value="삭제"
						onClick="del('<%=rs.getString("review_id")%>');"></td>
					<%
						out.print("<td>" + rs.getString("vote_point") + "</td>");
								out.print("<td>" + starString + "("
										+ rs.getDouble("star_avg") + ")" + "</td>");
								out.print("<td onclick='javascript:goPage("
										+ rs.getInt("review_id")
										+ ");' style='cursor:hand;'>"
										+ rs.getString("subject") + "</td>");
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
				</thead>
				</tbody>
			</table>
			<div class="pagination pagination-centered">
				<ul>
					<%
						// 페이지 네비게이션을 위한 준비
						int startPageNo, endPageNo;
						int delta = 5;
						startPageNo = (pageNo <= delta) ? 1 : pageNo - delta;
						endPageNo = startPageNo + (delta * 2) + 1;

						if (endPageNo > numPages) {
							endPageNo = numPages;
						}

						// 이전 페이지로
						if (pageNo <= 1) {
					%>
					<li class="disabled"><a href="#">&laquo;</a></li>
					<%
						} else {
					%>
					<li>&laquo;</li>
					<%
						}

						// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
						String className = "";
						for (int i = startPageNo; i <= endPageNo; i++) {
							className = (i == pageNo) ? "active" : "";
							out.println("<li class='" + className + "'>");
							out.println("<a href='masterboardlist.jsp?page=" + i + "'>" + i
									+ "</a>");
							out.println("</li>");
						}

						// 다음 페이지로
						if (pageNo >= numPages) {
					%>
					<li class="disabled"><a href="#">&raquo;</a></li>
					<%
						} else {
					%>
					<li><a href="masterboardlist.jsp?page=<%=pageNo + 1%>">&raquo;</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>