<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";
	
	// 페이지 설정
	int pageNo = 1;
	
	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {}
	
	int numInPage = 10;												// 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;
	
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>	
	<script type="text/javascript">

		 function del(id){ 
				window.location.href("userremoved.jsp?id="+id); 
			 }
 </script>
<div id = "wrap">
<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
 
	 		 <div id="mastermenubar">
	 <a href="masterboardlist.jsp"class="btn" type="button">게시글 관리</a>
 	<a href="masteruserlist.jsp" class="btn" type="button" >회원 관리</a>
	 	 	</div>
  	<div class="container">
 	<%
 	try {
	    Class.forName("com.mysql.jdbc.Driver");

	    // DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
 		
		stmt = conn.createStatement();
		
		// users 테이블: user 수 페이지수 개산
 		rs = stmt.executeQuery("SELECT COUNT(*) FROM users");
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double)numItems / (double)numInPage);
		rs.close();
		stmt.close();
		
 		// users 테이블 SELECT
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM users ORDER BY id LIMIT " + startPos + ", " + numInPage);
		
 	%>
 		<div class="row">
			<div class="span12 page-info">
				<div class="pull-left">
					총 <b><%=numItems %></b> 명 
				</div>
				<div class="pull-right">
					<b><%= pageNo%></b> page / total <b><%= numPages %></b> pages
				</div>
 			</div>
 		</div>
 		
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
				<th>삭제</th>
				<th>id</th>	
				<th>name</th>	
				<th>nickname</th>	
				<th>facebook_id</th>	
				<th>facebook_address</th>	
								
				</tr>
			</thead>
			<tbody>
		<%
		while(rs.next()){
		%>
				<tr>
				<td><input type="button" value="삭제" onClick="del('<%=rs.getString("id") %>');"></td>
				<td><%=rs.getString("id") %></td>	
					<td><%=rs.getString("name") %></td>	
					<td><%=rs.getString("nickname") %></td>	
						<td><%=rs.getString("facebook_id") %></td>
						<td><%=rs.getString("facebook_address") %></td>					
				</tr>
			<%} %>
			</tbody>
		</table>
		
		


		<div class="pagination pagination-centered">
      <ul>
      	<%
      	// 페이지 네비게이션을 위한 준비
      	int startPageNo, endPageNo;
      	int delta = 5;
      	startPageNo = (pageNo <= delta) ? 1: pageNo - delta;
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
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='index.jsp?page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="index.jsp?page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
		<%
		} catch (SQLException e) {
			// SQL 에러의 경우 에러 메시지 출력
			out.print("<div class='alert'>" + e.getLocalizedMessage() + "</div>");
		}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		%>
			
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>