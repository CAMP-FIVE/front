<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/enrollPage.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="/views/common/header.jsp"/>

<section>
    <div class="wrap">
        <div id="user">
            <img src="../../resources/images/userEnroll.png" alt="" width="150px"><br><br>
            <button onclick="location.href='${ pageContext.request.contextPath }/views/member/enrollUser.jsp'">일반 회원 가입</button>
        </div>
        
        <div id="business">
            <img src="../../resources/images/businessEnroll.png" alt="" width="150px"><br><br>
            <button onclick="location.href='${ pageContext.request.contextPath }/views/member/enrollBusiness.jsp'">사업자 회원 가입</button>
        </div>
    </div>
</section>

<script>
	
</script>
  <jsp:include page="/views/common/footer.jsp"/>    
</body>
</html>
