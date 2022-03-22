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
	#search-list img{
		width:300px;
		height:200px;
	}
	.list-text{
		padding-left:20px;
		display: inline-block;
		position:relative;
		width:60%;
		height:200px;
	}
	.list-text button{
		position:absolute;
		right:0;
		top:0;
	}
	#search-list>div>img, #search-list>div>.list-text{
		float:left;
	}
	#search-main, #search-option{
		float:left;
	}
	#search-main{
		width:1000px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="wrap">
		<div id="search-main">
			<div id="search-tab">
				<ul>
					<li><a href="?where=Main&keyword=${keyword}">전체</a> |</li>
					<li class="now"><a onclick="location.reload();">여행지</a> |</li>
					<li><a href="?where=Review&keyword=${keyword}">리뷰</a></li>
				</ul>
				<ul>
					<li onclick="changeSort('new');">최신 순</li>
					<li onclick="changeSort('views');">인기 순</li>
					<li onclick="changeSort('place');">여행지 명 순</li>
				</ul>
				<div id="align-bar">
					<i>총 <span>${places.size()}</span>건</i>
					<script>
						function changeSort(str){
							location.href="search?where=${where}&keyword=${keyword}&sort="+str;
						}
					</script>
				</div>
			</div>
			<hr>
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
						<c:forEach var="place" items="${places}">
							<div>
								<img src="${place.filePath}${place.picChange}">
								<div class="list-text">
									<h4>${place.placeName}</h4>
									<button type="button" class="btn" data-toggle="modal" data-target="#shareUrl"><i class="fa fa-share-alt" style="font-size:36px"></i></button>
									<span>
										별점 : 
										<c:forEach begin="1" end="${place.starScore}">
											★
										</c:forEach>
									</span>
									<p>
										${place.placeTags}
									</p>
								</div>
							</div>
							<br clear="both">
							<hr>
						</c:forEach>
					</div>
					
					<script>
						function share() {
						  var url = encodeURI(encodeURIComponent(myform.url.value));
						  var title = encodeURI(myform.title.value);
						  var shareURL = "https://share.naver.com/web/shareView?url=" + url + "&title=" + title;
						  window.open(shareURL, '네이버 공유하기', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
						}
					</script>
					<!--페이징 처리-->
					<ul class="pagination">
						<c:if test="${pi.currentPage != 1}">
							<li class="page-item"><a class="page-link" href="?where=${where}&keyword=${keyword}pageNo=${pi.currentPage - 1}">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item"><a class="page-link" href="?where=${where}&keyword=${keyword}&pageNo=${i}">${i}</a></li>
							<!--해당되는 번호에 클래스 active 넣어주기!-->
						</c:forEach>
						<c:if test="${pi.currentPage != pi.maxPage}">
							<li class="page-item endPage"><a class="page-link" href="?where=${where}&keyword=${keyword}pageNo=${pi.currentPage + 1}">&gt;</a></li>
						</c:if>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- share Modal -->
		<div class="modal" id="shareUrl">
			<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form id="myform">
						URL:  <input type="text" id="url" value=""><br/>
						Title:  <input type="text" id="title" value=""><br/>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" onclick="share()">Share</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
			</div>
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
		<div id="search-option">
			<h3>검색 순위</h3>
			<i></i>
			<ul>
				<!-- 10개 노출. 공공DB에서 받아온 검색 순위 -->
				<c:forEach var="r" items="${ranking}" varStatus="vs">
					<li><span>${vs.count}</span><a href="#">${r}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<br clear="both">
	<br><br><br><br><br><br><br><br><br>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>