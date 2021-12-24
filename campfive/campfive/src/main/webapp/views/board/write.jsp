<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/write.css" rel="stylesheet">
    <title>글쓰기</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
	
				<section>
                    <table id="tb">
                        <tr>
                            <th>작성자</th>
                            <td><input type="text" size="20" style="margin-right:420px;"></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" size="50" style="margin-right:210px;"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea cols="80" rows="20;" style="resize: none;" placeholder="내용을 입력하세요."></textarea></td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td><input type="file" style="margin-right:320px;"></td>
                        </tr>
                    </table>
 			</section>
             	<div id="btn1">
                    <button onclick="history.back();">이전으로</button>
                    <input type="submit" value="등록">
                </div>    
                
  <jsp:include page="/views/common/footer.jsp"/>

</body>
</html>