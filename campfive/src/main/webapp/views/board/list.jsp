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

<title>Insert title here</title>


</style>

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

    <br>
    
		<div class="div1">
			<div id="contents">캠핑장 상세검색</div>
			<form action="">
				<div class="div2">

					지역 <br> <select name="" id="" onchange="categoryChange(this)" name="searchField">
						<option value>시/도 선택</option>
						<option value="general01">강원</option>
						<option value="general02">경기</option>
						<option value="general03">경남</option>
						<option value="general04">경북</option>
						<option value="general05">광주</option>
						<option value="general06">대구</option>
						<option value="general07">대전</option>
						<option value="general08">부산</option>
						<option value="general09">서울</option>
						<option value="general10">울산</option>
						<option value="general11">인천</option>
						<option value="general12">전남</option>
						<option value="general13">전북</option>
						<option value="general14">제주</option>
						<option value="general15">충남</option>
						<option value="general16">충북</option>
					</select> <select name="" id="state" name="searchField2">
						<option>군/구 선택</option>
					</select>

				</div>

				<br>
				<div class="div2">
					테마 <br> <select name="" id="">
						<option>test</option>
						<option>test</option>
						<option>test</option>
						<option>test</option>
						<option>test</option>

					</select>
				</div>
				<br>
				<div class="div2">
					키워드 검색 <br> <select name="searchField1" id="">
						<option>test</option>
						<option>test</option>
						<option>test</option>
						<option>test</option>
					</select> <select name="searchField2" id="" class="sel2">
						<option>test</option>
						<option>test</option>
						<option>test</option>

					</select> <select name="searchField3" id="" class="sel2">
						<option>test</option>
						<option>test</option>
						<option>test</option>
						<option>test</option>
					</select> <input type="submit">
				</div>
			</form>


		</div>

		<br>
		<br>
		<hr>

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

</body>
</html>