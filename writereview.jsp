<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
	<link href="write.css" type="text/css" rel="stylesheet"/>
</head>
<script type="text/javascript">
</script>
<body>
	<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
	</jsp:include>
		<div id="menuBar">
		<jsp:include page="menubar.jsp">
			<jsp:param name="current" value="menubar" />
		</jsp:include>
		</div>
<div id="main_content">
<form action="write.jsp" method="post">
	<div id="subject">
		제목 <input type="text" name="subject" size="85px" placeholder="영화제목을작성해주세요."/>
	</div>
	<div id="write_style">
			<div class="image">
			영화 이미지 <br/>
				<input type="button" name="movie-search" value="영화검색">
			</div>
			<div class="information">
			영화 배우, 감독
			</div>
	</div>
	<div id="text">
		<textarea id="write" rows="3" name="content" cols="30px">
		</textarea>
	</div>
	<div id="buttons">
		<input type="submit" class="btn btn-success" value="등록">
		<input type="button" class="btn" value="취소" onclick="history.back();"> 
	</div>
</form>
</div>
</body>
</html>