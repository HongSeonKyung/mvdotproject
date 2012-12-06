<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<jsp:include page="top.jsp">
		<jsp:param name="current" value="top" />
	</jsp:include>


	<div id="header">
		<jsp:include page="slideshow.jsp">
			<jsp:param name="current" value="slide" />
		</jsp:include>
	</div>
	<div id="menuBar">
		<jsp:include page="menubar.jsp">
			<jsp:param name="current" value="menubar" />
		</jsp:include>
	</div>
	<div id="main"></div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>