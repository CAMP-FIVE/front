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
<body>
	<jsp:include page="/views/common/header.jsp"/>
	<section>
	    <div class="loginform">
        <form action="${ path }/login" method="post">
        <p>login</p>
            <input id="input" type="text" name="userId"  placeholder="아이디">
            <input id="input" type="password" name="userPwd" placeholder="비밀번호">
            <input id="input" type="checkbox" name="remember" id="checkbox" class="hidden">
            <input id="input" type="submit" value="LOGIN">
        </form>
        <div class="forgot">
            <a href="${pageContext.request.contextPath}/views/member/enrollPage.jsp">회원가입</a>
            <a href="${pageContext.request.contextPath}/views/member/findId.jsp">아이디 찾기</a>
            <a href="${pageContext.request.contextPath}/views/member/findPwd.jsp">비밀번호 찾기</a>
        </div>
    </div>
	</section>
 <jsp:include page="/views/common/footer.jsp"/> 
    
</body>
</html>