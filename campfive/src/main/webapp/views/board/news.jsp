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
    <title>공지사항</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
    <section>
	
	<p id="campinghugi">캠핑소식</p>
    	<table>
    		<tr>
    			<td colspan="5" style="border:white;text-align:right;"><a href="BoardServlet?command=board_write_form">글 작성하기</a></td>
    		</tr>
    		<tr>
    			<th>No</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>등록일</th>
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
    
  <jsp:include page="/views/board/searchForm.jsp"/>    
  <br>  
  <jsp:include page="/views/board/pageBar.jsp"/> 
  <br>   
  <jsp:include page="/views/common/footer.jsp"/>
     
</body>
</html>