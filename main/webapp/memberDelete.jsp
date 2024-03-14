<%@page import="mvjsp.board.model.Member"%>
<%@page import="mvjsp.board.dao.MemberDao"%>
<%@page import="mvjsp.jdbc.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String memberId = (String) session.getAttribute("MEMBERID");
if (memberId == null) {
	response.sendRedirect("login.jsp"); 
	return;
}

// 게시물 작성자와 현재 로그인된 사용자의 아이디를 비교하여 접근 권한 확인
String memberno = request.getParameter("memberno");
Connection conn = ConnectionProvider.getConnection();
MemberDao dao = MemberDao.getInstance();
Member member = dao.select(conn, Integer.parseInt(memberno));

//게시물 작성자와 현재 로그인된 사용자의 아이디가 다른 경우 접근 거부
if (!member.getId().equals(memberId)) {
	out.println("<script>alert('본인만 삭제할 수 있습니다.'); history.back();</script>");
	return;
}

dao.delete(conn, Integer.parseInt(memberno));
session.invalidate();
%>

<script>
	alert('삭제가 완료되었습니다.');
	location.href = "index.jsp";
</script>
