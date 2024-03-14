<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String remember = request.getParameter("remember");

// 쿠키 생성
if (remember != null && remember.equals("on")) {
    Cookie cookie = new Cookie("id", id);
    cookie.setMaxAge(3600);
    response.addCookie(cookie);
} else {
    Cookie cookie = new Cookie("id", null);
    cookie.setMaxAge(0); // 쿠키 삭제
    response.addCookie(cookie);
}
response.sendRedirect("index.jsp"); // 로그인 후 이동할 페이지
%>
