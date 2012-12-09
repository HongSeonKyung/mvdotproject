<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<jsp:include page="top.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
		<div id="header" >
			
				<jsp:include page="slideshow.jsp">
		 		<jsp:param name="current" value="top"/>
		 		</jsp:include>
			
		</div>
		<div id="menuBar">
			<div id="navbar" class="navbar navbar-inverse" style="position:static;">
			<div class="navbar-inner">
			<div class="container">
			<a class="brand" href="main.jsp">HOME</a>
		<div class="nav-collapse collapse navbar-inverse-collapse">
				<ul class="nav">
					
					<li ><a href="allreview.jsp">모든영화리뷰</a></li>
					<li class="active"><a href="nowreview.jsp" >이번달영화리뷰</a></li>	
				</ul>
		
			</div>
		</div>		
</div>
</div>
		</div>
		<div id="main">
		</div>
			<jsp:include page="footer.jsp">
 			<jsp:param name="current" value="footer"/>
 			</jsp:include>

</body>
</html>