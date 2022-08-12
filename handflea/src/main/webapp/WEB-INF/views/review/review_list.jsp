<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>  </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h4> 상품 후기 </h4>
		<hr>
		<form action="${pageContext.request.contextPath}/board/free/final_list" method="get">
			<div class="input-group">
			</div>
		</form>
		<hr>
		<table class="table table-hover">
			<tbody> 
			<c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.bno}"/></td>
				<td><c:out value="${list.writer}"/></td>
                <td><c:out value="${list.contents}"/></td>
                <td><c:out value="${list.regdate}"/></td>
                <td><c:out value="${list.updateDate}"/></td>
            </tr>
       		</c:forEach>
						
							<a href="${pageContext.request.contextPath}/board/free/detail?review_no=${dto.review_no}">
								${dto.star_point}
							</a>
						</td>
					</tr>
			</tbody>
		</table>
		<hr>

		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/board/free/final_list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active">
							<a class="page-link" href="#">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link"
								href="${pageContext.request.contextPath}/board/free/final_list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/board/free/final_list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>

		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>
