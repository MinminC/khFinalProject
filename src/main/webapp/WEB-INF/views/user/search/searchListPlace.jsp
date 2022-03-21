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
				<li><a href="?where=Review&keyword=${keyword}">리뷰</a></li>
			</ul>
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
					<div id="review-summary">
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