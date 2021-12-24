<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updatePwd.css">
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/member.js"></script>
</head>
<body>
	<div id="updatePassword-container">
		<form action="${ pageContext.request.contextPath }/member/updatePwd" method="post">
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td>
						<input type="password" name="userPwd" id="pass1" required>
					</td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="newPwd" id="newPass1" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="newPwd" id="newPass2" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="변경" onclick="return validate();">
						&nbsp;
						<input type="button" value="닫기" onclick="self.close();">
					</td>
				</tr>
			</table>
			<input	type="hidden" name="userId">	
		</form>
	</div>
</body>
</html>












