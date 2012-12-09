	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript">
	function checkPwd(){
		if (frm.pwd.value != frm.pwdchk.value){
			alert("비밀번호가 같지 않습니다.");
			frm.pwdchk.value="";
		}
	}
	function returnPage(){
		window.location="main.jsp"
	}
	 function idchk(i){ 
		id=frm.userid.value; 
		if(id==""){ 
			window.alert("아이디를 입력해 주세요"); 
			frm.userid.focus(); 
			return; 
		} 
		w=window.open("idcheck.jsp?id=" +id,"", "width=300,height=150"); 
	 } 
	</script>
</head>
<body>
<div id="wrap">
<jsp:include page="top.jsp">
 			<jsp:param name="current" value="top"/>
 			</jsp:include>
 			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
  <div class="container">
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
						<input type="button" class="btn" value="중복확인" onClick="idchk(this.form)"/><p style="font-size:9pt; color:red;">ID는 5~10자로 이루어져야 합니다.</p>
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
						<input type="text" name="nickname" name=""/>
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
 					<th class="button" colspan="2">
 					 <input type="submit" class="btn" value="가입" >
 					 <input type="button" class="btn" value="취소" onclick="history.back()">
 				</th>
 				</tr>
 				</tbody>
 				</table>
 			</fieldset>
		</form>
    </div>
 
  <hr><br>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>

