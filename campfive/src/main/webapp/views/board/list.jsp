<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="/resources/css/list.css" type="text/css">
<script src="/resources/js/jquery-3.6.0.js"></script> 
<script src="/resources/js/popup.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>Insert title here</title>

</head>

<body>
	<section>
        <div id="popup">
            <div id="popmenu">
                <div class="checkdiv"> 
                    <label for="1a" id="la"><input id="1a" type="checkbox">test</label>
                    <label for="1b"><input id="1b" type="checkbox">test</label>
                    <label for="1c"><input id="1c" type="checkbox">test</label>
                    <label for="1d"><input id="1d" type="checkbox">test</label>
                    <label for="1e"><input id="1e" type="checkbox">test</label>
                    <label for="1f"><input id="1f" type="checkbox">test</label>
                </div>
                <div class="checkdiv">test
                    <label for="2a"><input id="2a" type="checkbox">test</label>
                    <label for="2b"><input id="2b" type="checkbox">test</label>
                    <label for="2c"><input id="2c" type="checkbox">test</label>
                    <label for="2d"><input id="2d" type="checkbox">test</label>
                    <label for="2e"><input id="2e" type="checkbox">test</label>
                    <label for="2f"><input id="2f" type="checkbox">test</label>
                </div>
                <div class="checkdiv">test
                    <label for="3a"><input id="3a" type="checkbox">test</label>
                    <label for="3b"><input id="3b" type="checkbox">test</label>
                    <label for="3c"><input id="3c" type="checkbox">test</label>
                    <label for="3d"><input id="3d" type="checkbox">test</label>
                    <label for="3e"><input id="3e" type="checkbox">test</label>
                    <label for="3f"><input id="3f" type="checkbox">test</label>
                </div>
                <div class="checkdiv">test
                    <label for="4a"><input id="4a" type="checkbox">test</label>
                    <label for="4b"><input id="4b" type="checkbox">test</label>
                    <label for="4c"><input id="4c" type="checkbox">test</label>
                    <label for="4d"><input id="4d" type="checkbox">test</label>
                    <label for="4e"><input id="4e" type="checkbox">test</label>
                    <label for="4f"><input id="4f" type="checkbox">test</label>
                </div>
                <div class="sub">선택</div>
                <div class="exit">닫기</div>
            </div>
        </div>

      <section id="sec1">
	<button id="btnsearch">상세검색</button>
    <div id="select_box" style="border: 1px solid mediumseagreen">
        <div id="select_contents">
            <p class="ptag1">키워드 검색 <input type="text" class="inp1"></p>
            <p class="ptag1">도시/군/구 <select name="addressRegion" id="addressRegion2"></select>
                <select name="addressDo" id="addressDo2"></select>
                <select name="addressSiGunGu" id="addressSiGunGu2"></select>
                <p class="ptag1">테마별<input type="text" id="themainput" class="inp1"><button id="btn" herf="#">검색</button></p>
                <script src="/resources/js/selectbox.js"></script>
                </p>
            </div>
        </div>
    </section>
   
	

		<div class="div3">

			<table class="tab1">
				<c:if test="${ !empty list }">
					<tr>
						<th class="th1">썸네일</th>
						<th class="th2" colspan="2">제목/ 내용</th>
						<th class="th3">작성자 / 작성일</th>
						<th class="th4">조회</th>
					</tr>

					<c:forEach var="board" items="${ list }">
						<tr>
							<td rowspan="2"></td>

							<td colspan="2">
								<a href="${ pageContext.request.contextPath }/board/view?no=${board.write_No}">${board.campName }</a>
							</td>
							<td>${board.phone }</td>
							<td rowspan="2">${board.address }</td>
						</tr>
						<tr>
							<td colspan="2">${board.about }</td>
							<td>${board.type }</td>
						</tr>
					</c:forEach>
				</c:if>

			</table>

			<div id="pageBar">
				<!-- 맨 처음으로 -->
				<button
					onclick="location.href='${ pageContext.request.contextPath }/board/list?page=1'">&lt;&lt;</button>

				<!-- 이전 페이지로 -->
				<button
					onclick="location.href='${pageContext.request.contextPath }/board/list?page=${pageInfo.prevPage }'">&lt;</button>

				<!--  10개 페이지 목록 -->
				<c:forEach begin="${pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${status.current == pageInfo.currentPage }">
						<button disabled>${ status.current }</button>
					</c:if>

					<c:if test="${status.current != pageInfo.currentPage }">
						<button
							onclick="location.href='${pageContext.request.contextPath }/board/list?page=${status.current }'">${ status.current }</button>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지로 -->
				<button
					onclick="location.href='${pageContext.request.contextPath }/board/list?page=${pageInfo.nextPage }'">&gt;</button>

				<!-- 맨 끝으로 -->
				<button
					onclick="location.href='${pageContext.request.contextPath }/board/list?page=${pageInfo.maxPage }'">&gt;&gt;</button>
			</div>


		</div>

	</section>
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>