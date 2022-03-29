<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자-여행지 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#right-side{
		border:1px solid red;
		width:300px;
		height:200px;
		float:right;
	}
	.float-left{
		width:900px;
		margin-left: 10px;
		margin-right: 20px;
	}
	.float-left>span{
		color:#00c5b1;
	}
	#wrap{
		width:1200px;
		justify-items:center;
		margin: 200px auto 50px auto;
	}
	#wrap>div>h3, #totalCount{
		color:#00c5b1;
		font-weight: 800;
	}
	.sideBar{
		display:inline-block;
		position:absolute;
		background:rgb(240,240,240);
		border:1px solid lightgray;
		border-radius: 5px;
		width:260px;
		height:auto;
		padding:20px;
	}
	.sideBar li{
		margin:5px;
	}
	.btn-firstclass{
		background:#00c5b1 !important;
    	border-color:#00c5b1 !important;
		color:white !important;
	}
	.sideBar>ul{
		padding:0 0 0 5px;
	}
	#kakaomap{
		width:100%;
		height:500px;
	}
	.carousel-item>div{
		display:inline-block;
		height:auto;
		width:280px;
		border:1px solid lightgray;
		border-radius: 5px;
		padding: 5px;
		margin:5px;
		line-height: 40px;
	}
	.carousel-inner img{
		width:260px;
		height:auto;
		border-radius: 5px;
		margin:auto;
	}
	.carousel-inner h4{
		font-weight: 800;
		display:inline-block;
		font-size:16px;
		margin:0;
	}
	.carousel-inner span{
		float:right;
		font-size:12px;
		color:gray;
	}
	.carousel-inner{
		text-align: center;
	}
	.title{
		text-align: center;
	}
	.btn-go{
		background:#009688 !important;
		width:100%;
		color:white !important;
		cursor:pointer;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div class="title">
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
					<h6>총 <span id="totalCount"></span>개 여행지</h6>
					<div id="demo" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<!-- 필수가 아닌지 없어도 진행 가능함 -->
							<!-- <li data-target="#demo" data-slide-to="0" class="active"></li> -->
						</ul>

						<!-- The slideshow -->
						<div class="carousel-inner">
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev" style="left:-65px;">
							<button type="button" class="btn btn-dark">&lt;</button>
						</a>
						<a class="carousel-control-next" href="#demo" data-slide="next" style="right:-65px;">
							<button type="button" class="btn btn-dark">&gt;</button>
						</a>
					</div>
					<!-- <div id="summary"></div> -->
				</c:otherwise>
			</c:choose>
		</div>
		<div class="sideBar">
			<div class="btn btn-go" onclick="ajaxPlaceList(1);">검색하기</div>
			<!--해당 부분은 DB에서 가져오는 것-->
			<ul id="area-option">
				<li class="btn btn-light btn-firstclass">전체</li>
				<c:forEach var="i" items="${area}">
					<li class="btn btn-light">${i.sido}</li>
				</c:forEach>
			</ul>
			<hr>
			<!-- 태그를 4개 올리는 곳 -->
			<h5 style="text-align: center;">태그 랜덤 10개</h5>
			<ul id="tags-option"></ul>
		</div>
		<br style="clear:both;" /><br>
	</div>
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
				if($(this).hasClass('btn-firstclass')){
					$(this).removeClass('btn-firstclass');
				}
				else{
					$(this).addClass('btn-firstclass');
					$(this).siblings().removeClass('btn-firstclass');
				}
			});
			
			ajaxPlaceList(1);

			//여행지 클릭하면 이동하기
			$('.carousel-inner').on('click','.carousel-item>div',function(){
				location.href='detailView.pl?placeNo='+$(this).children('input').val();
			})
			// 날씨 조회
			// 잘나오는것 확인 but 조회에 드는 데이터가 많아서 주석처리->실제 작업 시 주석 풀기
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
						value += ' '+list[i].sido+' '+list[i].temperatureMin+'°C/'+list[i].temperatureMax+'°C '+list[i].humidity+'%&nbsp;&nbsp;&nbsp;&nbsp;';
					}
					$('marquee').html(value);
				}
			})
		})
	</script>
	<script>
		//사용자-여행지 태그로 조회해오기
		function ajaxPlaceList(pageNo){
			var area = $('#area-option .btn-firstclass').text();
			var tag = $('#tags-option .btn-firstclass').text();
			$.ajax({
				url:'select.pl',
				data:{
					'tag': tag,
					'area': area
				},
				success:function(list){
					var result = '';
					var tags = '';
					//선택된게 있으면 맨 상단에 위치
					if(tag != '')
						tags += '<li class="btn btn-light btn-firstclass">'+tag+'</li>';
					if(list.length == 0){
						result = '검색 결과가 존재하지 않습니다.';
					}
					else{
						var tagSet = new Set();//중복된 태그를 제거하기위해 set 사용
						for(var i=0; i<list.length; i++){
							if(i == 0)
								result += '<div class="carousel-item active">'
							else if(i%3 == 0)
								result += '<div class="carousel-item">'
									
							result += '<div><input type="hidden" value="'+list[i].placeNo+'"><img src="'
										+list[i].filePath+list[i].picChange+'">'
										+'<h4>'+list[i].placeName+'</h4>'
										+'<span>';
							var star = list[i].starScore;
							if(star==0){
								result +='별점 정보 없음';
							}
							else{
								for(var j=0; j<star; j++){
									result += '★';
								}
							}
							result += '</span></div>';

							if(i%3 == 2)
								result += '</div>'

							var tagArr = list[i].placeTags.split(',');
							
							for(var j = 0; j<tagArr.length; j++){
								tagSet.add(tagArr[j]);
							}
						}
						//tagSet 중에서 랜덤 10개만 노출
						var tagASet = Array.from(tagSet);//set을 Array로 다시 변환하여 인덱스를 부여
						var random = [];
						var count = 10;
						while(count>0){//Set에서 10개 추출
							var ranNum = Math.floor(Math.random()*tagSet.size);
							if(ranNum == 0 || ranNum == tag)
								count--;
							if(random.indexOf(ranNum)==-1){
								random.push(ranNum);
								count--;
							}
						}
						for(var i=0;i<10;i++){//뽑은 랜덤 10개의 숫자를 인덱스로하는 값으로 가공
							var t = tagASet[random[i]];
							if(t != null)
								tags +='<li class="btn btn-light">'+tagASet[random[i]]+'</li>';
						}
					}
					makeMarker(list);
					$('.carousel-inner').html(result);
					$('#tags-option').html(tags);
					$('#totalCount').html(list.length);
				},
				error:function(){
					alert('AJAX 통신 실패');
				}	
			});
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>