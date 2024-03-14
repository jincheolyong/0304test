<%@page import="mvjsp.board.model.Board"%>
<%@page import="mvjsp.board.dao.BoardDao"%>
<%@page import="mvjsp.jdbc.connection.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
Connection conn = ConnectionProvider.getConnection();
String memberId = (String) session.getAttribute("MEMBERID");
if (memberId == null) {
	response.sendRedirect("sessionLoginForm.jsp");
}
BoardDao dao = BoardDao.getInstance();
List<Board> list = dao.selectList(conn);
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
	<script>
    // 세션에서 사용자 아이디 가져오기
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
                    aria-current="page" href="list.jsp">회원정보</a></li>
            </ul>
            
        </div>
    </div>
</nav>

	<div class="container" style="padding-top: 50px;">
		<table class="table table-bordered table-hover">
			<tr>
				<th class="num">번호</th>
				<th class="title">제목</th>
				<th class="writer">작성자</th>
				<th class="regtime">작성일시</th>
				<th>조회수</th>
			</tr>
			<%
			for (Board board : list) {
			%>
			<tr>
				<td><%=board.getNum()%></td>
				<td style="text-align: left;"><a
					href="view.jsp?num=<%=board.getNum()%>"> <%=board.getTitle()%>
				</a></td>
				<td><%=board.getWriter()%></td>
				<td><%=board.getRegtime()%></td>
				<td><%=board.getHits()%></td>
			</tr>
			<%
			}
			%>
		</table>

		<br> <input type="button" value="글쓰기" class="btn btn-primary"
			onclick="location.href='write.jsp'"> <input type="button"
			value="홈 화면" class="btn btn-primary"
			onclick="location.href='index.jsp'">

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>