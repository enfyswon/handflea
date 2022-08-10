<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 후기 작성</title>
		
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>상품 후기</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index">메인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="board">상품 후기</a>
      </li>
    </ul>
  </div>  
</nav>

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>상품 후기 작성</h2>
	      <h4>작성하신 후기는 다른 회원이 상품 구매에 참고 할 수 있도록 상품 후기란에 공개 됩니다.</h4>
	        <form action="writeAction" method = "POST" enctype="multipart/form-data">
			    <div class="form-group">
			      <input type="file" class="form-control-file border" name="file">
			    </div>
			    <h4>상품에 대한 평가를 15자 이상, 50자 이내로 작성해 주세요.</h4>
			    <div class="form-group">
				  <label for="comment">내용:</label>
				  <textarea class="form-control" rows="5" id="contents" name = "contents"></textarea>
				</div>
			    <button type="submit" class="btn btn-primary">등록</button>
			  </form>
		</div>
	</div>
</div>
</body>
</html>