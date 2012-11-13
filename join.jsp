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
	<script type="text/javascript">
	function checkPwd(){
		if (frm.pwd.value != frm.pwdchk.value){
			alert("비밀번호가 같지 않습니다.");
			frm.pwdchk.value="";
		}
	}
	function returnPage(){
		window.location="main.html"
	}
	
	</script>
	
</head>
<body>
 <jsp:include page="header.jsp">
 	<jsp:param name="current" value="Login"/>
 </jsp:include>
  <div class="container">
    <div>
		 <h3>회원 가입</h3>
     <form name="frm" class="form-horizontal" action="register.jsp" method="post">
			<fieldset>
	   	 <table>
	   	 <tbody>
  	  	<tr>
        	<th colspan="2" class="title"><div><label>기본 정보</label></div></th>
    		</tr>
		    <tr>
					<th><label for="name">아이디</label></th>
					<td><input type="text" id="userid" name="userid" value="" />
							<p style="font-size:9pt; color:red;">ID는 5~10자 사이의 영문,숫자로 이루어져야 합니다.</p>
					</td>
				</tr>
				<tr>
					<th><label for="name">비밀번호</label></th>
					<td><input type="password" id="pwd" name="pwd" value=""/>
							<p style="font-size:9pt; color:red;">비밀번호는 6~20자로 되어야 합니다.</p>
					</td>
				</tr>		
				<tr>
					<th><label for="name">비밀번호확인</label></th>
					<td><input type="password" id="pwdchk" name="pwdchk" onblur="javascript:checkPwd();" value=""/>
							<p style="font-size:9pt; color:red;">비밀번호를 동일하게 입력하세요.</p>
					</td>
				</tr>			
 				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input type="text" id="name" name="name" value="" />
					</td>
				</tr>
 				<tr>
					<th><label for="name">닉네임</label></th>
					<td>
						<input type="text" name="nickname" value=""/>
						<p style="font-size:9pt; color:red;">*닉네임은 2~20자 이내여야 합니다.</p>
					</td>
				</tr>
 				<tr>
					<th><label for="name">페이스북 아이디</label></th>
					<td>
						<input type="text" name="facebook_id" value=""/>
						<p style="font-size:9pt; color:red;">페이스북주소는 비밀번호 변경이나 찾기 등에 사용됩니다.</p>
					</td>
				</tr>
 				<tr>
					<th><label for="name">페이스북 주소</label></th>
					<td>
						<input type="text" name="facebook_address" value=""/>
						<p style="font-size:9pt; color:red;">홈페이지가 있을 경우 입력해주세요.</p>
					</td>
				</tr>				
 				<tr>        
 					<th class="button" colspan="2">
          	<input type="submit" value="가입" >
 						<input type="button" value="취소" onclick="javascript:returnPage()">
 				</th>
 				</tr>
 				</tbody>
 				</table>
 			</fieldset>
		</form>
    </div>
  </div>
  <hr><br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

