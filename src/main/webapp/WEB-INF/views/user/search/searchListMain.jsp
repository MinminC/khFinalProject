<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-place.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/index.jsp" />
	<div id="wrap">
		<div id="search-tab">
			<ul>
				<li><a onclick="location.reload();">전체</a> |</li>
				<li><a href="?where=Place&keyword=${keyword}">여행지</a> |</li>
				<li><a href="?where=Course&keyword=${keyword}">추천코스</a></li>
			</ul>
		</div>
		<hr>
		<div id="search-main">
			${keyword eq ''}
			<c:choose>
				<c:when test="${keyword eq ''}">
					<!-- 키워드가 없이 검색된 경우 : 키워드를 입력해주세요 -> 이거 하나만 뜸 -->
					<!-- 다른 경우는 있을까? 오류의 경우? -->
					<h3>검색어를 입력해주세요.</h3>
				</c:when>
				<c:otherwise>
					<!--검색 내용 존재-->
					<h3 class="title">태그</h3>
					<div id="tags"><!-- 여행지 태그 10개, 코스 태그 10개 -->
						<span class="selected">#제주도</span>
						<span>#감귤농장</span>
						<span>#제주도</span>
						<span>#감귤농장</span>
						<span>#제주도</span>
						<span>#감귤농장</span>
						<span>#제주도</span>
						<span>#감귤농장</span>
						<span>#제주도</span>
						<span>#감귤농장</span>
						<span>#제주도</span>
						<span>#감귤농장</span>
					</div>
					<script>
						$(function(){
							$('#tags').on('click','span',function(){
								if($(this).hasClass('selected'))
									$(this).removeClass('selected');
								else
									$(this).addClass('selected');
							})
						})
					</script>
					<hr>
					<h3 class="title">여행지</h3>
					<div id="place">
						<!-- 카카오맵 -->
					</div>
					<hr>
					<h3 class="title">코스</h3>
					<div id="course-summary">
						<div>
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<h4>추천코스제목1</h4>
							<p>
								추천코스내용~~
							</p>
						</div>
						<div>
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<h4>추천코스제목2</h4>
							<p>
								추천코스내용~~
							</p>
						</div>
						<div>
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<h4>추천코스제목3</h4>
							<p>
								추천코스내용~~
							</p>
						</div>
						<div>
							<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
							<h4>추천코스제목4</h4>
							<p>
								추천코스내용~~
							</p>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="search-option">
			<h3>실시간 검색 순위</h3>
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
	</div>
	
</body>
</html>