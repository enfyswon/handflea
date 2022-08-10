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
							<select id="bigcate_name" name="bigcate_name">
								<option value="0" selected="selected">대분류 선택</option>
								<option value="1">디저트</option>
								<option value="2">니트/뜨개</option>
								<option value="3">디자인/아트</option>
								<option value="4">캔들/디퓨저</option>
								<option value="5">가족공예</option>
								<option value="6">액세사리</option>
								<option value="7">잡화/기타</option>
							</select>
							>
							<select id="smallcate_name" name="smallcate_name">
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
	</body>
</html>