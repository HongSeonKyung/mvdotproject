<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 

		<jsp:include page="top.jsp">
 		<jsp:param name="current" value="top"/>
 		</jsp:include>
		<div id="header" >
			<form class="navbar-form pull-left">
				<jsp:include page="slideshow.jsp">
		 		<jsp:param name="current" value="top"/>
		 		</jsp:include>
			</form>
		</div>
		<div id="menuBar">
			<jsp:include page="menubar.jsp">
 			<jsp:param name="current" value="menubar"/>
 			</jsp:include>
		</div>
		<div id="main">
		</div>
			<jsp:include page="footer.jsp">
 			<jsp:param name="current" value="footer"/>
 			</jsp:include>
</body>
</html>