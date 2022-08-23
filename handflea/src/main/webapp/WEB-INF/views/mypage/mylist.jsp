<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 내가 작성한 QnA </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 내가 작성한 QnA </h3>
		<hr>
		<form action="${pageContext.request.contextPath}/mypage/mylist" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="title"
							<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>
						> 제 목 </option>
						<option value="writer"
							<c:if test="${search_dto.searchOption == 'writer'}">selected="selected"</c:if>
						> 작 성 자 </option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-primary"> 검 색 </button>
				</div>
			</div>
		</form>
		<hr>
		<div class="clearfix">
			<a href="${pageContext.request.contextPath}/mylist/write_form">
				<button class="btn btn-primary float-right"> QnA 쓰러 가기 </button>
			</a>
		</div>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th> QnA번호 </th>	<th> 제목 </th>	<th> 작성자 </th>	<th> 조회수 </th>	<th> 작성일 </th> <th> 답변상태 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
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
						
						<c:if test="${dto.answer_yn == 1}">
						<td>답변 완료</td>
						</c:if>
						
						<c:if test="${dto.answer_yn == 0}">
						<td>답변 대기</td>
						</c:if>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/QnA/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
								href="${pageContext.request.contextPath}/QnA/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/QnA/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>














