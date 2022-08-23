<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>상품 후기 작성창</title>
	
	<script language="javascript">
  function showPopup() { window.open("08_2_popup.html", "후기 작성창", "width=1200, height=1000, left=200, top=200"); }
  </script>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/star.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h5>상품 후기 작성</h5>
	      <h9>작성하신 후기는 다른 회원이 상품 구매에 참고 할 수 있도록 상품 후기란에 공개 됩니다.</h9>
		  <hr>
		  

 	<form class="mb-3" name="myform" id="myform" method="post">
	<fieldset>
		<input type="radio" name="star_point" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="star_point" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="star_point" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="star_point" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="star_point" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
			
			    <div class="form-group">
			      
				<input type="file" id="review_photo" name="review_photo"> 
				<img id="preview" />
					
			    </div>
				
			    <h9>상품에 대한 평가를 15자 이상, 50자 이내로 작성해 주세요.</h9>
			    <div class="form-group">
				  <textarea class="form-control" rows="5" id="review_contents" name = "review_contents" maxlength='50'></textarea>
				 </div>
				<div class="jumbotron text-center" style="margin-bottom:0">
				    <button id="submit_btn" type="button" class="btn btn-primary">등록</button>
				</div>
			  </form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#submit_btn").click(function() {
		let form = new FormData( document.getElementById( "myform" ) );
		var detail_no = "${detail_no}";
		form.append("detail_no", detail_no);
		
		let keys = form.keys();
		for(key of keys) console.log(key);
		let values = form.values();
		for(value of values) console.log(value);
		
		$.ajax({
			type : "POST"
			, encType : "multipart/form-data"
			, url : "${pageContext.request.contextPath}/review/write"
			, data : form
			, processData : false
			, contentType : false
			, cache : false
			, success : function(result) {
				alert("리뷰가 등록 되었습니다.");
				location.href = "${pageContext.request.contextPath}/main";
			}//call back function
			, error : function(xhr) {
				alert("잠시 후 다시 시도해 주세요.");
			}//call back function//xhr : xml http request/response
	});//ajax	
	});
});
</script>
</body>
</html>