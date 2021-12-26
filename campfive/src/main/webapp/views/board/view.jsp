<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/views/common/header.jsp" />

<%@ page import= "java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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