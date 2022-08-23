<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> QnA 게시판 목록 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	</head>
	<body>
	<%@ include file="/WEB-INF/views/admin-header.jsp" %>
		<hr>
		
		<hr>
		<table class="table table-hover">
			<thead>
				<h3> QnA 답변 대기 목록 </h3>
				<tr>
					<th> QnA번호 </th>	<th> 제목 </th>	<th> 작성자 </th>	<th> 조회수 </th>	<th> 작성일 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
				<c:if test="${dto.answer_yn == 0}">
					
					<tr>
						<td>${dto.qna_no}</td>
						<td>
							<a href="${pageContext.request.contextPath}/QnA/detail?qna_no=${dto.qna_no}">
								${dto.title}
							</a>
						</td>
						<td>${dto.mem_name}</td>
						<td>${dto.view_cnt}</td>
						<td>${dto.write_date}</td>
					</tr>
					
					</c:if>
				</c:forEach>
			</tbody>
		</table>	
		
		<table class="table table-hover">
			<thead>
				<h3> QnA 답변 완료 목록 </h3>
				<tr>
					<th> QnA번호 </th>	<th> 제목 </th>	<th> 작성자 </th>	<th> 조회수 </th>	<th> 작성일 </th>
				</tr>		
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.answer_yn == 1}">
					
					<tr>
						<td>${dto.qna_no}</td>
						<td>
							<a href="${pageContext.request.contextPath}/QnA/detail?qna_no=${dto.qna_no}">
								${dto.title}
							</a>
						</td>
						<td>${dto.mem_name}</td>
						<td>${dto.view_cnt}</td>
						<td>${dto.write_date}</td>
					</tr>
					
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
		<hr>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/admin/ad_list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link"
								href="${pageContext.request.contextPath}/admin/ad_list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/admin/ad_list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
			
		</ul>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>














