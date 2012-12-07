<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String errorMsg=null;
 	String actionUrl=null;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/mvdot";
	String dbUser = "mvtest";
	String dbPassword = "mv541830";

	String password="";
	String name = "";
	String nickname = "";
	String facebook_id = "";
	String facebook_address = "";
	
	String id;
	try {
		if(session.getAttribute("id") == null) {
			id = "";
		} else {
			id = (String)session.getAttribute("id");
		}
	} catch (Exception e) {
		System.out.println(e);
		id = "";
	}if(id!=null){
		actionUrl="update.jsp";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	 		// 질의 준비
			stmt = conn.prepareStatement("SELECT PASSWORD,NAME, NICKNAME,FACEBOOK_ID, FACEBOOK_ADDRESS FROM USERS WHERE ID= ?");
		  stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			// 수행
	    while(rs.next()) {
				password=rs.getString("password");
				name=rs.getString("name");
				nickname=rs.getString("nickname");
				facebook_id=rs.getString("facebook_id");
				facebook_address=rs.getString("facebook_address");
				}
		}catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
			System.out.println(errorMsg);
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}	
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수정페이지</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="temp.css" type="text/css" rel="stylesheet"/>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function checkPwd(){
		if (frm.pwd.value != frm.pwdchk.value){
			alert("비밀번호가 같지 않습니다.");
			frm.pwdchk.value="";
		}
	}
	function returnPage(){
		window.location="main.jsp"
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
 			
 			<ul class="nav nav-tabs">
  <li><a href="mypage.jsp">마이페이지</a></li>
 <li class="active"><a href ="repairmypage.jsp?id<%=id%>">수정</a></li>
  <li><a href ="delete2.jsp?id">탈퇴</a></li>
  <li><a href ="mywrite.jsp?id<%=id%>">내가 쓴 글 확인하기</a></li>
  </ul>
 			
  <div class="container">
    <div>
		 <h3>수정</h3>
     <form name="frm" class="form-horizontal" action="<%=actionUrl%>" method="post">
			<fieldset>
	   	 <table>
	   	 <tbody>
  	  	<tr>
        	<th colspan="2" class="title"><div><label>기본 정보</label></div></th>
    		</tr>
		    <tr>
					<th><label for="name">비밀번호</label></th>
					<td><input type="password" id="pwd" name="pwd" value="<%=password%>"/>
							<p style="font-size:9pt; color:red;">비밀번호는 6~20자로 되어야 합니다.</p>
					</td>
				</tr>		
				<tr>
					<th><label for="name">비밀번호확인</label></th>
					<td><input type="password" id="pwdchk" name="pwdchk" onblur="javascript:checkPwd();" value="<%=password%>"/>
							<p style="font-size:9pt; color:red;">비밀번호를 동일하게 입력하세요.</p>
					</td>
				</tr>			
 				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input type="text" id="name" name="name" value="<%=name%>" />
					</td>
				</tr>
 				<tr>
					<th><label for="name">닉네임</label></th>
					<td>
						<input type="text" name="nickname" value="<%=nickname%>"/>
						<p style="font-size:9pt; color:red;">*닉네임은 2~20자 이내여야 합니다.</p>
					</td>
				</tr>
 				<tr>
					<th><label for="name">페이스북 아이디</label></th>
					<td>
						<input type="text" name="facebook_id" value="<%=facebook_id%>"/>
						<p style="font-size:9pt; color:red;">페이스북주소는 비밀번호 변경이나 찾기 등에 사용됩니다.</p>
					</td>
				</tr>
 				<tr>
					<th><label for="name">페이스북 주소</label></th>
					<td>
						<input type="text" name="facebook_address" value="<%=facebook_address%>"/>
						<p style="font-size:9pt; color:red;">홈페이지가 있을 경우 입력해주세요.</p>
					</td>
				</tr>				
 				<tr>        
 					<th class="button" colspan="2">
 							<input type="submit" value="수정" > 
 							<input type="button" value="취소" onclick="history.back()">
 				</th>
 				</tr>
 				</tbody>
 				</table>
 			</fieldset>
		</form>
    </div>
  </div>
  <hr><br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

