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
			 <b>���̵�</b><br>	 
		  	 <input type="text" name="id"><br>
		  	 <b>��й�ȣ</b><br>	 
		   	 <input type="password" name="pwd"><br><br>	
		   	 <span style="float:right"><input type="submit" value="�α���"></span><br><br>
		   	 	 <a href="./join.jsp"> ȸ������</a> | ���̵�/��й�ȣã��  
   	    </form>  
 <%  if (request.getMethod() == "POST") {
		 String id = request.getParameter("id");	
 		 String pwd = request.getParameter("pwd");	
 		if (id == null || pwd == null || id.length() == 0 || pwd.length() == 0) {
 		%><div class="error"><span style= "color:red";>���̵�� ��й�ȣ�� �Է��ϼ���.</span>
 		</div>		 
  <%	 } else if (id.equals("nanhee") && pwd.equals("12345")) {		  
 		// �α��� ����	      session.setAttribute("userId", "nanhee");	     
 			 session.setAttribute("userName", "������");		    
 			// response.sendRedirect("ex2.jsp");	   
 		 } else {		  
 	 %>	 <div class="error">
 	 	<span style= "color:red";> �α����� �� �����ϴ�. �Է³����� Ȯ�� �� �ٽ� �õ��� �ֽʽÿ�. </span>
 	 	</div>		
  <%	  }  
 		}  %> 
 	 </body>
</html>