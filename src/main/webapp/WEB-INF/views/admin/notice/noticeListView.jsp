<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 목록</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-notice.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp" />
<div id="wrap" style="margin-top:200px;">
	<table class="table" id="notice-list">
		<thead>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<!-- 구분으로 선택해서 filter -->
				<th>제목</th>	
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="list.isEmpty()">
					<tr><td>공지사항이 존재하지 않습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" items="${list}">
						<!-- 중요 공지 상단, 중요 표시 -->
						<tr>
							<td>${i.noticeNo}</td>
							<td>${i.category}</td>
							<td>${i.noticeTitle}</td>
							<td>${i.createDate}</td>
							<td>${i.views}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<!--pagination-->
	<ul class="pagination">
		<c:if test="${pi.currentPage != 1}">
			<li class="page-item"><a class="page-link" href="listAdmin.no?pageNo=${pi.currentPage - 1}">&lt;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item"><a class="page-link" href="listAdmin.no?keyword=${keyword}&pageNo=${i}">${i}</a></li>
			<!--해당되는 번호에 클래스 active 넣어주기!-->
		</c:forEach>
		<c:if test="${pi.currentPage != pi.maxPage}">
			<li class="page-item endPage"><a class="page-link" href="listAdmin.no?pageNo=${pi.currentPage + 1}">&gt;</a></li>
		</c:if>
	</ul>
	<a href="insertForm.no" class="btn btn-secondary">등록</a>
	<div class="notice-search">
		<form action="searchAdmin.no" method="get">
			<select name="type">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="keyword">
			<input type="submit" value="검색">
		</form>
	</div>
	<script>
		$(function(){
			//상세조회 tr 누를 시 상세조회 들어가기!!
			$('#notice-list tbody>tr').click(function(){
				var loc = $(this).children('td').eq(0).text();
				location.href='detailAdmin.no?noticeNo='+loc;
				console.log(loc);
			})
		})
		
	</script>
	<c:if test="${not empty keyword}">
		<script>
			$('.pagination li').attr('href', 'searchAdmin.no?keyword=${keyword}&pageNo=${i}');
			$('.pagination .firstPage').attr('href', 'searchAdmin.no?keyword=${keyword}&pageNo=${pi.currentPage - 1}')
			$('.pagination .endPage').attr('href', 'searchAdmin.no?keyword=${keyword}&pageNo=${pi.currentPage + 1}')
		</script>
	</c:if>
</div>
</body>
</html>