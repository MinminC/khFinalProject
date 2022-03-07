<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	div{
		/*border: solid pink 1px;*/
		margin: 0px;
		padding: 0px;
	
	}
	.outer{
		width: 1200px;
		height: 1100px;
		margin: auto;
	}

	.TravleTag{
		width: 100%;
		height: 10%;
	}

	.best5Tilte{
		width: 100%;
		height: 10%;
	}

	.best5{
		
		width: 100%;
		height: 30%;
	
		
		
	}

	.mpBoard{
		width: 100%;
		height: 50%;
	}

	.best5>div{
		width: 20%;
		height: 100%;
		float: left;
		border: 1px solid black;
	}
	
	.mpBoard>div{
		width: 50%;
		height: 100%;
		float: left;
	}
	
	 /*슬라이드 이미지 스타일*/
    *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:500px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 20s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:500px;}
    .slide li:nth-child(1){background: white;}
    .slide li:nth-child(2){background:white;}
    .slide li:nth-child(3){background:white;}
    .slide li:nth-child(4){background:white;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }

	.slide{
		margin-top: 200px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<br>
	    <div class="slide">
	        <ul>
	            <li align="center"><img src="resources/img/jeju.png" style="height:500px;"></li>
	            <li align="center"><img src="resources/img/kyeongju.png" style="height: 500px;"></li>
	          <li align="center"><img src="resources/img/jeju.png" style="height: 500px;"></li>
	          <li align="center"><img src="resources/img/kyeongju.png" style="height: 500px;"></li>          
	        </ul>
	      </div>
	</div>
	
	<div class="outer">
		<div class="TravleTag">
		<h3>여긴 태그자리야~</h3>
		</div>

		<div class="best5Title"><h4>Best5</h4></div>
		<div class="best5">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div class="mpBoard">
			<div>
				<br><br>
				<h3 align="center">공지사항</h3>
				<a href="" style="float: right;">더보기></a>
				<table class="w3-table w3-bordered">
					<tr>
						<th>no</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td>1</td>
						<td>공지</td>
						<td>admin</td>
						<td>1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두번째공지</td>
						<td>admin</td>
						<td>5</td>
					</tr>
					<tr>
						<td>3</td>
						<td>두번째공지</td>
						<td>admin</td>
						<td>5</td>
					</tr>
					
				</table>
				</div>
			<div>
				<img src="resources/img/time.png">
			</div>
		</div>
	</div>
		
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	
	
		
		// 슬라이드쇼
        window.onload = function(){

           var slideIndex = 1;
           showDivs(slideIndex);

           function plusDivs(n) {
           showDivs(slideIndex += n);
           }

           function showDivs(n) {
           var i;
           var x = document.getElementsByClassName("mySlides");
           if (n > x.length) {slideIndex = 1} //슬라이드길이가 n보다 크면(다지나갔으면)1번 슬라이드로 
           if (n < 1) {slideIndex = x.length} ;  
           for (i = 0; i < x.length; i++) {
               x[i].style.display = "none";
           }
           x[slideIndex-1].style.display = "block";
           }

       }
		
	window.onload = function(){
		
		var slideIndex = 1;
		showDivs(slideIndex);
	}
		
		
	
	
	
	</script>

</body>
</html>