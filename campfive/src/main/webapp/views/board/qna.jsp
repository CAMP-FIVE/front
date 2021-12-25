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
    <title>Q&A</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
    <section>
	
	<p id="campinghugi">Q&A</p>
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
			<c:forEach var="qna" items="${ list }">
				<tr>
					<td>${ qna.no }</td>
					<td>
						<a href="${ pageContext.request.contextPath }/board/qnaview?no=${ qna.no }">
								${ qna.title }
						</a>
					</td>
					<td>${ qna.id }</td>
					<td>${ qna.create_date }</td>
					<td>${ qna.hit }</td>
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