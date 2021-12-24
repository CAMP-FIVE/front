<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
</head>
<body>
    <section id="sec1">
    <div id="select_box" style="border: 1px solid mediumseagreen">
        <div id="select_contents">
            <p class="ptag1">키워드 검색 <input type="text" class="inp1"></p>
            <p class="ptag1">도시/군/구 <select name="addressRegion" id="addressRegion2"></select>
                <select name="addressDo" id="addressDo2"></select>
                <select name="addressSiGunGu" id="addressSiGunGu2"></select>
                <p class="ptag1">테마별<input type="text" id="themainput" class="inp1"><button id="btn" herf="#">검색</button></p>
                <script src="js/selectbox.js"></script>
                </p>
            </div>
        </div>
    </section>
</body>
</html>