<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/search.css">
<style>
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
	.float-left{
		width:900px;
		margin-left: 10px;
		margin-right: 20px;
	}
	.float-left>span{
		color:#00c5b1;
	}
	#search-tab ul{
		list-style: none;
		padding:0;
	}
	#search-tab li{
		display:inline-block;
		padding:0;
		margin:0;
	}
	#search-tab a{
		font-size:20px;
		font-weight: 800;
		text-decoration: none;
		color:gray;
		padding: 0px 20px;
	}
	.now{
		color: #00c5b1;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="wrap">
		<div id="search-tab">
			<h1 style="text-align: center;">"<span>${keyword}</span>" 검색 결과</h1>
			<ul>
				<li class="now"><a href="?keyword=${keyword}">전체</a>|</li>
				<li><a href="?where=Place&keyword=${keyword}">여행지</a>|</li>
				<li><a href="?where=Review&keyword=${keyword}">리뷰</a></li>
			</ul>
		</div>
		<hr>
		<div id="search-main" class="float-left">
			<c:choose>
				<c:when test="${empty keyword}">
					<!-- 키워드가 없이 검색된 경우 -->
					<h3>검색어를 입력해주세요.</h3>
				</c:when>
				<c:otherwise>
					<c:if test="${where != 'Review'}">
						<h3>여행지</h3>
						<i>총 <span>${places.size()}</span>건</i>더보기
						<c:choose>
							<c:when test="${empty places}">
								<!-- 여행지 검색 결과가 없는 경우 -->
								<h5>검색 결과가 존재하지 않습니다.</h5>
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
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${where != 'Place'}">
						<h3>리뷰</h3>
						<i>총 <span>${reviews.size()}</span>건</i>더보기
						<div id="review-list">
							<c:choose>
								<c:when test="${reviews == null}">
									<h5>검색 결과가 존재하지 않습니다.</h5>
								</c:when>
								<c:otherwise>
									<c:forEach var="r" items="${reviews}">
										<div class="review-one">
											<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
											<div class="review-text">
												<h4>${r.placeName}</h4>
												<h5>
													작성일 : <span>${r.createDate}</span>
													작성자 : <span>${r.userId}</span>
												</h5>
												<p>
													${r.revContent}
												</p>
												<button type="button" class="share-button" data-toggle="modal" data-target="#myModal">
													<i class="fa fa-share-alt" style="font-size:36px"></i>
													<!-- 이게 사진마다 떠있음 마우스 오버하면 보이거나 함 -->
												</button>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 어제 검색 순위 -->
		<div class="sideBar">
			<h3>검색 순위</h3>
			<i></i>
			<ul>
				<!-- 10개 노출. 공공DB에서 받아온 검색 순위 -->
				<c:forEach var="r" items="${ranking}" varStatus="vs">
					<li><span>${vs.count}</span><a href="#">${r}</a></li>
				</c:forEach>
			</ul>
		</div>
		<br clear="both" />
	</div>
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>