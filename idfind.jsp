<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디/ 비밀번호 찾기</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
	<style>
	#findmenubar{float:left;}
	#findmenubar ul li a{
		color: #000; background-color:#66A1D2;
		display:block;
		text-align:center;
		padding:5px 0px;
		width: 120px;
		margin-right:1px;
		text-decoration:none;
}
	</style>
</head>
<body>
 <jsp:include page="header.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
 
 
 <div id="findmenuBar">
			<ul>
			<li><a href="idfind.jsp" class="selected">아이디 찾기</a></li>
			 <li><a href="pwdfind.jsp">비밀번호 찾기</a></li>
			</ul>	
</div>

<div id="findline">
	<div id="idfind">
		<table border="1">
			<h1><b>이름&닉네임으로 찾기</b></h1><br>
			가입하셨던 이름과 닉네임을 아래에 입력해 주세요.
			<hr>
			이름 : <input type="text" name="name">
			닉네임 : <input type="text" name="nikname">
		</table>
	</div>
</div>
<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
