<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/search.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#search-one img{
		width:400px;
		height:300px;
	}
	#search-one{
		width: 100%;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="wrap">
		<div id="search-tab">
			<ul>
				<li><a href="?where=Main&keyword=${keyword}">전체</a> |</li>
				<li class="now"><a onclick="location.reload();">여행지</a> |</li>
				<li><a href="?where=Review&keyword=${keyword}">리뷰</a></li>
			</ul>
			<div>
				인기순
				여행지명 순
			</div>
		</div>
		<hr>
		<div id="search-main">
			<c:choose>
				<c:when test="${keyword eq ''}">
					<!-- 키워드가 없이 검색된 경우 -->
					<h3>검색어를 입력해주세요.</h3>
				</c:when>
				<c:when test="${empty places}">
					<!-- 검색 결과가 없는 경우 -->
					<h3>검색 결과가 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
					<!--검색 내용 존재-->
					<!-- 완전 일치하는 여행지가 있는 경우 -->
					<c:if test="${not empty p}">
						<table class="table" id="search-one">
							<thead>
								<tr>
									<th colspan="4"><h3>${p.placeName}</h3></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2"><img src="${p.filePath}${p.picChange}"></td>
									<td colspan="2">
										<div id="map" style="width:400px;height:300px;"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01fd683c4bc8ef3abbe0ed0b33e36889"></script>
										<script>
											var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
												mapOption = { 
													center: new kakao.maps.LatLng('${p.placeLon}', '${p.placeLat}'), // 지도의 중심좌표
													level: 5 // 지도의 확대 레벨
												};

											var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

											// 마커가 표시될 위치입니다 
											var markerPosition  = new kakao.maps.LatLng('${p.placeLon}', '${p.placeLat}'); 

											// 마커를 생성합니다
											var marker = new kakao.maps.Marker({
												position: markerPosition
											});

											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
										</script>
									</td>
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
									<th>지역</th>
									<td>${p.area}</td>
									<th>여행지 타입</th>
									<td>${p.typeCode}</td>
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
					</c:if>
					<hr>
					<div id="search-list">
						<c:forEach var="i" items="${places}">
							<div>
								<img src="${place.filePath}${place.picChange}">
								<h4>${place.placeName}</h4>
								<p>
									별점 : 
									<c:forEach var="i" begin="1" end="${place.starScore}">
										★
									</c:forEach>
								</p>
							</div>
							<hr>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="search-option">
			<h3>검색 순위</h3>
			<ul>
				<!-- 10개 노출. 공공DB에서 받아온 검색 순위 -->
				<li><span>1</span><a href="#">검색테스트1</a></li>
				<li><span>2</span><a href="#">검색테스트2</a></li>
				<li><span>3</span><a href="#">검색테스트3</a></li>
				<li><span>4</span><a href="#">검색테스트4</a></li>
				<li><span>5</span><a href="#">검색테스트5</a></li>
				<li><span>6</span><a href="#">검색테스트6</a></li>
				<li><span>7</span><a href="#">검색테스트7</a></li>
				<li><span>8</span><a href="#">검색테스트8</a></li>
				<li><span>9</span><a href="#">검색테스트9</a></li>
				<li><span>10</span><a href="#">검색테스트10</a></li>
			</ul>
		</div>
		<script>
			$(function(){
				$('#area-option').on('click','ul>li',function(){
					console.log($(this));
					console.log($(this).hasClass('selected'));
					if($(this).hasClass('selected'))
						$(this).removeClass('selected');
					else
						$(this).addClass('selected');
				})
				console.log('${places}');
			})
		</script>
		<script>
			$(function(){
				var now = new Date();
				var yesterday = getYMD(new Date(now.setDate(now.getDate() - 1)));
				$('#search-option>i').text(yesterday);
			})
			function getYMD(time) {
			    return time.getFullYear() + "-" 
			    		+ ((time.getMonth() + 1) > 9 ? 
			    			(time.getMonth() + 1).toString() : "0" + (time.getMonth() + 1)) 
			    		+ "-" +(time.getDate() > 9 ? 
			    			time.getDate().toString() : "0" + time.getDate().toString());
			}
		</script>
	</div>
</body>
</html>