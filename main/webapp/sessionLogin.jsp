<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String password = request.getParameter("email");
   
   boolean login = false;
   String sql = "SELECT count(*) from member where id = ? and email = ?";
   Class.forName("oracle.jdbc.driver.OracleDriver");
   try(
      Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
      PreparedStatement pstmt = conn.prepareStatement(sql);
         
      )  {
      pstmt.setString(1, id);
      pstmt.setString(2, password);
      ResultSet rs = pstmt.executeQuery();
      rs.next();
      if (rs.getInt(1) == 1) { //로그인 성공조건
         login = true;
      }
   } catch(SQLException e) {
      e.printStackTrace();
   }
   
   if (login) {
      session.setAttribute("MEMBERID", id);
      
      Cookie memberIdCookie = new Cookie("MEMBERID", id);
      memberIdCookie.setMaxAge(60);
      response.addCookie(memberIdCookie);
      
      response.sendRedirect("index.jsp"); //로그인 하면 이동
%>
<html>
<head><title>로그인성공</title></head>
<body>

로그인에 성공했습니다.

</body>
</html>
<%
   } else { // 로그인 실패시
%>
<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>
<%
   }
%>