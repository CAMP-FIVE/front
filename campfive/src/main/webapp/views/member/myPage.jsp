<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css">
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/member.js"></script>
</head>
<body>
<jsp:include page="/views/common/header.jsp"/>
<section id="content">
	<div id="myPageTitle">회원 정보 수정</div>
    <div class="wrap">
        <div id="view-container">
            <form id="memberFrm" action="${ pageContext.request.contextPath }/member/update" method="post">
                <table id="myPageTable">
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" name="userId" id="newId" 
                                value="${ loginMember.id }" readonly required >
                        </td> 	
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" name="userName" id="userName" 
                                value="${ loginMember.name }" readonly required>				
                        </td> 	
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>
                            <input type="text" name="userNickname" id="userNickname" 
                                value="${ loginMember.nickname }" required>				
                        </td> 	
                    </tr>
                    <tr>
                        <th>휴대폰</th>
                        <td>
                            <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" 
                                value="${ loginMember.phone }" maxlength="11">
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <input type="email" placeholder="abc@abc.com" name="email" id="email"
                                value="${ loginMember.email }" >												
                        </td> 	
                    </tr>
                </table>

                <div id="btn1">
                    <button type="button" id="updatePwd">비밀번호변경</button>
                    <input type="submit" value="정보수정">
                    <input type="button" id="btnDelete" value="탈퇴">
                </div>
            </form>
        </div>
	</div>
 </section>
   <jsp:include page="/views/common/footer.jsp"/>    
 </body>
</html>