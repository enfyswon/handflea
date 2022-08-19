<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 판매자 상품 수정 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		.prdt_img {
			width: 30%;
		}
		</style>
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
						<th width="25%"> 상 품 명 (*) </th>
						<td colspan="3">
							<input type="text" id="prdt_name" name="prdt_name" maxlength="20"
									class="form-control" value="${detail_dto.prdt_name}">
							<label for="prdt_name" id="prdt_name_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th width="25%"> 판 매 자 </th>
						<td width="25%">
							${login_info.mem_email}
						</td>
					</tr>
					<tr>
						<th> 판매 가격(단위 : 원) (*) </th>
						<td>
							<input type="text" id="price" name="price" class="form-control"
									value="${detail_dto.price}">
							<label for="price" id="price_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 배송비(단위 : 원) (*)  </th>
						<td>
							<input type="text" id="delivery_price" name="delivery_price" class="form-control"
									value="${detail_dto.delivery_price}">
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
						<td class="text-center">
							<c:choose>
								<c:when test="${detail_dto.thumbnail_path != null && detail_dto.thumbnail_path != ''}">
									<img class="prdt_img" src="${detail_dto.thumbnail_path}">
									<button id="thumbnail_btn" type="button" class="btn btn-danger delete_btn" value="${detail_dto.thumbnail_path}">
										이미지 삭제
									</button>
								</c:when>
								<c:otherwise>
									<input type="file" id="thumbnail" name="thumbnail" class="form-control">
									<label for="thumbnail" id="thumbnail_label" class="write_label"></label>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th> 상 품 상 세 이 미 지 </th>
						<td class="text-center">
							<c:choose>
								<c:when test="${detail_dto.prdt_img_path != null && detail_dto.prdt_img_path != ''}">
									<img class="prdt_img" src="${detail_dto.prdt_img_path}">
									<button id="prdt_img_btn" type="button" class="btn btn-danger delete_btn" value="${detail_dto.prdt_img_path}">
										이미지 삭제
									</button>
								</c:when>
								<c:otherwise>
									<input type="file" id="prdt_img" name="prdt_img" class="form-control">
									<label for="prdt_img" id="prdt_img_label" class="write_label"></label>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th> 상 품 설 명 이 미 지 </th>
						<td class="text-center">
							<c:choose>
								<c:when test="${detail_dto.desc_img_path != null && detail_dto.desc_img_path != ''}">
									<img class="prdt_img" src="${detail_dto.desc_img_path}">
									<button id="desc_img_btn" type="button" class="btn btn-danger delete_btn" value="${detail_dto.desc_img_path}">
										이미지 삭제
									</button>
								</c:when>
								<c:otherwise>
									<input type="file" id="desc_img" name="desc_img" class="form-control">
									<label for="desc_img" id="desc_img_label" class="write_label"></label>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th> 상 품 설 명 </th>
						<td colspan="3">
							<textarea class="form-contol" id="desc_txt" name="desc_txt">${detail_dto.description}</textarea>
							<script type="text/javascript">
							CKEDITOR.replace("desc_txt");
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<button id="write_btn" class="btn btn-primary float-right"> 상품 수정 완료 </button>
		<a href="${pageContext.request.contextPath}/product/sellerlist">
			<button id="updatecancel_btn" class="btn btn-warning"> 상품 수정 취소 </button>
		</a>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;
	
	$(document).ready(function() {
		$(".delete_btn").click(function() {
			$.get(
					"${pageContext.request.contextPath}/product/file/delete"
					, {
						id : $(this).attr("id")
						, path : $(this).val()
						, prdt_no : ${detail_dto.prdt_no}
					}
					, function(data, status) {
						if(data >= 1){
							alert("파일을 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/product/uform?prdt_no=${detail_dto.prdt_no}";
						} else {
							alert("파일 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get
		});//click
	});//ready
	
	/*
	$(document).ready(function() {
		let tmpForm = new FormDate();
	});//ready
	사진 삭제하고 뒤로갈때
	*/
	
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

			if( "${detail_dto.thumbnail_name}" == "" || $.trim($("#thumbnail").val()) != "" ){
				let tmp1 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
				let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
									|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
				if( $.trim( $("#thumbnail").val() ) == "" || tmp1_boolean == false ){
					$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#thumbnail_label").text(""); }
			}

			if( $.trim($("#prdt_img").val()) != "" ){
				let tmp2 = $("#prdt_img").val().substring($("#prdt_img").val().length-3);
				let tmp2_boolean = (tmp2 == "jpg" || tmp2 == "jpeg" || tmp2 == "gif" || tmp2 == "png"
					|| tmp2 == "JPG" || tmp2 == "JPEG" || tmp2 == "GIF" || tmp2 == "PNG");
				if( $.trim( $("#prdt_img").val() ) != "" && tmp2_boolean == false ){
					$("#prdt_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#prdt_img_label").text(""); }
			}

			if( $.trim($("#desc_img").val()) != "" ){
				let tmp3 = $("#desc_img").val().substring($("#desc_img").val().length-3);
				let tmp3_boolean = (tmp3 == "jpg" || tmp3 == "jpeg" || tmp3 == "gif" || tmp3 == "png"
					|| tmp3 == "JPG" || tmp3 == "JPEG" || tmp3 == "GIF" || tmp3 == "PNG");
				if( $.trim( $("#desc_img").val() ) != "" && tmp3_boolean == false ){
					$("#desc_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#desc_img_label").text(""); }
			}

			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "description", CKEDITOR.instances.desc_txt.getData() );
			form.append( "prdt_no", ${detail_dto.prdt_no} );
			form.append( "arr_option", arr_option2 );

			$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/product/update"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("상품이 수정 되었습니다.");
						location.href="${pageContext.request.contextPath}/product/sellerdetail?prdt_no=${detail_dto.prdt_no}";
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
	
	</body>
</html>
