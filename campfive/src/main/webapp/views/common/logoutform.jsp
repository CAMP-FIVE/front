<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Response.Write(
	"<script>alert('로그아웃 되었습니다.');</script>"
	);
 	Response.Write(
 	"<script>location.href='index.jsp';</script>");
      <form action="${ path }/logout" method="post">
      </form>

</body>
</html>