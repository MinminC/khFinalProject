<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-place.css">
</head>
<body>
	<div id="menubar"><jsp:include page="/WEB-INF/views/common/sideBar.jsp"/></div>
	<div id="wrap">
		<div id="tab">
			<div id="btns">
				<button class="btn btn-primary" onclick="location.href='insertForm.pl'">등록</button>
			</div>
			<div id="search-bar">
				<form action="">
					<select name="type">
						<option value="name">여행지 명</option>
						<option value="tag">태그</option>
					</select>
					<input type="text" name="keyword">
					<button class="btn btn-secondary">검색</button>
				</form>
			</div>
		</div>
		<br>
		<table class="table" id="placeList">
			<thead>
				<tr>
					<th>번호</th>
					<th>여행지 명</th>
					<th>시, 도</th>
					<th>주소</th>
					<th>타입</th>
					<th>태그</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list}">
					<tr>
						<td>${i.placeNo}</td>
						<td>${i.placeName}</td>
						<td>${i.area}</td>
						<td>${i.placeAddress}</td>
						<td>${i.typeCode}</td>
						<td>${i.placeTags}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!--pagination-->
		<ul class="pagination">
			<c:if test="${pi.currentPage != 1}">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			</c:if>
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<li class="page-item"><a class="page-link" href="#">${i}</a></li>
				<!--해당되는 번호에 클래스 actice 넣어주기!-->
			</c:forEach>
			<c:if test="${pi.currentPage != pi.maxPage}">
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</c:if>
		</ul>
	</div>
	<script>
		$('#placeList').on('click','tbody>tr',function(){
			location.href='detail.pl';
		})

	</script>
<script type="text/javascript" src="../../../../resources/js/place.js"></script>
</body>
</html>