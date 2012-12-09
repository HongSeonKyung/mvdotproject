<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디/ 비밀번호 찾기</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="temp.css" type="text/css" rel="stylesheet"/>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>

 <jsp:include page="top.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
 <jsp:include page="menubar.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
<ul class="nav nav-tabs">
			
			 <li class="active"><a href="idfind.jsp" >아이디 찾기</a></li>
			 <li><a href="pwdfind.jsp">비밀번호 찾기</a></li>
			</ul>	


<form action="idfinder.jsp" method="post">
	<div >
		
			<h1>아이디  찾기</h1><br>
			가입하셨던 이름과 닉네임을 아래에 입력해 주세요.
			<hr>
			이름 : <input type="text" name="name">
			닉네임 : <input type="text" name="nickname">
			<input type="submit" value="찾기">
		
	</div>
</form>
 	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
