<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
	
		String id=null;
		
		
	%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>my page</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="temp.css" type="text/css" rel="stylesheet"/>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
</head>
<body>
<div id = "wrap">
 			<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
 
 <h3>탈퇴하는 이유는 무엇인가요?</h3>
 <div calss="form-actions">
     <br><input type ="checkbox" value="reason" >더 좋은 사이트를 찾았습니다.</br>
     <br><input type ="checkbox" value="reason" >얻을 수 있는 정보가 부족합니다.</br>
     <br><input type ="checkbox" value="reason" >개인정보가 노출되었습니다.</br>
     <br><input type ="checkbox" value="reason" >기타</br>
   </div>>
 <div class ="form-actions">
 	<a href ="delete.jsp?id<%=id%>">탈퇴</a>
 	<a href ="mypage.jsp">취소</a>
 </div>

 <jsp:include page="footer.jsp"></jsp:include>
 </div>
</body>
</html>