<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onresize="parent.resizeTo(500,400)" onload="parent.resizeTo(500,400)">
<form action="logincheck.jsp" method="post">
	 <b>아이디</b><br>
	   <input type="text" name="id" placeholder="id"><br>
	 <b>비밀번호</b><br>
	  <input type="password" name="pwd" placeholder="password"><br><br>
	  <span style="float:right"><input type="submit" value="로그인"></span><br><br>
	  <a href="join.jsp">회원가입</a> | 아이디/비밀번호찾기
  </form> 
</body>
</html>