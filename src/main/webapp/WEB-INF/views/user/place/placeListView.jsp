<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<div id="map" style="width:100%;height:350px;"></div>
	
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01fd683c4bc8ef3abbe0ed0b33e36889"></script>
						<script>
						
							var avgLat=0;
							var avgLon=0;
							//전체 리스트 길이
							var total = '${fn:length(list)}'; 
							<c:forEach var="i" items="${list}">
								avgLat += ${i.placeLat};
								avgLon += ${i.placeLon};
							</c:forEach>
							//객체로 만들어서 해당하는 것들만 뽑아오기
							avgLat /= total;
							avgLon /= total;
							console.log(avgLat+"K"+avgLon);
							
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
							    mapOption = { 
							        center: new kakao.maps.LatLng(avgLon, avgLat), // 지도의 중심좌표
							        level: 10 // 지도의 확대 레벨
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							 
							// 마커를 표시할 위치와 title 객체 배열입니다 
							var positions = [
								<c:forEach var="i" items="${list}">
								    {
								        title: '${i.placeName}', 
								        latlng: new kakao.maps.LatLng(${i.placeLon}, ${i.placeLat})
								    },
							    </c:forEach>
							    
							    {
							        title: '생태연못', 
							        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
							    },
							    {
							        title: '텃밭', 
							        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
							    },
							    {
							        title: '근린공원',
							        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
							    }
							];
							
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
						</script>
					</div>
					<hr>
					<h3 class="title">여행지</h3>
					<div id="course-summary">
						
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="area-option">
			<ul><!--해당 부분은 DB에서 가져오는 것-->
				<li>전체</li>
				<c:forEach var="i" items="${area}">
					<li>${i.sido}</li>
				</c:forEach>
			</ul>
		</div>
		<div id="tags-option">
			<ul>
				<!-- 태그를 4개 올리는 곳 -->
			</ul>
		</div>
		<!-- 필터 조건 1. areacode, 조건2. typecode -->
		<script>
			$(function(){
				$('#area-option').on('click','ul>li',function(){
					console.log($(this));
					console.log($(this).hasClass('selected'));
					
					if($(this).hasClass('selected'))
						$(this).removeClass('selected');
					else
						$(this).addClass('selected');
					
					ajaxPlaceList(1);
				});
				
				ajaxPlaceList(1);
			})
			
			function ajaxPlaceList(pageNo){
				var keywords = [];
				var $selected = $('#area-option .selected');
				for(var i = 0; i<$selected.length; i++)
					console.log($selected[i].innerText);
				console.log(keywords);
				
				$.ajax({
					url:'select.pl',
					data:{
						'keyword': keywords,
						'pageNo': pageNo
						//키워드를 ArrayList 형태로 묶어서 보내기
					},
					success:function(list){
						var result = '';
						var tags = '';
						console.log(list);
						for(var i=0; i<list.length; i++){
							console.log(list[i]);
							
							result += '<div><img src="'+list[i].filePath+list[i].picChange+'">'
										+'<h4>'+list[i].placeName+'</h4>'
										+'<p>별점 : ★★☆</p></div>';
										
							
							var tagArr = list[i].placeTags.split(',');
							console.log(tagArr);
							for(var j = 0; j<tagArr.length; j++){
								tags +='<li>'+tagArr[j]+'</li>';
							}
							console.log(tags);
						}
						$('#course-summary').html(result);
						$('#tags-option>ul').html(tags);
					},
					error:function(){
						alert('실패');
					}	
				});
			}
		</script>
	</div>
	
</body>
</html>