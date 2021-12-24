<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠핑후기</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/boardList.css">
<style type="text/css">
body {
	line-height: 2.5em;
}
</style>

</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<section>
		<!-- 게시판 제목 -->
		<h1 align="left"
			style="text-shadow: 3px 3px 5px #39796b; color: #004d40;">
			<i>캠핑후기</i>
		</h1>
		<br>
		<c:if test="${ !empty loginMember }">
			<div id="btn">
				<input type="button" id="btn1"
					onClick="location.href='${ pageContext.request.contextPath }/board/review/write'"
					value="글쓰기">
			</div>
		</c:if>
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
			<c:if test="${ empty list }">
				<tr>
					<td colspan="6">조회된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ !empty list }">
				<c:forEach var="review" items="${ list }">
					<tr>
						<td>${ review.no }</td>
						<td>${ review.title }</td>
						<td>${ review.id }</td>
						<td>${ review.create_date }</td>
						<td>${ review.hit }</td>
						<td>-</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</section>

	<!-- 검색 폼 영역 -->
	<jsp:include page="/views/board/searchForm.jsp" />

	<!-- 게시판 페이징 영역 -->
	<jsp:include page="/views/board/pageBar.jsp" />

	<!-- footer 영역 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>

