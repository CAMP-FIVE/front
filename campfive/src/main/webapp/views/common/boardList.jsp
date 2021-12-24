<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/boardList.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
    <section>
	
	<p id="campinghugi">캠핑후기 게시판</p>
    	<table>
    		<tr>
    			<td colspan="5" style="border:white;text-align:right;"><a href="BoardServlet?command=board_write_form">글 작성하기</a></td>
    		</tr>
    		<tr>
    			<th>글번호</th>
    			<th>글제목</th>
    			<th>작성자</th>
    			<th>작성날짜</th>
    			<th>조회수</th>
    		</tr>
			<c:forEach var="posting" items="${list }">
				<tr>
					<td>${posting.num }</td>
					<td>${posting.title }</td>
					<td>${posting.name }</td>
					<td>${posting.writeDate }</td>
					<td>${posting.readCount }</td>
				</tr>
			</c:forEach>
    	</table>
    </section>
  <jsp:include page="/views/common/footer.jsp"/>    
</body>
</html>