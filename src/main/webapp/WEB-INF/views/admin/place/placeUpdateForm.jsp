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
		<form action="update.pl" method="post">
			<table class="table" id="place-detail">
				<thead>
					<tr>
						<th colspan="4"><input type="text" name="placeName" value="${p.placeName}"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4"><img src="${p.filePath}${p.picChange}"></td>
					</tr>
					<tr>
						<th>지역</th>
						<td colspan="3">
							<input type="text" name="placeAddress" value="${p.placeAddress}">
						</td>
					</tr>
					<tr>
						<th>위도</th>
						<td><input type="text" name="placeLat" value="${p.placeLat}"></td>
						<th>경도</th>
						<td><input type="text" name="placeLon" value="${p.placeLon}"></td>
					</tr>
					<tr>
						<td colspan="4" id="tags">
							<ul>
								<c:forEach var="i" items="${tags}">
									<li>
										<span>${i}</span>
										<i>X</i>    
									</li>
								</c:forEach>
							</ul>
							<input type="text" id="tagNow" value="">
							<input type="hidden" name="placeTags" value="">
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="placeDes" cols="150" rows="10">${p.placeDes}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="center-btns">
				<button type="submit" onclick="return checkIntegrity();" class="btn btn-warning">수정</button>
				<button type="button" onclick="location.href='list.pl'" class="btn btn-secondary">목록 이동</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="resources/js/place.js"></script>
</body>
</html>