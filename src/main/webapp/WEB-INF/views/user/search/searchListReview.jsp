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
						<i>총 <span>${reviews.size()}</span>건</i>
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
						<br>
						<!--pagination-->
						<ul class="pagination">
							<c:if test="${pi.currentPage != 1}">
								<li class="page-item firstPage"><a class="page-link" href="?where=${where}&keyword=${keyword}&pageNo=${pi.currentPage - 1}">&lt;</a></li>
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
							<c:if test="${pi.currentPage != pi.maxPage}">
								<li class="page-item endPage"><a class="page-link" href="?where=${where}&keyword=${keyword}&pageNo=${pi.currentPage + 1}">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 어제 검색 순위 -->
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
		<script>
			$(function(){
				var now = new Date(+new Date() + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');;
				var yesterday = new Date(+new Date() -24*60*60*1000 + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');;
				$('#search-option>i').html(yesterday+'<br>~'+now+' 기준');
			})
		</script>
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