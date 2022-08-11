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
		<style type="text/css">
		.write_label {
			font-size : 0.9em;
			color : red;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<br>
		<h3 style="margin-left : 12%;"> 판매 상품 등록 </h3>
		<br>
		<form id="write_form">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th> 상품명 (*)  </th>
						<td colspan="3">
							<input type="text" id="product_name" name="product_name" maxlength="50"
									class="form-control">
							<label for="product_name" id="product_name_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 카테고리 (*)  </th>
						<td colspan="3">
							<select id="bigcate" name="bigcate">
								<option value="0" selected="selected">대분류 선택</option>
							</select>
							>
							<select id="smallcate" name="smallcate">
								<option value="0" selected="selected">소분류 선택</option>
							</select>
							<label for="smallcate" id="smallcate_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 판매 가격(단위 : 원) (*)  </th>
						<td>
							<input type="text" id="product_price" name="product_price" class="form-control">
							<label for="product_price" id="product_price_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 배송비(단위 : 원) (*)  </th>
						<td>
							<div>
							<input type="text" id="delivery_price" name="delivery_price" class="form-control">
							<label for="delivery_price" id="delivery_price_label" class="write_label"></label>
							</div>
						</td>
					</tr>
					<tr>
						<th> 주문 옵션  </th>
						<td>
							<button type="button" id="add_option_btn" class=""> 옵션 입력 추가 </button>
							<label for="option_yes" id="option_yes_label" class="write_label"></label>
							<div id="option_name_div">
							</div>
<!-- 							<input type="text" id="option_no" name="option_no" class="form-control" placeholder="옵션을 추가하세요."> -->
						</td>
					</tr>
					<tr>
						<th> 상품 준비 기간(단위 : 일) (*)  </th>
						<td>
							<input type="text" id="product_prepare" name="product_prepare" class="form-control">
							<label for="product_prepare" id="product_prepare_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품 이미지 (*)  </th>
						<td>
							<input type="file" id="product_photo" name="product_photo" class="form-control">
							<label for="product_photo" id="product_photo_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품 상세 설명   </th>
						<td colspan="3">
							<textarea class="form-contol" id="product_contents" name="product_contents"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("product_contents");
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>		
		<button id="write_btn" class="btn btn-primary float-right"> 상품 등록 완료 </button>
		<a href="${pageContext.request.contextPath}/product/list">
			<button class="btn btn-warning"> 상품 등록 취소 </button>
		</a>
		<hr>
		<%@ include file="/WEB-INF/views/footer.jsp" %>

		<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;

	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#product_name").val() ) == "" ){
				$("#product_name_label").text("상품명을 입력 하세요.");
				return;
			} else { $("#product_name_label").text(""); }

			if( $("#smallcate").val() == "0" ){
				$("#smallcate_label").text("카테고리를 선택하세요");
				return;
			} else { $("#smallcate_label").text(""); }
			
			if( $("#product_price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#product_price_label").text("판매 가격을 입력하세요, 숫자만 허용 됩니다.");
				return;
			} else { $("#product_price_label").text(""); }
		
			if( $("#delivery_price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#delivery_price_label").text("배송비를 입력하세요, 숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_price_label").text(""); }
			
			if( $("#product_prepare").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#product_prepare_label").text("상품 준비 기간을 입력하세요, 숫자만 허용 됩니다.");
				return;
			} else { $("#product_prepare_label").text("해당 기간 내에 출고가 되지 않을 경우, 구매자가 환불을 요청할 수 있습니다."); }
			
			let tmp1 = $("#product_photo").val().substring($("#product_photo").val().length-3);
			let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
								|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
			if( $.trim( $("#product_photo").val() ) == "" || tmp1_boolean == false ){
				$("#product_photo_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#product_photo_label").text(""); }
			
			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "description", CKEDITOR.instances.desc_txt.getData() );

			
			$.ajax({
				type : "POST"
				, encType : "multipart/form-data"
				, url : "${pageContext.request.contextPath}/product/insert"
				, data : form
				, processData : false
				, contentType : false
				, cache : false
				, success : function(result) {
					alert("상품이 등록 되었습니다.");
					location.href = "${pageContext.request.contextPath}/product/list";
				}//call back function
				, error : function(xhr) {
					alert("잠시 후 다시 시도해 주세요.");
				}//call back function//xhr : xml http request/response
		});//ajax
			
		});//click
	});//ready
	</script>

		<script type="text/javascript">
		let optionNo = 0;
		$(document).ready(function() {
			$("#add_option_btn").click(function() {
				$("#option_name_div").append(
					'<div class="input-group" id="div_option_no'+optionNo+'">'
					+'<input type="text" id="option_no'+optionNo+'" class="form-control" placeholder="옵션을 입력하세요.">'
					+'<button type="button" id="option_remove_btn'+optionNo+'" class="option_remove btn btn-danger"> X </button>'
					+ '</div>'
				);//append
				$("#option_remove_btn"+optionNo).on("click", function(){
					//alert( $(this).attr("id") );
					//alert( $(this).parent().attr("id") );
					$(this).parent().remove();
				});//on
				optionNo++;
			});//click
		});//ready
		</script>

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