<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/resources/css/loginform.css" rel="stylesheet">
</head>
<body>
	    <div class="loginform">
        <h1>login</h1>
        <form action="${ path }/login" method="post">
            <input type="text" name="userId"  placeholder="아이디">
            <input type="password" name="userPwd" placeholder="비밀번호">
            <input type="checkbox" name="remember" id="checkbox" class="hidden">
            <input type="submit" value="LOGIN">
        </form>
        <div class="forgot">
            <a href="#">회원가입</a>
            <a href="#">아이디 찾기</a>
            <a href="#">비밀번호 찾기</a>
        </div>
    </div>
</body>
</html>