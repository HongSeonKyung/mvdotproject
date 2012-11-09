<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
 <jsp:include page="joinpage/header.jsp"></jsp:include>
  <div class="container">
	<%	if (request.getMethod() == "POST") { %>
		 <div class="well">
		  <ul>
		   <li>아이디 : <%=request.getParameter("id")%></li>
		    <li>비밀번호 : <%=request.getParameter("pwd")%></li>
		     <li>비밀번호확인 : <%=request.getParameter("pwdcheck")%></li>
		    <li>이름 : <%=request.getParameter("name")%></li>
		    <li>닉네임 : <%=request.getParameter("subname")%></li>
		    <li>페이스북주소 : <%=request.getParameter("facebookaddress")%></li>
		    <li>E-mail : <%=request.getParameter("email")%></li>
	
		   
		    <li>메모 : <%=request.getParameter("memo")%></li>
	    </ul>
		 </div>
  <%} else { %>
    <div>
		  <h1>회원가입</h1>
		  <form class="form-horizontal" method="post">
			<fieldset>
				
				<div class="control-group">
					<label class="control-label" for="id">아이디</label>
					<div class="controls">
						<input type="text" placeholder="nanhee" name="id">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwd">비밀번호</label>
					<div class="controls">
						<input type="password" name="pwd">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="pwdcheck">비밀번호확인</label>
					<div class="controls">
						<input type="password" name="pwdcheck">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="name">이름</label>
					<div class="controls">
						<input type="text" placeholder="홍길동" name="name">
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="subname">닉네임</label>
					<div class="controls">
						<input type="text" placeholder="길동이" name="subname">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="facebookaddress">페이스북주소</label>
					<div class="controls">
						<input type="email" placeholder="www.facebook.com/abc123"name="facebookaddress">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="email">E-mail</label>
					<div class="controls">
						<input type="email" placeholder="hong@abc.com" name="email">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Memo</label>
					<div class="controls">
						<div class="textarea">
							<textarea name="memo"></textarea>
						</div>
					</div>
				</div>

				<div class="form-actions">
					<input type="submit" value="제출" class="btn btn-primary">
				</div>
			</fieldset>
		  </form>
    </div>
	<% } %>
  </div>
<jsp:include page="joinpage/footer.jsp"></jsp:include> 
</body>
</html>

