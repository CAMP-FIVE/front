<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet">
<title>Insert title here</title>
</head>


<body>
  <div id="headers">

        <div class="logo">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png">
            <div class="menu">
                <label for="expand-menu"><div>메뉴</div></label>
                <input type="checkbox" id="expand-menu" name="expand-menu" class="inp">
                <ul>
				<c:if test="${ empty loginMember }">
                      <li><a href="${pageContext.request.contextPath}/views/common/loginform.jsp" class="item"><div>로그인</div></a></li>
                      <li><a href="${pageContext.request.contextPath}/views/member/enrollPage.jsp" class="item"><div>회원가입</div></a></li>
                       <li><a href="${pageContext.request.contextPath}/favorite" class="item"><div>찜한목록</div></a></li>
                  <li><a href="${ path }/logout" class="item"><div>로그아웃</div></a></li>
                   </c:if> 
                   <c:if test="${ !empty loginMember }">
                      <li><a href="${pageContext.request.contextPath}/login" class="item"><div>로그인</div></a></li>
                      <li><a href="${pageContext.request.contextPath}/member/enrollUser" class="item"><div>회원가입</div></a></li>
                       <li><a href="${pageContext.request.contextPath}/views/favorite/favorite.jsp" class="item"><div>찜한목록</div></a></li>
                  <li><a href="${ path }/logout" class="item"><div>로그아웃</div></a></li>
                   </c:if>
                </ul>
            </div>
            <form><fieldset><input class="inp" id="text1" type="text" placeholder="검색어를 입력하세요."/><button type="submit" class="btn1"></button>
                <i class="fa fa-search"></i></button></fieldset></form>
            </div>
            <nav>
                <ul id="navi">
                    <li><a href="">캠핑관련정보</a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/views/board/news.jsp">캠핑 소식</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/board/safetyVideo.jsp">캠핑 안전수칙</a></li>
                        </ul>
                    </li>
                    <li><a href="">캠핑장 조회</a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/views/board/list.jsp">캠핑장 검색</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">커뮤니티</a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/views/board/boardList.jsp">캠핑후기</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">마이페이지</a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/views/member/myPage.jsp">회원정보 변경</a></li>
                            <li><a href="">찜한목록 보기</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">고객센터</a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/views/board/notice.jsp">공지사항</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/board/qna.jsp">Q&A</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        </div>
   

</body>
</html>