<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/views/common/header.jsp" />

<style>
    section>div#board-write-container{width:600px; margin:0 auto; text-align:center;}
    section>div#board-write-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    div#comment-container button#btn-insert{width:60px;height:50px; color:white; background-color:#3300FF;position:relative;top:-20px;}
    
    /*댓글테이블*/
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
</style>
<section id="content">   
	<div id="board-write-container">
		<h2>게시판</h2>
		<table id="tbl-board">
			<tr>
				<th>글번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ board.writerId }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${ board.readCount }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${ empty board.originalFileName }">
						<span> - </span>
					</c:if>
					<c:if test="${ !empty board.originalFileName }">
						<img src="${ pageContext.request.contextPath }/resources/images/file.png" width="20" height="20"/>
						<%-- 
						<a href="${ pageContext.request.contextPath }/resources/upload/board/${board.renamedFileName}"
							download=${ board.originalFileName }>
							<c:out value="${ board.originalFileName }" />
						</a>
						--%>
						<a href="javascript:fileDownload('${ board.originalFileName }', '${board.renamedFileName}')">
							<c:out value="${ board.originalFileName }" />
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>${ board.content }</td>
			</tr>
			<%--글작성자/관리자인경우 수정삭제 가능 --%>
			<tr>
				<th colspan="2">
					<c:if test="${ ! empty loginMember && loginMember.id == board.writerId }">
						<button type="button" onclick="location.href='${ pageContext.request.contextPath }/board/update?no=${ board.no }'">수정</button>
						<button type="button" id="btnDelete">삭제</button>
					</c:if>
					
					<button type="button" onclick="location.href='${ pageContext.request.contextPath }/board/list'">목록으로</button>
				</th>
			</tr>
		</table>
		<div id="comment-container">
	    	<div class="comment-editor">
	    		<form action="${ pageContext.request.contextPath }/board/reply" method="POST">
	    			<input type="hidden" name="boardNo" value="${ board.no }">
					<textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>	    			
	    		</form>
	    	</div>
	    </div>
	    <table id="tbl-comment">
	    	<c:forEach var="reply" items="${ board.replies }">
		    	<tr class="level1">
		    		<td>
		    			<sub class="comment-writer"><c:out value="${ reply.writerId }"/></sub>
		    			<sub class="comment-date"><fmt:formatDate type="date" value="${ reply.createDate }"/></sub>
		    			<br>
		    			<c:out value="${ reply.content }"/>
		    		</td>
		    		<td>
		    			<c:if test="${ ! empty loginMember && loginMember.id == reply.writerId }">
	    					<button class="btn-delete">삭제</button>
    					</c:if>
		    		</td>
		    	</tr>
	    	</c:forEach>
	    </table>
    </div>
</section>

<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${ pageContext.request.contextPath }/board/delete?no=${ board.no }");
			}
		})
		
		$("#replyContent").on("focus", (e) => {
			if(${ empty loginMember }) {
				alert("로그인 후 이용해주세요!");
				
				$("#userId").focus();				
			}
		});
	});
	
	function fileDownload(oname, rname) {
		
		// encodeURIComponent()
		//  - 아스키문자(a~z, A~Z, 1~9, ... )는 그대로 전달하고 기타 문자(한글, 특수 문자 등)만 %XX(16진수 2자리)와 같이 변환된다.
		location.assign("${ pageContext.request.contextPath }/board/fileDown?oname=" + encodeURIComponent(oname) + "&rname=" + encodeURIComponent(rname));
	}
</script>

<jsp:include page="/views/common/footer.jsp" />
<%@ page import= "java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%-- <%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .div11{
        margin-left: 800px;
    }
    .write{
        background-color: gainsboro;
        color: black;
        font-size: large;
    }


    
	div#board-write-container
	{
		width:600px;
		margin:0 auto;
		text-align:center;
	}
	
	div#board-write-container h2
	{
		margin:10px 0;
	}
	
	table#tbl-board
	{
		width:500px;
		margin:0 auto;
		border:1px solid black;
		border-collapse:collapse;
	}
	
	table#tbl-board th
	{
		width:125px;
		border:1px solid;
		padding:5px 0;
		text-align:center;
	}
	
	table#tbl-board td
	{
		border:1px solid;
		padding:5px 0 5px 10px;
		text-align:left;
	}
</style>
</head>
<body>

<section>
    <div id="container">
        <header id="header">
            <br>
            <div id="title">
                <h1>캠핑을 가보자!</h1>
            </div>

        <br>

          <div id='board-write-container'>
            <h2>게시글 작성</h2><br>
                <form action="${ pageContext.request.contextPath }/board/view"  >
                    <table id='tbl-board''>
                        <tr>
                            <th>캠핑장명</th>
                               <td>${board.campName }</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                                <td>${board.phone }</td>
                        </tr>
                        <tr>
                            <th>캠핑장주소</th>
                               <td>${board.address }</td>
                        </tr>
                        <tr>
                            <th>캠핑장유형</th>
                               <td>${board.type }</td>
                        </tr>
                        <tr>
                            <th>운영기간</th>
                                <td>${board.operating_Season }</td>
                        </tr>
                        <tr>
                            <th>운영일</th>
                        	<td>${board.operating_Days }</td>
                        </tr>
                        <tr>
                            <th>홈페이지</th>
                        	 <td>${board.hompage }</td>
                        </tr>
                        <tr>
                            <th>예약방법</th>
                            <td>${board.reserv }</td>
                        </tr>
                        <tr>
                            <th>소개</th>
                            <td>${board.about }</td>
                        </tr>
                        
                        <tr>
							<th colspan="2">
								
								
							     <div id="writeBtn">
							     <%-- <c:if test="${ !empty member && Member.no = board.write_No }"> --%>
							   		  
		                       		  		<button type="button">수정</button>
		                       		  		<button type="button" id="btnDelete">삭제</button>
		                       		  <%--</c:if> --%>
		                        			 <button type="button" onclick="location.href='${pageContext.request.contextPath}/board/list'">이전으로</button>
		                    	</div>
		                    	
							</th>
						</tr>
                    </table>

                </form>
        </div>
 	 
 	 <script >
 	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				loaction.replace("${pageContext.request.contextPath}/board/delete?no${board.no}");
			}
		})
	});
 	 </script>
 	 
</section>
</body>
</html>
