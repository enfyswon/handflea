<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> QnA 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<c:choose>
		<c:when test="${login_info.mem_email == 'admin'}">
			<%@include file="/WEB-INF/views/admin-header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/header.jsp" %>
		</c:otherwise>
	</c:choose>
		<hr>
		<h3> QnA 상세 보기 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> QnA 번 호 </th>	<td>${detail_dto.qna_no}</td>
					<th> 제 목 </th>		<td>${detail_dto.title}</td>
				</tr>
				<tr>
					<th> 작 성 자 </th>	<td>${detail_dto.mem_name}</td>
					<th> 작 성 일 </th>	<td>${detail_dto.write_date}</td>
					
				</tr>
				<tr>
					<th> 내 용 </th>		<td colspan="1">${detail_dto.contents}</td>
					<th> 조회수 </th>		<td colspan="1">${detail_dto.view_cnt}</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<c:if test="${detail_dto.mem_no == login_info.mem_no}">
			<button id="btn_delete" class="btn btn-danger"> QnA 삭제 </button>
			<a href="${pageContext.request.contextPath}/QnA/update_form?qna_no=${detail_dto.qna_no}">
				<button class="btn btn-primary"> QnA 수정하러 가기 </button>
			</a>
			<hr>
		</c:if>
		
		<hr>
		<c:if test="${login_info.mem_email == 'admin' && detail_dto.answer_yn == 0}">
			<h4>답변</h4>
			<textarea id="answer" name="answer" rows="5" cols="100"></textarea>
			<button id="btn_reply">답변 작성</button>
		</c:if>
		<c:if test="${detail_dto.answer_yn == 1}">
			<h4>답변</h4>
			<p>${detail_dto.answer}</p>
		</c:if>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_delete").click(function() {
			$.get(
					"${pageContext.request.contextPath}/QnA/delete"
					, {
						qna_no : ${detail_dto.qna_no},
						mem_no : ${detail_dto.mem_no}
					}
					, function(data, status) {
						if( data == 1 ){
							alert("QnA가 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/QnA/list";
						} else if( data == 0 ) {
							alert("QnA 삭제를 실패 하였습니다.");
						} else if ( data == 3){
							alert("다른 사람의 게시글을 삭제할 수 없습니다.")
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
			);
		});
	});
	$(document).ready(function() {
		$("#btn_reply").click(function() {
			$.post(
					"${pageContext.request.contextPath}/admin/reply_insert"
					, {
						qna_no : ${detail_dto.qna_no}
						, answer : $("#answer").val()
					}
					, function(data, status) {
						if( data == 1 ){
							alert("답변이 작성되었습니다.");
							location.href="${pageContext.request.contextPath}/QnA/detail?qna_no=${detail_dto.qna_no}";
						} else if( data == 0 ) {
							alert("답변 작성을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
			);
		});//click
	});//ready
	</script>
	</body>
</html>