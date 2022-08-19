<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<main>
		<h3>주문 페이지</h3>
		<c:forEach var="dto" items="${order_list}">
		</c:forEach>
	</main>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>