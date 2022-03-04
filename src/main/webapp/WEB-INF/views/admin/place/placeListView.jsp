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
				<button onclick="location.href='insertForm.pl'">등록</button>
			</div>
			<div id="search-bar">
				<input type="text" name="keyword">
				<button>검색</button>
			</div>
		</div>
		<table class="table" id="placeList">
			<thead>
				<tr>
					<th>번호</th>
					<th>여행지 명</th>
					<th>시, 도</th>
					<th>구, 군</th>
					<th>태그</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<span>1</span>
					</td>
					<td>명왕성</td>
					<td>서울</td>
					<td>동작구</td>
					<td>여행,힐링,캔버스</td>
				</tr>
				<tr>
					<td>
						<span>1</span>
					</td>
					<td>명왕성</td>
					<td>서울</td>
					<td>동작구</td>
					<td>여행,힐링,캔버스</td>
				</tr>
				<tr>
					<td>
						<span>1</span>
					</td>
					<td>명왕성</td>
					<td>서울</td>
					<td>동작구</td>
					<td>여행,힐링,캔버스</td>
				</tr>
				<tr>
					<td>
						<span>1</span>
					</td>
					<td>명왕성</td>
					<td>서울</td>
					<td>동작구</td>
					<td>여행,힐링,캔버스</td>
				</tr>
				<tr>
					<td>
						<span>1</span>
					</td>
					<td>명왕성</td>
					<td>서울</td>
					<td>동작구</td>
					<td>여행,힐링,캔버스</td>
				</tr>
				
			</tbody>
		</table>
		<!--pagination-->
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item active"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
	<script>
		$('#placeList').on('click','tbody>tr',function(){
			location.href='detail.pl';
		})

	</script>
</body>
</html>