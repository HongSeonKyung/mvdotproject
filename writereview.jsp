<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
	<link href="write.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
function openSearchWindow(){
	window.open("showresult.html","","scrollbars=yes,toolbar=yes,resizable=yes,width=200,height=400,left=300,top=100");
}	

function setMovieData(movieObj) {
	frm.mov_title.value=document.getElementById("mov_title").innerText = movieObj.title;
	frm.mov_img.value= document.getElementById("mov_img").src = movieObj.thumbnail;
	frm.mov_open_info.value= document.getElementById("mov_open_info").innerText = movieObj.open_info;
	frm.mov_director.value= document.getElementById("mov_director").innerText = movieObj.director;
	frm.mov_actor.value= document.getElementById("mov_actor").innerText = movieObj.actor;
	frm.mov_story.value= document.getElementById("mov_story").innerText = movieObj.story;
}
</script>
</head>
<body>
	<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
	</jsp:include>
		<div id="menuBar">
		<jsp:include page="menubar.jsp">
			<jsp:param name="current" value="menubar" />
		</jsp:include>
		</div>
<div id="wrap">
<div id="main_content">
<form action="write.jsp" method="post" name="frm">
	<div id="subject">
		제목 <input type="text" name="subject" size="85px" placeholder="영화제목을작성해주세요."/>
	</div>
	<div id="write_style">
		<div id="write_style_left">
		<input type="button" name="movie-search" value="영화검색" onclick="openSearchWindow()">
			<div class="image">
			<br/>
				<img id="mov_img" alt="" src="">
			</div>
		</div>	
		<div id="write_style_bottom">
			<div class="information">
				<div id="mov_title"><span>제목 : </span></div>
				<div id="mov_open_info"><span>개봉일 : </span></div>
				<div id="mov_director"><span>감독 : </span></div>
				<div id="mov_actor"><span>배우 : </span></div>
				<div id="mov_story"><span>줄거리 : </span></div>							
			</div>
		</div>
	</div>
	<div id="text">
		<textarea id="write" rows="3" name="content" cols="30px">
		</textarea>
	</div>
	<div id="buttons">
		<input type="hidden" name="mov_title">
		<input type="hidden" name="mov_img">		
		<input type="hidden" name="mov_open_info">
		<input type="hidden" name="mov_director">
		<input type="hidden" name="mov_actor">
		<input type="hidden" name="mov_story">						
		<input type="submit" class="btn btn-success" value="등록">
		<input type="button" class="btn" value="취소" onclick="history.back();"> 
	</div>
	</form>
</div>
	<div>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>