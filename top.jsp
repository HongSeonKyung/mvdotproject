<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">
	function writeAlert() {
		window.alert("로그인후 이용하실 수 있습니다.");
		window.open("login.jsp", "", "width=80, height=100,top=200px,left=400");
	}
	function showlog() {
		window.open("login.jsp", "", "width=80, height=100,top=200px,left=400");
	}
	function showlogout() {
		window.open("logout.jsp", "",
				"width=80, height=100,,top=200px,left=400");
	}
	function delectreply(){
		alert("정말 댓글을 삭제하시겠습니까?");
	}	
	function loginAlert() {
		window.alert("로그인후 이용하실 수 있습니다.");
		window.open("login.jsp", "", "width=80, height=100,top=200px,left=400");
	}
	function openFacebookShare() {
		var src = "http://www.facebook.com/sharer/sharer.php?u="+ window.location;
		window.open(src, "", "width=80, height=100,top=200px,left=400");
	}
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
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="temp.css" type="text/css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="write.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="top">
		<div id="top_left">
			<img src="images/mvdotlogo.jpg" alt="website Logo" />
		</div>
		<div id="top_right">
			<%
				String id = (String) session.getAttribute("id");
				if (id == null) {
			%>
			<a class="btn" type="button" onClick="showlog();"><i
				class="icon-heart"></i>로그인</a> <a href="join.jsp" class="btn"
				type="button"><i class="icon-star"></i>회원가입 </a>
			<%
				} else {
					if (id.equals("nanhee")) {
			%>
			<i class="icon-heart"></i>
			<%
				out.print("mater 님");
			%>
			<a class="btn btn-danger" type="button" onClick="showlogout();">
			<i class="icon-off"></i>로그아웃</a> 
				<a href="master.jsp" class="btn"
				type="button"><i class="icon-user"></i> 관리자 페이지 </a>
			<%
				} else {
			%>
			<i class="icon-heart"></i>
			<%
				out.print("<b>" + session.getAttribute("id") + "</b> 님");
			%>
			<a class="btn btn-danger" type="button" onClick="showlogout();"><i
				class="icon-off"></i>로그아웃</a> 
				<a href="mypage.jsp" class="btn" type="button"><i class="icon-user"></i> my page </a>

			<%
				}
				}
			%>
<<<<<<< HEAD
		</div>
	</div>
=======



		</div>
>>>>>>> 0a0c9028d7187472ae02a80a12b557c980ad18ec
