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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div style="text-align: center;">
			<h1>여행지</h1>
			<h3 style="color:#00c5b1; font-weight: 800;">선호 여행지 선택</h3>
			<p>
				지역별/태그별 조회가 가능합니다.
			</p>
		</div>
		<div>
			<hr>
				<marquee></marquee>
			<hr>
		</div>
		<script>
			$(function(){/* 잘나오는것 확인 but 조회에 드는 데이터가 많아서 주석처리->실제 작업 시 주석 풀기
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
							function makeMarker(list){
								if(list.length == 0){
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
								    mapOption = { 
								        center: new kakao.maps.LatLng( 36.321655, 127.378953), // 지도의 중심좌표
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
					<h3 class="title">여행지</h3>
					<div id="place-summary"></div>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="right-side">
			<!--해당 부분은 DB에서 가져오는 것-->
			<ul id="area-option">
				<li class="selected">전체</li>
				<c:forEach var="i" items="${area}">
					<li>${i.sido}</li>
				</c:forEach>
			</ul>

			<!-- 태그를 4개 올리는 곳 -->
			<ul id="tags-option"></ul>
		</div>
		
		<!-- 필터 조건 1. areacode, 조건2. typecode -->
		<script>
			$(function(){
				//지역 선택
				$('#area-option').on('click','ul>li',function(){
					if($(this).hasClass('selected')){
						$(this).removeClass('selected');
						$(this).siblings().eq(0).addClass('selected');
					}
					else{
						$(this).addClass('selected');
						$(this).siblings().removeClass();
					}
					ajaxPlaceList(1);
				});
				
				//태그 선택
				$('#tags-option').on('click','ul>li',function(){
					if($(this).hasClass('selected'))
						$(this).removeClass('selected');
					
					else
						$(this).addClass('selected');
					
					ajaxPlaceList(1);
				});
				
				ajaxPlaceList(1);
			})
			
			function ajaxPlaceList(pageNo){
				var area = $('#area-option .selected').text();
				var tag = $('#tags-option .selected').text();
				
				$.ajax({
					url:'select.pl',
					data:{
						'tag': tag,
						'area': area
					},
					success:function(list){
						var result = '';
						var tags = '';
						
						if(list.length == 0){
							result = '검색 결과가 존재하지 않습니다.';
						}
						else{
							var tagSet = new Set();
							for(var i=0; i<list.length; i++){
								result += '<div><img src="'+list[i].filePath+list[i].picChange+'">'
											+'<h4>'+list[i].placeName+'</h4>'
											+'<p>별점 : ★★☆</p></div>';
											
								
								var tagArr = list[i].placeTags.split(',');
								
								for(var j = 0; j<tagArr.length; j++){
									tagSet.add(tagArr[j]);
								}
							}
							tagSet.forEach(function(value){
								tags +='<li>'+value+'</li>';
							})
						}
						makeMarker(list);
						$('#place-summary').html(result);
						$('#tags-option>ul').html(tags);
					},
					error:function(){
						alert('실패');
					}	
				});
			}
		</script>
	</div>
	<br style="clear:both;" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>