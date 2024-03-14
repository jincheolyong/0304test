<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        padding-top: 50px;
    }
</style>
</head>
<body>
	<div class="container">
		<form action="memberInput.jsp" method="post">
			<div class="mb-3">
				<label for="idInput" class="form-label">아이디</label>
				<input type="text" name="id" class="form-control" id="idInput" placeholder="아이디">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">이메일</label>
				<input type="email" name="email" class="form-control" id="exampleFormControlInput1" placeholder="이메일">
			</div>
			<div class="mb-3">
				<label for="nameInput" class="form-label">이름</label>
				<input type="text" name="name" class="form-control" id="nameInput" placeholder="이름">
			</div>
			<button class="btn btn-primary">가입하기</button>
            <a href="index.jsp" class="btn btn-secondary">홈 화면</a>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
