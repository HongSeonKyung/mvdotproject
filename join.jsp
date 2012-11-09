
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	 <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
  <div class="container">
	<%	if (request.getMethod() == "POST") { %>
		 <div class="well">
		  <ul>
		   <li>아이디 : <%=request.getParameter("id")%></li>
		    <li>비밀번호 : <%=request.getParameter("pwd")%></li>
		     <li>비밀번호확인 : <%=request.getParameter("pwdcheck")%></li>
		    <li>이름 : <%=request.getParameter("name")%></li>
		    <li>닉네임 : <%=request.getParameter("subname")%></li>
		    <li>페이스북 주소 : <%=request.getParameter("facebookaddress")%></li>
		    <li>페이스북 아이디 : <%=request.getParameter("facebookid")%></li>
	    </ul>
		 </div>
  <%} else { %>
    <div>
		 <h3>회원 가입</h3>
<fieldset>
     <form class="form-horizontal" method="post">

    <table cellspacing="5" class="rowTable">
    <tr>
        <th colspan="2" class="title"><div>기본 정보</div></th>
    </tr>
    <tr>
        <th><div>아이디 </div></th>
       <td>
       
       <input type="text" name="id" value="" class="inputTypeText"/> <p style="font-size:9pt; color:red;">*ID는 5~10자 사이의 영문,숫자로 이루어져야 합니다.</p> </td>
    </tr>
    
    <tr>
        <th><div>비밀번호 </div></th>
        <td class="require"><input type="password" name="pwd" value="" class="inputTypeText"/><p style="font-size:9pt; color:red;">*비밀번호는 6~20자로 되어야 합니다.</p></td>
    </tr>
    
    <tr>
        <th><div>비밀번호 확인 </div></th>
        <td><input type="password" name="pwdcheck" value="" class="inputTypeText"/></td>
    </tr>
    <tr>
        <th><div>이름 </div></th>
        <td>
            <input type="text" name="name" value="" class="inputTypeText"/>
        </td>
    </tr>
    <tr>
        <th><div>닉네임</div></th>
        <td>
            <input type="text" name="subname" value="" class="inputTypeText"/><p style="font-size:9pt; color:red;">닉네임은 2~20자 이내여야 합니다.</p>
        </td>
    </tr>
    <tr>
        <th><div>페이스북 주소 </div></th>
        <td class="require">
            <input type="text" name="facebookaddress" value="" class="inputTypeText"/><p style="font-size:9pt; color:red;">홈페이지가 있을 경우 입력해주세요.</p>
        </td>
    </tr>
    <tr>
        <th><div>페이스북아이디</div></th>
        <td class="require">
            <input type="text" name="facebookid" value="" class="inputTypeText"/><p style="font-size:9pt; color:red;">페이스북주소는 비밀번호 변경이나 찾기 등에 사용됩니다.</p>
        </td>
    </tr>
    
   
        <tr>
        <th class="button" colspan="2">
            <span class="button black strong"><input type="submit" value="가입하기" ></span>
            <a href="test.html" class="button"><span>취소</span></a>
        </th>
    </tr>
    </table>
</form>
</fieldset>
    </div>
	<% } %>
  </div>
  <hr><br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

