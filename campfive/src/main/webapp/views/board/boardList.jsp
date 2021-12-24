<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath}/resources/css/boardList.css"
	rel="stylesheet">
<title>Document</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<section>

		<p id="campinghugi">캠핑후기 게시판</p>
		<table>
			<c:if test="${ !empty loginMember }">
				<tr>
					<td colspan="5" style="border: white; text-align: right;"><a
						href="${ pageContext.request.contextPath }/board/write">글 작성하기</a></td>
				</tr>
			</c:if>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
			<c:if test="${ empty list }">
				<tr>
					<td colspan="6">조회된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ !empty list }">
				<c:forEach var="notice" items="${ list }">
					<tr>
						<td>${ notice.no }</td>
						<td>${ notice.title }</td>
						<td>${ notice.id }</td>
						<td>${ notice.create_date }</td>
						<td>${ notice.hit }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<jsp:include page="/views/common/pageBar.jsp" />
	</section>
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>