<%@page import="mvjsp.board.model.Board"%>
<%@page import="mvjsp.board.dao.BoardDao"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="mvjsp.jdbc.connection.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
// 세션에서 사용자 아이디를 가져옴
String memberId = (String) session.getAttribute("MEMBERID");

// 로그인되어 있지 않은 경우 로그인 페이지로 이동
if (memberId == null) {
	response.sendRedirect("sessionLoginForm.jsp");
	return;
}

Connection conn = ConnectionProvider.getConnection();

// 글 번호 값 얻기, 주어지지 않았으면 0으로 설정
String tmp = request.getParameter("num");
int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;

// 새 글쓰기 모드를 가정하고 변수 초기값 설정
String writer = memberId; // 세션에 저장된 아이디를 작성자로 설정
String title = "";
String content = "";
String action = "insert.jsp";

// 글 번호가 주어졌으면, 글 수정 모드
if (num > 0) {
	BoardDao dao = BoardDao.getInstance();
	Board board = dao.selectOne(conn, num, false);

	// 글 작성자와 현재 로그인한 사용자가 같은지 확인
	if (!board.getWriter().equals(memberId)) {
%>
<script>
	alert('작성자만 수정할 수 있습니다..');
	history.back();
</script>
<%
return;
}

// 글 데이터를 변수에 저장
title = board.getTitle();
content = board.getContent();

// 글 수정 모드일 때는 저장 버튼을 누르면 UPDATE 실행
action = "update.jsp?num=" + num;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 작성</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
table {
	width: 680px;
	text-align: center;
}

th {
	width: 100px;
	background-color: cyan;
}

input[type=text], textarea {
	width: 100%;
}
</style>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<form method="post" action="<%=action%>">
    <div class="container">
        <div class="mb-3">&nbsp;</div>
        
        <div class="row">
            <div class="col-md-8"> 
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">제목</label> 
                    <input type="text" class="form-control" name="title" maxlength="100" value="<%=title%>"> 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8"> 
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">작성자</label> 
                    <input type="text" class="form-control" name="writer" maxlength="80" value="<%=writer%>" readonly="readonly"> 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8"> 
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" cols="50" name="content"><%=content%></textarea>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8"> 
                <input type="submit" value="저장" class="btn btn-primary"> 
                <input type="button" value="취소" onclick="history.back()" class="btn btn-secondary">
            </div>
        </div>
    </div>
</form>


</body>
</html>
