<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	

 			<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
<br><hr>
 	<div id="mastermenubar">
 	<a href="masterboardlist.jsp"class="btn" type="button">게시글 관리</a>
 	<a href="masteruserlist.jsp" class="btn" type="button" >회원 관리</a>
 	 </div>
 	 <br><br><br>
 	 
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>