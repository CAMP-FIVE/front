<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/boardDetail.css" rel="stylesheet">
    <title>게시글 상세조회</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
	
    <div id="div1">
    
    	<h3 style="color: green;">상세조회</h3>

    <hr align="left" style="border: solid 1px darkgreen; width:85%;">
    <br>
    
    <table border="1px" id="tb">
    	<c:if test="${ empty list }">
			<tr>
				<td style="text-align: center;">조회된 게시글이 없습니다.</td>
			</tr>
			</c:if>
		<c:if test="${ !empty list }">
		<c:forEach var="board" items="${ list }">
        <tr>
            <th>제목</th>
            <td>${ board.title }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${ board.id }</td>
        </tr>
        <tr>
            <th>작성시간</th>
            <td>${ board.creat_date }</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${ board.readCount }</td>
        </tr>
        <tr>
            <th height="300px;">내용</th>
            <td>${ board.content }</td>
        </tr>
        </c:forEach>
        </c:if>
    </table>
    </div>
    
        <center><button id="btn" onclick="history.back();">목록</button></center>
	<br>
 
  <jsp:include page="/views/common/footer.jsp"/>

</body>
</html>