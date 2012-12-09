<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>아이디/ 비밀번호 찾기</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
 <jsp:include page="header.jsp">
 	<jsp:param name="current" value="Login"/>
 	</jsp:include>
 	<br><br>
 	비밀번호를 메일로 전송하였습니다.
 	
 
 	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>