<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
	<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
	</jsp:include>
		<div id="menuBar">
		<jsp:include page="menubar.jsp">
			<jsp:param name="current" value="menubar" />
		</jsp:include>
		</div>
<div id="main-content">
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
	<div >
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
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>