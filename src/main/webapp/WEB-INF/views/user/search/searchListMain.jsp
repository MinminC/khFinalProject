<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${keyword} 검색 결과</title>
<link rel="stylesheet" type="text/css" href="resources/css/search.css">
<style>
	#wrap{
		width:1200px;
		height:600px;
		justify-items:center;
		margin: 200px auto 50px auto;
	}
	#wrap>div>h3{
		font-weight: 800;
		color:#009688;
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
		margin-top:60px;
	}
	.sideBar li{
		margin:5px;
	}
	.btn-firstclass, .active>a{
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
	.float-left, .sideBar{
		float:left;
	}
	.float-left>span{
		color:#00c5b1;
	}
	#search-tab ul, .sideBar ul{
		list-style: none;
		padding:0;
	}
	#search-tab ul{
		text-align: center;
	}
	#search-tab li{
		display:inline-block;
	}
	#search-tab a{
		font-size:20px;
		font-weight: 800;
		text-decoration: none;
		color:gray;
		padding: 0px 20px;
	}
	.sideBar span{
		display:inline-block;
		width:20px;
		background: gray;
		color:white;
		border-radius: 5px;
		text-align: center;
	}
	.now{
		color: #00c5b1 !important;
	}
	#search-tab li, .search-list img, .search-text{
		margin:0;
		padding:0;
	}
	.search-text{
		padding:10px;
	}
	#place-list .search-text{
		width:600px;
	}
	#place-list img{
		width:300px;
		top:8px;
		/*외곽에 line-height 속성을 주고 내부를 vertical-align 속성 주면 가운데 위치->p태그까지 영향받음. 사용X*/
	}
	#review-list img{
		width:150px;
		top:8px;
		/*외곽에 line-height 속성을 주고 내부를 vertical-align 속성 주면 가운데 위치->p태그까지 영향받음. 사용X*/
	}
	#search-one h3{
		text-align: center;
		font-weight: 800;
		font-size: 30px;
	}
	#search-one{
		background:rgb(240,240,240);
		border:1px solid lightgray;
	}
	.float-left a{
		float:right;
		text-decoration: none;
		color:#00c5b1;
		font-weight: 600;
	}
	.float-left span{
		color:#00c5b1;
	}
	#place-list img, #place-list .search-text{
		float:left;
	}
	#search-main .btn{
		float:right;
	}
	.search-text h4:hover{
		cursor:pointer;
		text-decoration:underline;
	}
	.sideBar a{
		color:#009688;
		padding-left: 10px;
	}
	.light-bar{
		border:0;
		border-top:1px dashed rgb(0,0,0,.1);
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<script>
		//여행지 클릭하면 이동하기
		$(function(){
			$('#search-main').on('click','h4',function(){
				location.href='detailView.pl?placeNo='+$(this).siblings('.placeNo').val();
			})
		})
	</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="wrap">
		<div id="search-tab">
			<h1 style="text-align: center;">"<span>${keyword}</span>" 검색 결과</h1>
			<ul style="float:left;">
				<li><a href="?keyword=${keyword}">전체</a>|</li>
				<li><a href="?where=Place&keyword=${keyword}">여행지</a>|</li>
				<li><a href="?where=Review&keyword=${keyword}">리뷰</a></li>
			</ul>
			
			<c:if test="${where != 'Main'}">
				<ul style="float:right;">
					<li><a href="?sort=new&where=${where}&keyword=${keyword}">최신 순</a>|</li>
					<li><a href="?sort=score&where=${where}&keyword=${keyword}">별점 순</a>|</li>
					<li><a href="?sort=place&where=${where}&keyword=${keyword}">여행지 명 순</a></li>
				</ul>
			</c:if>
			<br clear="both"/>
		</div>
		<c:choose>
			<c:when test="${where eq 'Main'}">
				<script>
					$(function(){
						$('#search-tab li>a').eq(0).addClass('now');
					})
					</script>
			</c:when>
			<c:when test="${where eq 'Place'}">
				<script>
					$(function(){
						$('#search-tab li>a').eq(1).addClass('now');
					})
					</script>
			</c:when>
			<c:otherwise>
				<script>
					$(function(){
						$('#search-tab li>a').eq(2).addClass('now');
					})
					</script>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${sort eq 'new'}">
				<script>
					$(function(){
						$('#search-tab li>a').eq(3).addClass('now');
					})
					</script>
			</c:when>
			<c:when test="${sort eq 'score'}">
				<script>
					$(function(){
						$('#search-tab li>a').eq(4).addClass('now');
					})
					</script>
			</c:when>
			<c:otherwise>
				<script>
					$(function(){
						$('#search-tab li>a').eq(5).addClass('now');
					})
					</script>
			</c:otherwise>
		</c:choose>
		<br clear="both"/>
		<hr>
		<br>
		<div id="search-main" class="float-left">
			<c:choose>
				<c:when test="${empty keyword}">
					<!-- 키워드가 없이 검색된 경우 -->
					<h3>검색어를 입력해주세요.</h3>
				</c:when>
				<c:otherwise>
					<c:if test="${where != 'Review'}">
						<h3>여행지</h3>
						<i>총 <span>${totalPlace}</span>건</i>
						<c:if test="${where == 'Main'}">
							<a href="?where=Place&keyword=${keyword}">더보기</a>
						</c:if>
						<hr class="light-bar">
						<c:choose>
							<c:when test="${empty places}">
								<!-- 여행지 검색 결과가 없는 경우 -->
								<br><br><h5>검색 결과가 존재하지 않습니다.</h5><br>
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
												<td colspan="2"><img src="${p.filePath}${p.picChange}" style="width:450px;"></td>
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
								<div class="search-list" id="place-list">
								<c:forEach var="place" items="${places}">
									<div>
										<img src="${place.filePath}${place.picChange}">
										<div class="search-text">
												<input type="hidden" class="placeNo" value="${place.placeNo}">
												<h4>${place.placeName}</h4>
												<button type="button" class="btn shareToBlog" data-toggle="modal" data-target="#shareUrl"><i class="fa fa-share-alt" style="font-size:36px"></i></button>
												<span>
													별점 : 
													<c:choose>
														<c:when test="${place.starScore == 0}">
															별점 정보 없음
														</c:when>
														<c:otherwise>
															<c:forEach begin="1" end="${place.starScore}">
																★
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</span>
												<p>
													${place.placeTags}
												</p>
											</div>
										</div>
										<br clear="both"/>
										<hr class="light-bar">
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
					<c:if test="${where eq 'Main'}">
						<br><br>
					</c:if>
					<c:if test="${where != 'Place'}">
						<h3>리뷰</h3>
						<i>총 <span>${totalReview}</span>건</i>
						<c:if test="${where == 'Main'}">
							<a href="?where=Review&keyword=${keyword}">더보기</a>
						</c:if>
						<hr class="light-bar">
						<c:choose>
							<c:when test="${empty reviews}">
								<br><br><h5>검색 결과가 존재하지 않습니다.</h5><br>
							</c:when>
							<c:otherwise>
								<div class="search-list" id="review-list">
									<c:forEach var="r" items="${reviews}">
										<div class="search-one">
											<div class="search-text">
												<input type="hidden" class="placeNo" value="${r.placeNo}">
												<input type="hidden" class="revNo" value="${r.revNo}">
												<h4>${r.placeName}</h4>
												<p>
													${r.revContent}
												</p>
												<button type="button" class="btn shareToBlog" data-toggle="modal" data-target="#shareUrl"><i class="fa fa-share-alt" style="font-size:36px"></i></button>
												<h5>
													작성일 : <span>${r.createDate}</span>
													작성자 : <span>${r.userId}</span>
													별점 : 
													<span>
														<c:choose>
															<c:when test="${r.starScore == 0}">
																-
															</c:when>
															<c:otherwise>
																<c:forEach begin="1" end="${r.starScore}">
																	★
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</span>
												</h5>
											</div>
											<div class="review-image"></div>
										</div>
										<hr class="light-bar">
									</c:forEach>
									<script>
										//리뷰 이미지를 뿌려주는 함수
										$(function(){
											viewReviewImage();
										})
										
										function viewReviewImage(){
											//리뷰 번호
											var reviewsNum = [];
											$('#review-list .revNo').each(function(idx,reviewNo){
												reviewsNum.push(Number(reviewNo.value));
											});
											$.ajax({
												url:'ajaxReviewImage.se',
												data: {'reviewsNum':reviewsNum},
												traditional: true,
												success:function(list){
													for(var i=0;i<list.length;i++){
														//list -> {imgNo: 1, revNo: 2, originName: '1.JPG', changeName: '1.JPG
														//reviewsNum == [2,3,5,7,9]
														//reviewsNum
														//reviewsNum.indexof(revNo)//0번째에 append함
														
														var value = '<img src="resources/upfiles/review/'+list[i].changeName+'"></div>';

														$('#review-list .search-one').eq(reviewsNum.indexOf(list[i].revNo)).find('.review-image').append(value);
													}
												},
												error:function(){
													alert('사진 로딩 실패');
												}
											})
										}
									</script>
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${where != 'Main'}">
						<!--페이징 처리-->
						<ul class="pagination">
							<c:if test="${pi.currentPage != 1}">
								<li class="page-item"><a class="page-link" href="?where=${where}&keyword=${keyword}&pageNo=${pi.currentPage - 1}">&lt;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
								<c:choose>
									<c:when test="${pi.currentPage eq i}">
										<li class="page-item active"><a class="page-link" href="?where=${where}&keyword=${keyword}&pageNo=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="?where=${where}&keyword=${keyword}&pageNo=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pi.currentPage lt pi.maxPage}">
								<li class="page-item endPage"><a class="page-link" href="?where=${where}&keyword=${keyword}&pageNo=${pi.currentPage + 1}">&gt;</a></li>
							</c:if>
						</ul>
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
					<li><span>${vs.count}</span><a href="?keyword=${r}">${r}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<br clear="both"/>
	<!-- share Modal -->
	<div class="modal" id="shareUrl">
		<div class="modal-dialog">
			<div class="modal-content">
				<h3>블로그로 공유하기</h3>
				<!-- Modal body -->
				<div class="modal-body">
					<form id="myform">
						URL:  <input class="form-control" type="text" id="url"><br/>
						Title:  <input class="form-control" type="text" id="title"><br/>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-firstclass" onclick="share()">Share</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$('#wrap').on('click','.shareToBlog', function(){
				var placeNo = $(this).siblings('input.placeNo').val();
				var title = $(this).siblings('h4').text();
				// var hostIndex = location.href.indexOf(location.host)+location.host.length;
				$('#url').val(location.href.substring(0, location.href.lastIndexOf('/')+1)+'detailView.pl?placeNo='+placeNo);
				$('#title').val('FirstClass와 함께 '+title+'로 떠나요~');
			})

			var now = new Date(+new Date() + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');;
			var yesterday = new Date(+new Date() -24*60*60*1000 + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');;
			$('.sideBar>i').html(yesterday+'<br> &nbsp;&nbsp;&nbsp;~ '+now+' 기준');
		})
		
		function getYMD(time) {
			return time.getFullYear() + "-" 
					+ ((time.getMonth() + 1) > 9 ? 
						(time.getMonth() + 1).toString() : "0" + (time.getMonth() + 1)) 
					+ "-" +(time.getDate() > 9 ? 
						time.getDate().toString() : "0" + time.getDate().toString());
		}
	</script>
	<c:if test="${not empty keyword}">
		<script>
			$(function(){
				$('.search>input').val('${keyword}');
			})
		</script>
	</c:if>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>