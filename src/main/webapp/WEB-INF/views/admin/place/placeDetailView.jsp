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
		<table class="table" id="place-detail">
			<thead>
				<tr>
					<th colspan="4"><h3>${p.placeName}</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4"><img src="${p.filePath}${p.picChange}"></td>
				</tr>
				<tr>
					<th>지역</th>
					<td colspan="3">
						${p.placeAddress}
					</td>
				</tr>
				<tr>
					<th>위도</th>
					<td>${p.placeLat}</td>
					<th>경도</th>
					<td>${p.placeLat}</td>
				</tr>
				<tr>
					<td colspan="4" id="tags">
						<c:forEach var="i" items="${tags}">
							<span>${i}</span>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<p>
							${p.placeDes}
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="center-btns">
			<button onclick="location.href='list.pl'" class="btn btn-secondary">목록 이동</button>
			<button onclick="location.href='updateForm.pl?placeNo=${p.placeNo}'" class="btn btn-warning">수정</button>
			<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deletePlace">삭제</button>
		</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="deletePlace">
		<div class="modal-dialog">
		  <div class="modal-content">
		  
			<!-- Modal Header -->
			<div class="modal-header">
			  <h4 class="modal-title"></h4>
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
			  현재 글을 삭제하시겠습니까?
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button onclick="location.href='delete.pl?placeNo=${p.placeNo}'" type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		  </div>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/place.js"></script>
</body>
</html>