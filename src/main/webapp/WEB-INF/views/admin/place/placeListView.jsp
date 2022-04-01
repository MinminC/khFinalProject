<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-여행지 목록</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-styleSheet.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
	<div id="wrap">
		<h1>여행지 관리</h1>
		<br>
		<div class="float-left">
			<button class="btn btn-firstclass" onclick="location.href='insertForm.pl'">등록</button>
		</div>
		<div style="float:right;">
			<form action="search.pl" id="searchForm">
				<select name="type" class="form-control">
					<option value="name">여행지 명</option>
					<option value="tag">태그</option>
				</select>
				<input type="search" class="form-control" name="keyword">
				<button class="btn btn-secondary btn-firstclass">검색</button>
			</form>
		</div>
		<br clear="both">
		<br>
		<table class="table" id="placeList">
			<thead>
				<tr>
					<th style="width:80px;">번호</th>
					<th style="width:200px;">여행지 명</th>
					<th style="width:80px;">시, 도</th>
					<th style="width:220px;">주소</th>
					<th style="width:80px;">타입</th>
					<th>태그</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr><th colspan="6">결과가 존재하지 않습니다.</th></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" items="${list}">
							<tr onclick="location.href='detail.pl?placeNo=${i.placeNo}'">
								<td>${i.placeNo}</td>
								<td>${i.placeName}</td>
								<td>${i.area}</td>
								<td>${i.placeAddress}</td>
								<td>${i.typeCode}</td>
								<td>${i.placeTags}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<!--pagination-->
		<ul class="pagination">
			<c:if test="${pi.currentPage != 1}">
				<li class="page-item"><a class="page-link" href="list.pl?pageNo=${pi.currentPage - 1}">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<li class="page-item"><a class="page-link" href="list.pl?&pageNo=${i}">${i}</a></li>
				<!--해당되는 번호에 클래스 active 넣어주기!-->
			</c:forEach>
			<c:if test="${pi.currentPage lt pi.maxPage}">
				<li class="page-item endPage"><a class="page-link" href="list.pl?pageNo=${pi.currentPage + 1}">&gt;</a></li>
			</c:if>
		</ul>
	</div>
	<c:if test="${not empty keyword}">
		<script>
			$('.pagination li').attr('href', 'search.pl?keyword=${keyword}&pageNo=${i}');
			$('.pagination .firstPage').attr('href', 'search.pl?keyword=${keyword}&pageNo=${pi.currentPage - 1}')
			$('.pagination .endPage').attr('href', 'search.pl?keyword=${keyword}&pageNo=${pi.currentPage + 1}')
		</script>
	</c:if>
	<script type="text/javascript" src="resources/js/place.js"></script>
</body>
</html>