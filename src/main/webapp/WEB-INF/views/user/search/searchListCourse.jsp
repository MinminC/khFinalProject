<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/search.css">
</head>
<body>
	<jsp:include page="/index.jsp" />
	<div id="wrap">
		<div id="search-tab">
			<ul>
				<li><a href="?where=Main&keyword=${keyword}">전체</a> |</li>
				<li><a href="?where=Place&keyword=${keyword}">여행지</a> |</li>
				<li><a onclick="location.reload();">추천코스</a></li>
			</ul>
		</div>
		<hr>
		<div id="search-main">
			<div id="align-bar">
				<i>총 <span>10</span>건</i>
				<ul>
					<li><a onclick="">하트 순</a></li>
					<li><a onclick="">조회 순</a></li>
					<li><a onclick="">최신 순</a></li>
				</ul>
			</div>
			<div id="course-list">
				<div class="course-one">
					<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
					<div class="course-text">
						<h4>여행을 떠나자</h4>
						<h5>
							하트 : <span></span>
							조회수 : <span></span>
							작성일 : <span></span>
						</h5>
						<p>
							별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
						</p>
					</div>
				</div>
				<div class="course-one">
					<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
					<div class="course-text">
						<h4>여행을 떠나자</h4>
						<p>
							별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
						</p>
					</div>
				</div>
				<div class="course-one">
					<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
					<div class="course-text">
						<h4>여행을 떠나자</h4>
						<p>
							별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
						</p>
					</div>
				</div>
				<div class="course-one">
					<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
					<div class="course-text">
						<h4>여행을 떠나자</h4>
						<p>
							별과 풀이 맺어, 바이며, 풍부하게 인간이 붙잡아 곳이 풍부하게 사막이다. 대한 우리 고행을 힘있다. 봄바람을 찬미를 곳으로 기쁘며, 희망의 시들어 두기 물방아 위하여서. 
						</p>
					</div>
				</div>
				<div class="course-one">
					<img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
					<div class="course-text">
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
		</div>
		<div id="area-option">
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
		})
	</script>
</body>
</html>