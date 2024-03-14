<%@page import="mvjsp.jdbc.connection.ConnectionProvider"%>
<%@page import="mvjsp.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
Connection conn = null;
try {
    conn = ConnectionProvider.getConnection();
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("error.jsp"); // 에러 페이지로 리다이렉트
    return;
}

int num = Integer.parseInt(request.getParameter("num"));
String memberId = (String) session.getAttribute("MEMBERID");

if (memberId == null) {
    response.sendRedirect("sessionLoginForm.jsp");
    return;
}

// 게시글 삭제 
BoardDao dao = BoardDao.getInstance();
if (dao.delete(conn, num, memberId) > 0) {
%>

        <script>
            alert('삭제되었습니다.');
            location.href="blist.jsp";
        </script>

<%
} else {
%>
        <script>
            alert('작성자만 삭제할 수 있습니다.');
            location.href="blist.jsp";
        </script>
<%
}
%>
