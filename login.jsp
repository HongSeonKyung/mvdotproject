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
	 <b>���̵�</b><br>
	   <input type="text" name="id" placeholder="id"><br>
	 <b>��й�ȣ</b><br>
	  <input type="password" name="pwd" placeholder="password"><br><br>
	  <span style="float:right"><input type="submit" value="�α���"></span><br><br>
	  <a href="join.jsp">ȸ������</a> | ���̵�/��й�ȣã��
  </form> 
</body>
</html>