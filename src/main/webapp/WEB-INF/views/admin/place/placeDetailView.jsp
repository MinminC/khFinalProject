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
					<th colspan="4"><h3>명왕성</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4"><img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg"></td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						서울 동작구
					</td>
					<th>전화번호</th>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th>위도</th>
					<td>123</td>
					<th>경도</th>
					<td>123</td>
				</tr>
				<tr>
					<td colspan="4" id="tags">
						<span>힐링</span>
						<span>힐링</span>
						<span>힐링</span>
						<span>힐링</span>
						<span>힐링</span>
						<span>힐링</span>
						<span>힐링</span>
						<span>힐링</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<p>
							관광지정보(편익시설, 관광지소개 등)를 제공합니다. 공공데이터 개방 표준데이터 속성정보(표현형식/단위 등)는 [공공데이터 개방 표준]고시를 참고하시기 바랍니다.(정보공유>자료실>법령(고시)/지침) 각 기관에서 등록한 표준데이터를 취합하여 제공합니다. 표준데이터의 갱신주기는 개별 파일마다 다릅니다.(기관에서 등록한 데이터를 취합한 것으로 개별 파일별 갱신시점이 다름)
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="center-btns">
			<button onclick="location.href='list.pl'" class="btn btn-secondary">목록 이동</button>
			<button onclick="location.href='updateForm.pl?pno=1'" class="btn btn-warning">수정</button>
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
				<button type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		  </div>
		</div>
	  </div>
</body>
</html>