<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
	<script>
    var memberId = "<%= session.getAttribute("MEMBERID") %>";

    // 로그인 상태 확인 후 팝업 띄우기
    window.onload = function() {
        if (memberId === null || memberId === "") {
            alert("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다.");
            window.location.href = "login.jsp"; // 로그인 페이지로 이동
        } else {
            alert(memberId + "님으로 로그인되어 있습니다.");
        }
    };
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">홈 화면</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="blist.jsp">게시판</a></li>
					
						
				
				</ul>
				
			</div>
		</div>
	</nav>

	<div class="container" style="padding-top: 50px">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">아이디</th>
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${list}">
				<tr>
					<th scope="row">${member.memberno}</th>
					<td>${member.id}</td>
					<td>${member.email}</td>
					<td>${member.name}</td>
					<td>
						<button class="btn btn-warning"
							onClick='location.href=
					    "updateForm.jsp?memberno=${member.memberno}"'>수정</button>
					</td>
					<td>
						<button class="btn btn-warning"
							onClick='location.href=
					    "memberDelete.jsp?memberno=${member.memberno}"'>삭제</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="btn btn-primary" onClick="move()">홈 화면</button>
		<button class="btn btn-primary" onClick="move1()">회원가입</button>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

	<script>
		function move() {
			location.href="index.jsp";
		}
		function move1() {
			location.href="memberForm.jsp";
		}
	</script>
</body>
</html>