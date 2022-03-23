<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/search.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#right-side{
		border:1px solid red;
		width:300px;
		height:200px;
		float:right;
	}
	.float-left{
		width:1000px;
	}
	.float-left>span{
		color:#00c5b1;
	}
	#wrap{
		text-align: center;
		width:1200px;
		justify-items:center;
		margin: 200px auto 200px auto;
	}
	#wrap>div>h3{
		color:#00c5b1;
		font-weight: 800;
	}
	.float-right{
		display:inline-block;
		position:absolute;
		background:rgb(240,240,240);
		border:1px solid lightgray;
		border-radius: 5px;
		width:260px;
		height:auto;
		padding:20px;
	}
	.float-right li{
		margin:5px;
	}
	.btn-firstclass{
		background:#009688 !important;
    	border-color:#009688 !important;
		color:white !important;
	}
	.float-right>ul{
		padding:0;
	}
	#kakaomap{
		width:100%;
		height:500px;
	}
	#summary>div{
		display:inline-block;
		height:auto;
		width:280px;
		border:1px solid lightgray;
		border-radius: 5px;
		padding: 5px;
		margin:10px;
	}
	#summary img{
		width:260px;
		height:auto;
		border-radius: 5px;
	}
	#summary h4{
		font-weight: 800;
		display:inline-block;
		font-size:12px;
	}
	#summary span{
		float:right;
	}
</style>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/notice.css"> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div>
			<h1>여행지</h1>
			<h3 style="color:#00c5b1; font-weight: 800;">선호 여행지 선택</h3>
			<p>
				지역별/태그별 조회가 가능합니다.<br>
				태그는 검색 결과에서 20개가 랜덤으로 표시됩니다.
			</p>
			<hr>
				<marquee></marquee>
			<hr>
		</div>
		
		<hr>
		<div id="search-main" class="float-left">
			<c:choose>
				<c:when test="${keyword eq ''}">
					<!-- 키워드가 없이 검색된 경우 : 키워드를 입력해주세요 -> 이거 하나만 뜸 -->
					<!-- 다른 경우는 있을까? 오류의 경우? -->
					<h3>검색어를 입력해주세요.</h3>
				</c:when>
				<c:otherwise>
					<!--검색 내용 존재-->
					<div id="kakaomap">
						<div id="map" style="width:100%;height:100%;"></div>
	
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01fd683c4bc8ef3abbe0ed0b33e36889"></script>
						<script>
							function makeMarker(list){
								if(list.length == 0){
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
								    mapOption = { 
								        center: new kakao.maps.LatLng( 36.321655, 127.378953), // 지도의 중심좌표->대전
								        level: 13 // 지도의 확대 레벨
								    };
								
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
								}
								else{
									var avgLat=0;
									var avgLon=0;
									//전체 리스트 길이
									var total = list.length; 
									
									for(var i=0;i<total;i++){
										avgLat += list[i].placeLat;
										avgLon += list[i].placeLon;
									}
									//객체로 만들어서 해당하는 것들만 뽑아오기
									avgLat /= total;
									avgLon /= total;
									
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
									    mapOption = { 
									        center: new kakao.maps.LatLng(avgLon, avgLat), // 지도의 중심좌표
									        level: 12 // 지도의 확대 레벨
									    };
									
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									
									// 마커를 표시할 위치와 title 객체 배열입니다 
									var positions = [];
										
									for(var i = 0; i<list.length; i++){
									    positions.push({
									        title: list[i].placeName, 
									        latlng: new kakao.maps.LatLng(list[i].placeLon, list[i].placeLat)
									    })
									}
									
									// 마커 이미지의 이미지 주소입니다
									var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
									    
									for (var i = 0; i < positions.length; i ++) {
									    
									    // 마커 이미지의 이미지 크기 입니다
									    var imageSize = new kakao.maps.Size(24, 35); 
									    
									    // 마커 이미지를 생성합니다    
									    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									    
									    // 마커를 생성합니다
									    var marker = new kakao.maps.Marker({
									        map: map, // 마커를 표시할 지도
									        position: positions[i].latlng, // 마커를 표시할 위치
									        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
									        image : markerImage // 마커 이미지 
									    });
									}
								}
							}
						</script>
					</div>
					<hr>
					<div id="summary"></div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="float-right">
			<button onclick="ajaxPlaceList(1);">검색하기</button>
			<!--해당 부분은 DB에서 가져오는 것-->
			<ul id="area-option">
				<li class="btn btn-light btn-firstclass">전체</li>
				<c:forEach var="i" items="${area}">
					<li class="btn btn-light">${i.sido}</li>
				</c:forEach>
			</ul>
			<hr>
			<!-- 태그를 4개 올리는 곳 -->
			<ul id="tags-option"></ul>
		</div>
	</div>
	<br style="clear:both;" />
	<script>
		$(function(){
			//지역 선택
			$('#area-option').on('click','li',function(){
				if($(this).hasClass('btn-firstclass') && $(this).text() != '전체'){
					$(this).removeClass('btn-firstclass');
					$(this).siblings().eq(0).addClass('btn-firstclass');
				}
				else{
					$(this).addClass('btn-firstclass');
					$(this).siblings().removeClass('btn-firstclass');
				}
			});
			//태그 선택
			$('#tags-option').on('click','li',function(){
				if($(this).hasClass('btn-firstclass'))
					$(this).removeClass('btn-firstclass');
				
				else
					$(this).addClass('btn-firstclass');
			});
			
			ajaxPlaceList(1);

			// 날씨 조회
			/* 잘나오는것 확인 but 조회에 드는 데이터가 많아서 주석처리->실제 작업 시 주석 풀기
			$.ajax({
				url:'weather',
				success:function(list){
					value = '';
					for(var i = 0; i<list.length; i++){
						var rain = list[i].rain;
						var sky = list[i].sky;
						switch(rain){
							case '3': value += '<i class="fas fa-snowflake" />';
							break;
							case '2': value += '<i class="fas fa-cloud-rain" />';
							break;
							case '1': value += '<i class="fas fa-cloud-showers-heavy" />';
							break;
							default: switch(sky){
										case '4': value += '<i class="fas fa-smog" />';
										break;
										case '3': value += '<i class="fas fa-cloud" />';
										break;
										case '2': value += '<i class="fas fa-cloud-sun" />';
										break;
										default: value += '<i class="fas fa-sun" />';
									}
						}
						value += ' '+list[i].sido+' '+list[i].temperatureMin+'°C/'+list[i].temperatureMin+'°C '+list[i].humidity+'%&nbsp;&nbsp;&nbsp;&nbsp;';
					}
					$('marquee').html(value);
				}
			})*/
		})
	</script>
	<script src="resources/js/place.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>