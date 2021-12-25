<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
<title>Insert title here</title>
<div class="slidebox">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<ul class="slidelist">
		<li class="slideitem">
			<a>
				<label for="slide03" class="prev"></label>
				<img src="${pageContext.request.contextPath}/resources/img/camping2.jpeg">
				<label for="slide02" class="next"></label>
			</a>
		</li>
		<li class="slideitem">
			<a>
				<label for="slide01" class="prev"></label>
				<img src="${pageContext.request.contextPath}/resources/img/camping1.webp">
				<label for="slide03" class="next"></label>
			</a>
		</li>
		<li class="slideitem">
			<a>
				<label for="slide02" class="prev"></label>
				<img src="${pageContext.request.contextPath}/resources/img/camping.webp">
				<label for="slide01" class="next"></label>
			</a>
		</li>
	</ul>
</div>

</body>
</html>