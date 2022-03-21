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
//이미지에는 
.review-one>img {
	position: relative;
}
.share-button{
	opacity: 0;
}
.review-one>div:hover {
	opacity: 1;
	position: absolute;
	top: 0px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="wrap">
		<div id="search-tab">
			<ul>
				<li><a href="?where=Main&keyword=${keyword}">전체</a> |</li>
				<li><a href="?where=Place&keyword=${keyword}">여행지</a> |</li>
				<li class="now"><a onclick="location.reload();">리뷰</a></li>
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
					<div id="align-bar">
						<i>총 <span>10</span>건</i>
						<ul>
							<li onclick="changeSort('new');">최신 순</li>
							<li onclick="changeSort('writer');">작성자 순</li>
							<li onclick="changeSort('place');">여행지 명 순</li>
						</ul>
						<script>
							function changeSort(str){
								location.href="search?where=${where}&keyword=${keyword}&sort="+str;
							}
						</script>
					</div>
					<div id="review-list">
						<div class="review-one">
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<div class="review-text">
								<h4>여행을 떠나자</h4>
								<h5>
									작성일 : <span></span>
									작성자 : <span></span>
								</h5>
								<p>
									별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
								</p>
		                        <div class="share-button">
		                            <a href="#" class="btn">예매하기</a><br><br>
		                            <a href="#" class="btn">상세정보</a>
		                        </div>
							</div>
						</div>
						<div class="review-one">
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<div class="review-text">
								<h4>여행을 떠나자</h4>
								<h5>
									하트 : <span></span>
									조회수 : <span></span>
									작성일 : <span></span>
									작성자 : <span></span>
								</h5>
								<p>
									별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
								</p>
								<button type="button" class="share-button" data-toggle="modal" data-target="#myModal">
								    <i class="fa fa-share-alt" style="font-size:36px"></i>
								    <!-- 이게 사진마다 떠있음 마우스 오버하면 보이거나 함 -->
								</button>
							</div>
						</div>
						<div class="review-one">
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<div class="review-text">
								<h4>여행을 떠나자</h4>
								<p>
									별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
								</p>
							</div>
						</div>
						<div class="review-one">
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<div class="review-text">
								<h4>여행을 떠나자</h4>
								<p>
									별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
								</p>
							</div>
						</div>
						<div class="review-one">
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<div class="review-text">
								<h4>여행을 떠나자</h4>
								<p>
									별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
								</p>
							</div>
						</div>
						
						<br>

						<!--pagination-->
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 어제 검색 순위 -->
		<div id="search-option">
			<h3>어제 검색 순위</h3>
			<i></i>
			<ul>
				<!-- 10개 노출. 공공DB에서 받아온 검색 순위 -->
				<li><span>1</span><a href="search?keyword=검색테스트1">검색테스트1</a></li>
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
		<!-- <div id="area-option">
			<ul>
				<li>#감귤농장</li>
				<li>#제주도</li>
				<li>#감귤농장</li>
				<li>#제주도</li>
				<li>#감귤농장</li>
				<li>#제주도</li>
				<li>#감귤농장</li>
				<li>#제주도</li>
				<li>#감귤농장</li>
				<li>#제주도</li>
				<li>#감귤농장</li>
			</ul>
		</div>-->
	</div>
	<script>
		$(function(){
			$('#area-option').on('click','ul>li',function(){
				if($(this).hasClass('selected'))
					$(this).removeClass('selected');
				else
					$(this).addClass('selected');
			})
		})
	</script>
  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
   </div> 
</body>
</html>