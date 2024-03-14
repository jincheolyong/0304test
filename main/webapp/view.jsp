<%@page import="mvjsp.jdbc.connection.ConnectionProvider"%>
<%@page import="mvjsp.board.model.Board"%>
<%@page import="mvjsp.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
    Connection conn = ConnectionProvider.getConnection();
    // 지정된 글 번호 얻기
    int num = Integer.parseInt(request.getParameter("num"));   

    // 게시글 데이터를 담을 변수 정의
    String writer  = "";
    String title   = "";
    String content = "";
    String regtime = "";
    int    hits    = 0;
    
    String memberId = (String)session.getAttribute("MEMBERID");
    if (memberId == null) {
        response.sendRedirect("sessionLoginForm.jsp");
    }
    BoardDao dao = BoardDao.getInstance();
    Board board = dao.selectOne(conn, num, true);
    
    // 글 데이터를 변수에 저장
    writer  = board.getWriter();
    title   = board.getTitle();
    content = board.getContent();
    regtime = board.getRegtime();
    hits    = board.getHits();
    
    // 글 제목과 내용이 웹 페이지에 올바르게 출력되도록 
    // 공백과 줄 바꿈 처리
    title   = title.replace  (" ", "&nbsp;");
    content = content.replace(" ", "&nbsp;").replace("\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col">
            <table class="table table-bordered">
                <tr>
                    <th style="width: 20%;">제목</th>
                    <td><%=title%></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%=writer%></td>
                </tr>
                <tr>
                    <th>작성일시</th>
                    <td><%=regtime%></td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td><%=hits%></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><%=content%></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <input type="button" value="목록보기" onclick="location.href='blist.jsp'" class="btn btn-primary">
            <input type="button" value="수정" onclick="location.href='write.jsp?num=<%=num%>'" class="btn btn-success">
            <input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=num%>'" class="btn btn-danger">
        </div>
    </div>
</div>

</body>
</html>
