<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-styleSheet.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp" />
<div id="wrap">
	<h1>공지사항 수정</h1>
	<br>
	<form action="update.no" method="post">
	<input type="hidden" name="noticeNo" value="${n.noticeNo}">
		<table class="table">
			<tr>
				<th style="width:150px;">구분</th>
				<td style="width:100px;">
					<select name="category" class="form-control" style="width:200px;">
						<c:forEach var="i" items="${category}">
							<c:choose>
								<c:when test="${i.CATEGORY_CONTENT eq n.category}">
									<option value="${i.CATEGORY_NO}" selected>${i.CATEGORY_CONTENT}</option>
								</c:when>
								<c:otherwise>
									<option value="${i.CATEGORY_NO}">${i.CATEGORY_CONTENT}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
				<th style="width:150px;">제목</th>
				<td style="width:800px;"><input type="text" style="width:800px;" name="noticeTitle" class="form-control" value="${n.noticeTitle}" required></td>
			</tr>
			<tr>
				<th colspane="4">본문</th>
			</tr>
			<tr>
				<td colspan="4">
					<script type="text/javascript" src="resources/js/service/HuskyEZCreator.js" charset="utf-8"></script>
					<textarea name="noticeContent" id="ir1" rows="10" cols="120" required>${n.noticeContent}</textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "ir1",
						 sSkinURI: "resources/SmartEditor2Skin.html",
						 fCreator: "createSEditor2"
						});
						
						function submitContents(elClickedObj) {
							oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
							if(document.getElementById("ir1").value.length>4000){
								alert('4000 Byte 까지만 작성 가능합니다. 확인해주세요.');
								return false;
							}
							return true;
						}
					</script>
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-firstclass" onclick="return submitContents();">수정하기</button>
		<button class="btn btn-secondary" onclick="history(back);">뒤로가기</button>
	</form>
</div>
</body>
</html>