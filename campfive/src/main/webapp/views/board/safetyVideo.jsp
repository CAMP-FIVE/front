<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/safetyVideo.css" rel="stylesheet">
    <title>안전수칙동영상</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
					<br>
					<div id="div1">
                    <table id="tb">
                        <tr>
                            <td><iframe width="360" height="200" src="https://www.youtube.com/embed/D2jdnjSEC1A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
                            <td><p><b><a href="https://youtu.be/D2jdnjSEC1A">동절기 캠핑 안전수칙!</a></b></p></td>
                        </tr>
                        <tr>
                            <td><iframe width="360" height="200" src="https://www.youtube.com/embed/NQt_Mem-S6Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
                            <td><p><b><a href="https://youtu.be/NQt_Mem-S6Y">과태료 피하면서 캠핑하는 방법!</a></b></p></td>
                        </tr>
                    </table>
					</div>
  <jsp:include page="/views/board/pageBar.jsp"/> 
  <br>   
  <jsp:include page="/views/common/footer.jsp"/>
     
</body>
</html>