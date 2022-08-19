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
<link rel="stylesheet" href="star.css">
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
<link href="${pageContext.request.contextPath}/resources/rev/star.css" rel="stylesheet"/>
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
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
</form>	
			
			
	        <form method = "POST" enctype="multipart/form-data">
			    <div class="form-group">
			      
				<input type="file" onchange="readURL(this);"> 
				<img id="preview" />
					
			    </div>
				
				
				
			    <h9>상품에 대한 평가를 15자 이상, 50자 이내로 작성해 주세요.</h9>
			    <div class="form-group">
				  <textarea class="form-control" rows="5" id="contents" name = "contents" maxlength='50'></textarea>
				<div class="jumbotron text-center" style="margin-bottom:0">
			    <button type="submit" id="submit_btn" class="btn btn-primary">등록</button>
			  </form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#submit_btn").click(function() {
		var star = $("input[name='reviewStar']:checked").val();
		$.post(
				"${pageContext.request.contextPath}/review/write",
				{
					star_point : star,
					review_contents : $("#contents").val()
				},
				function(data, status) {
					if (data >= 1) {
						alert("등록에 성공했습니다.");
						location.href="${pageContext.request.contextPath}/main";
					} else if (data == 0) {
						alert("등록에 실패했습니다.");
					} else {
						alert("서버 오류");
					}
				}
		);
	});
});
</script>
</body>
</html>