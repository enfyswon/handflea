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
						<th> 상 품 명 (*) </th>
						<td colspan="3">
							<input type="text" id="prdt_name" name="prdt_name" maxlength="40"
									class="form-control">
							<label for="prdt_name" id="prdt_name_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 판 매 자 </th>
						<td>
							${login_info.mem_email}
						</td>
					</tr>
					<tr>
						<th> 카테고리 (*)  </th>
						<td colspan="3">
							<select id="bigcate_no" name="bigcate_no">
								<option value="0" selected="selected">대분류 선택</option>
							</select>
							>
							<select id="smallcate_no" name="smallcate_no">
								<option value="0" selected="selected">소분류 선택</option>
							</select>
							<label for="smallcate_no" id="smallcate_no_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 판매 가격(단위 : 원) (*)  </th>
						<td>
							<input type="text" id="price" name="price" class="form-control">
							<label for="price" id="price_label" class="write_label"></label>
						</td>
						<th> 배송비(단위 : 원) (*)  </th>
						<td>
							<input type="text" id="delivery_price" name="delivery_price" class="form-control">
							<label for="delivery_price" id="delivery_price_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 주문 옵션  </th>
						<td>
							<button type="button" id="add_option_btn" class="mb-1"> 옵션 입력 추가 </button>
							<label for="option_yes" id="option_yes_label" class="write_label"></label>
							<div id="option_name_div">
							</div>
<!-- 							<input type="text" id="option_no" name="option_no" class="form-control" placeholder="옵션을 추가하세요."> -->
						</td>
					</tr>
					<tr>
						<th> 상품 준비 기간(단위 : 일) (*)  </th>
						
						<td>
							<input type="text" id="prdt_rdy" name="prdt_rdy" class="form-control">
							<label for="prdt_rdy" id="prdt_rdy_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 썸 네 일 이 미 지 (*) </th>
						<td>
							<input type="file" id="thumbnail" name="thumbnail" class="form-control">
							<label for="thumbnail" id="thumbnail_label" class="write_label"></label>
						</td>
						<th> 상 품 상 세 이 미 지 </th>
						<td>
							<input type="file" id="prdt_img" name="prdt_img" class="form-control">
							<label for="prdt_img" id="prdt_img_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상 품 설 명 이 미 지 </th>
						<td>
							<input type="file" id="desc_img" name="desc_img" class="form-control">
							<label for="desc_img" id="desc_img_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 상품 상세 설명   </th>
						<td colspan="3">
							<textarea class="form-contol" id="desc_txt" name="desc_txt"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("desc_txt");
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
			let tmpArr2 = $("input[id^='option_no']");
			let arr_option2 = new Array();
			for( let i=0; i < tmpArr2.length; i++ ){
				arr_option2.push( tmpArr2[i].value );
			}

			if( $.trim( $("#prdt_name").val() ) == "" ){
				$("#prdt_name_label").text("상품명을 입력 하세요.");
				return;
			} else { $("#prdt_name_label").text(""); }

			if( $("#smallcate_no").val() == "0" ){
				$("#smallcate_no_label").text("카테고리를 선택하세요");
				return;
			} else { $("#smallcate_no_label").text(""); }
			
			if( $("#price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#price_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#price_label").text(""); }
		
			if( $("#delivery_price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#delivery_price_label").text("배송비를 입력하세요, 숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_price_label").text(""); }
			
			if( $("#prdt_rdy").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#prdt_rdy_label").text("상품 준비 기간을 입력하세요, 숫자만 허용 됩니다.");
				return;
			} else { $("#product_prepare_label").text("해당 기간 내에 출고가 되지 않을 경우, 구매자가 환불을 요청할 수 있습니다."); }
			
			let tmp1 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
			let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
								|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
			if( $.trim( $("#thumbnail").val() ) == "" || tmp1_boolean == false ){
				$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#thumbnail_label").text(""); }

			let tmp2 = $("#prdt_img").val().substring($("#prdt_img").val().length-3);
			let tmp2_boolean = (tmp2 == "jpg" || tmp2 == "jpeg" || tmp2 == "gif" || tmp2 == "png"
				|| tmp2 == "JPG" || tmp2 == "JPEG" || tmp2 == "GIF" || tmp2 == "PNG");
			if( $.trim( $("#prdt_img").val() ) != "" && tmp2_boolean == false ){
				$("#prdt_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#prdt_img_label").text(""); }

			let tmp3 = $("#desc_img").val().substring($("#desc_img").val().length-3);
			let tmp3_boolean = (tmp3 == "jpg" || tmp3 == "jpeg" || tmp3 == "gif" || tmp3 == "png"
				|| tmp3 == "JPG" || tmp3 == "JPEG" || tmp3 == "GIF" || tmp3 == "PNG");
			if( $.trim( $("#desc_img").val() ) != "" && tmp3_boolean == false ){
				$("#desc_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#desc_img_label").text(""); }

			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "description", CKEDITOR.instances.desc_txt.getData() );
			form.append( "arr_option", arr_option2 );
			
			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);

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
/*
			let tmpArr = $("input[id^='option_no']");
			for( let i=0; i < tmpArr.length; i++ ){
				let arr_option = tmpArr[i].value;
				alert(arr_option);
				$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/product/option_insert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("옵션이 등록 되었습니다.");
					}//call back function
					, error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}//call back function//xhr : xml http request/response
			});//ajax
		}//for
*/
		});//click
	});//ready
	</script>

		<script type="text/javascript">
		let optionNo = 0;
		$(document).ready(function() {
			$("#add_option_btn").click(function() {
				$("#option_name_div").append(
					'<div class="input-group" id="div_option_no'+optionNo+'">'
					+'<input type="text" id="option_no'+optionNo+'" class="form-control mb-1" placeholder="옵션을 입력하세요.">'
					+'<button type="button" id="option_remove_btn'+optionNo+'" class="option_remove btn btn-danger mb-1"> X </button>'
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
			$("#bigcate_no").change(function() {
				$.get(
						"${pageContext.request.contextPath}/product/smallcate"
						, { bigcate_no : $("#bigcate_no").val() }
						, function(data, status) { 
							$("#smallcate_no").empty();
							$("#smallcate_no").append("<option value='0'>선택하세요</option>");
							$.each(JSON.parse(data), function(idx, dto) {
								$("#smallcate_no").append("<option value='" + dto.smallcate_no + "'>" + dto.smallcate_name + "</option>");
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
							$("#bigcate_no").append("<option value='" + dto.bigcate_no + "'>" + dto.bigcate_name + "</option>");
						});//each
					}//call back function
			);//get
		});//ready
		</script>	
		
		
		
	</body>
</html>