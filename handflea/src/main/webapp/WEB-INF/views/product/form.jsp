<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 상품 등록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 판매자 상품 등록 </h3>
		<hr>
		<form id="write_form">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th> 상 품 명  </th>
						<td colspan="3">
							<input type="text" id="product_name" name="product_name" maxlength="20"
									class="form-control">
							<label for="product_name" id="product_name_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 카 테 고 리  </th>
						<td colspan="3">
							<select id="bigcate" name="bigcate">
								<option value="0" selected="selected">대분류 선택</option>
							</select>
							>
							<select id="smallcate" name="smallcate">
								<option value="0" selected="selected">소분류 선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<th> 판 매 가 격  </th>
						<td>
							<input type="text" id="product_price" name="product_price" class="form-control">
							<label for="product_price" id="product_price_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 배 송 비  </th>
						<td>
							<input type="text" id="delivery_price" name="delivery_price" class="form-control">
							<label for="delivery_price" id="delivery_price_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 주 문 옵 션  </th>
						<td>
							<input type="radio" id="option_yn" name="option_yn"> 사용함
							<input type="radio" id="option_yn" name="option_yn"> 사용안함
							<input type="text" id="option_no" name="option_no" class="form-control" value="옵션을 추가하세요.">
							<label for="option_no" id="option_no_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품 준비 기간  </th>
						<td>
							<input type="text" id="delivery_price" name="delivery_price" class="form-control">
							<label for="delivery_price" id="delivery_price_label" class="write_label"></label>
						</td>
					</tr>
				</tbody>
			</table>
		</form>		
		<%@ include file="/WEB-INF/views/footer.jsp" %>
		<script type="text/javascript">
		
		$(document).ready(function() {
			$("#bigcate").change(function() {
				$.get(
						"${pageContext.request.contextPath}/product/smallcate"
						, { bigcate_no : $("#bigcate").val() }
						, function(data, status) { 
							$("#smallcate").empty();
							$("#smallcate").append("<option value='0'>선택하세요</option>");
							$.each(JSON.parse(data), function(idx, dto) {
								$("#smallcate").append("<option value='" + dto.smallcate_no + "'>" + dto.smallcate_name + "</option>");
							});//each
						}//call back function
				);//get
			});//change
		});//ready
		
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/product/bigcate"
					, function(data, status) {
						$.each(JSON.parse(data), function(idx, dto) { 
							$("#bigcate").append("<option value='" + dto.bigcate_no + "'>" + dto.bigcate_name + "</option>");
						});//each
					}//call back function
			);//get
		});//ready
		</script>	
	</body>
</html>