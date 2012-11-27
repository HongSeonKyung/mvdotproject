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
	<style>
	#findmenubar{float:left;}
	#findmenubar ul li {
		color: #000; background-color:#66A1D2;
		display:block;
		text-align:center;
		padding:5px 0px;
		width: 120px;
		margin-right:1px;
		text-decoration:none;
		list-style: none;
	}
	</style>
</head>
<body>
<div id="wrap">
 <jsp:include page="top.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
 <jsp:include page="menubar.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
 <div id="findmenuBar">
			<ul>
			<li><a href="idfind.jsp" class="selected">아이디 찾기</a></li>
			 <li><a href="pwdfind.jsp">비밀번호 찾기</a></li>
			</ul>	
</div>

<form action="idfinder.jsp" method="post">
	<div >
		
			<h1><b>아이디  찾기</b></h1><br>
			가입하셨던 이름과 닉네임을 아래에 입력해 주세요.
			<hr>
			이름 : <input type="text" name="name">
			닉네임 : <input type="text" name="nickname">
			<input type="submit" value="찾기">
		
	</div>
</form>
 	
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
