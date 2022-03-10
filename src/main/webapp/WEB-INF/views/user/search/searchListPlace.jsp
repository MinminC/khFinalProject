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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="wrap">
		<div id="search-tab">
			<ul>
				<li><a href="?where=Main&keyword=${keyword}">전체</a> |</li>
				<li class="now"><a onclick="location.reload();">여행지</a> |</li>
				<li><a href="?where=Course&keyword=${keyword}">리뷰</a></li>
			</ul>
		</div>
		<div>
			<hr>
				<p>(구름마크)서귀포 10°C &nbsp;&nbsp;&nbsp; (해)동작구 12°C&nbsp;&nbsp;&nbsp; 부산 15°C</p>
			<hr>
		</div>
		<hr>
		<div id="search-main">
			<c:choose>
				<c:when test="${keyword eq ''}">
					<!-- 키워드가 없이 검색된 경우 : 키워드를 입력해주세요 -> 이거 하나만 뜸 -->
					<!-- 다른 경우는 있을까? 오류의 경우? -->
					<h3>검색어를 입력해주세요.</h3>
				</c:when>
				<c:otherwise>
					<!--검색 내용 존재-->
					<h3 class="title">여행지</h3>
					<div id="place">
						<div id="map" style="width:100%;height:100%;"></div>

						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01fd683c4bc8ef3abbe0ed0b33e36889"></script>
						<script>
							var container = document.getElementById('map');
							$(function(){
								loadMap();
							})
							
							function loadMap(){
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								mapOption = { 
									center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
									level: 3 // 지도의 확대 레벨
								};

								// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
								var map = new kakao.maps.Map(mapContainer, mapOption); 
							}
						</script>
					</div>
					<hr>
					<h3 class="title">여행지</h3>
					<div id="course-summary">
						<div>
							<img src="">
							<h4>여행지이름1</h4>
							<p>
								별점 : ★★☆
							</p>
						</div>
						<div>
							<img src="">
							<h4>여행지이름2</h4>
							<p>
								별점 : ★★☆
							</p>
						</div>
						<div>
							<img src="">
							<h4>여행지이름3</h4>
							<p>
								별점 : ★★☆
							</p>
						</div>
						<div>
							<img src="">
							<h4>여행지이름4</h4>
							<p>
								별점 : ★★☆
							</p>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="area-option">
			<ul><!--해당 부분은 DB에서 가져오는 것-->
				<li>전체</li>
				<li>서울</li>
				<li>부산</li>
				<li>대구</li>
				<li>인천</li>
				<li>광주</li>
				<li>대전</li>
				<li>울산</li>
				<li>세종</li>
				<li>경기</li>
				<li>강원</li>
				<li>충북</li>
				<li>충남</li>
				<li>경북</li>
				<li>경남</li>
				<li>전북</li>
				<li>전남</li>
				<li>제주</li>
			</ul>
			<hr>
			<!--숨겨져있다가 대분류 클릭하면 해당하는 GUGUN 이름 가져오기-->
			<ul>
				<li>전체</li>
				<li>서귀포</li>
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
				})
			</script>
		</div>
	</div>
	
</body>
</html>