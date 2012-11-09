<%@ page language="java" contentType="text/html; charset=EUC-KR"   
 pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<form method="post">	
			 <b>아이디</b><br>	 
		  	 <input type="text" name="id"><br>
		  	 <b>비밀번호</b><br>	 
		   	 <input type="password" name="pwd"><br><br>	
		   	 <span style="float:right"><input type="submit" value="로그인"></span><br><br>
		   	 	 <a href="./join.jsp"> 회원가입</a> | 아이디/비밀번호찾기  
   	    </form>  
 <%  if (request.getMethod() == "POST") {
		 String id = request.getParameter("id");	
 		 String pwd = request.getParameter("pwd");	
 		if (id == null || pwd == null || id.length() == 0 || pwd.length() == 0) {
 		%><div class="error"><span style= "color:red";>아이디와 비밀번호를 입력하세요.</span>
 		</div>		 
  <%	 } else if (id.equals("nanhee") && pwd.equals("12345")) {		  
 		// 로그인 성공	      session.setAttribute("userId", "nanhee");	     
 			 session.setAttribute("userName", "조난희");		    
 			// response.sendRedirect("ex2.jsp");	   
 		 } else {		  
 	 %>	 <div class="error">
 	 	<span style= "color:red";> 로그인할 수 없습니다. 입력내용을 확인 후 다시 시도해 주십시오. </span>
 	 	</div>		
  <%	  }  
 		}  %> 
 	 </body>
</html>