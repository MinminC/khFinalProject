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
<link rel="stylesheet" type="text/css" href="resources/css/search.css">

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

	#tags{
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
	           <li class="mySlides" align="center"><img src="resources/img/jeju.png" style="height:500px;"></li>
	           <li class="mySlides" align="center"><img src="resources/img/kyeongju.png" style="height: 500px;"></li>
	           <li class="mySlides" align="center"><img src="resources/img/jeju.png" style="height: 500px;"></li>
	           <li class="mySlides" align="center"><img src="resources/img/kyeongju.png" style="height: 500px;"></li>          
	        </ul>
	      </div>
	</div>
	
	<div class="outer">
		<br>
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


		<div class="best5Title"><h4>Best5여행지</h4></div>
		<div class="best5">
			
		</div>
		<div class="mpBoard">
			<div>
				<br><br>
				<h3 align="center">공지사항</h3>
				<a href="list.no" style="float: right;">더보기></a>
				<table class="w3-table w3-bordered">
				<thead>
					<tr>
						<th>no</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					</thead>
					<tbody>
					</tbody>
					
					
				</table>
				</div>
			<div>
				<img src="resources/img/time.png">
			</div>
		</div>
	</div>
		
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script>
		$(function(){
			$('#tags').on('click','span',function(){ //tags의 하위요소가 클릭이 되면 
				if($(this).hasClass('selected')) //클릭한 클래스가 select 클래스면 한번 더 선택되면 선택이 해제될 수 있게 select는 지워준다 
					$(this).removeClass('selected'); 
				else
					$(this).addClass('selected');
			})
		})
	
	
	

		// 슬라이드쇼
        window.onload = function(){

           var slideIndex = 1;
           showDivs(slideIndex);

           function plusDivs(n) {
           	showDivs(slideIndex += n);
           }

           function showDivs(n) {
			var i;
			//var x = document.getElementsByClassName("slides");
			var x = $('.slide').find('li');
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
		/*showDivs(slideIndex);*/
	}
	
	
	function fixedNoticeLoad(){//메인화면 공지사항 띄우기
		
		$.ajax({
			url:"fixedNotice.mp",
			success: function(list){
				
				var	result="";
				
					
					for(var i in list){
	
						result+="<tr>"
						+"<input type='hidden' value='"+list[i].noticeNo+"'>"
						+"<td>"+ list[i].noticeNo + "</td>"
						+"<td>"+ list[i].noticeTitle+"</td>"
						+"<td>"+ "관리자" + "</td>"
						+"<td>"+ list[i].views+"</td>"
						+"</tr>";
	
					}
					
					$('.w3-table tbody').append(result); //tbody의 자식요소로 집어넣기 
				
				
				
			},error:function(){
				
				console.log("공지사항 로딩 실패");
			}
			

		})
		
		
	}
	
	function selectBestPlace(){
		
		
		$.ajax({
			
			url:"bestPlace.mp",
			success: function(list){
				
				console.log(list);
				
				var result="";
				
				var num = 1;
				
				for(var i in list){
				
				
				result+=
					"<div>"
					+"<table>"
					+"<tr>" 
					+"<input type='hidden' value='"+list[i].placeNo+"'>"
					+"<th>"+"<img src='"+list[i].filePath+"'style='width:250px; height:200px;'>"+"</th>"
					+"</tr>"
					+"<tr>"
					+"<td>"+num+"위"+"<br>"+list[i].placeName+"</td>"
					+"</tr>"
					+"</table>"
					+"</div>"
					
					num++;
				}
				
				$('.best5').append(result);
				
				
				
			},error:function(){
				console.log("best5로딩실패");
			}

		})
		

	} 
	
	
	
	
	
	//html문서 다 로딩되면 바로 실행된 메소드
	$(function(){
		
		fixedNoticeLoad();//고정 공지사항 로딩 
		selectBestPlace();//여행지best5
		
		$(document).on('click','.w3-table>tbody>tr',function(){ //클릭하면 공지사항 디테일로 이동 
			location.href='detail.no?noticeNo='+$(this).children().eq(0).val();
			console.log($(this).children().eq(0).val());
		})
	
		$(document).on('click','.best5 img' ,function(){ //클릭하면 여행지 디테일로 이동 
			location.href='detailView.pl?placeNo='+$(this).parent().prev().val();
			console.log($(this).children().eq(0).val());
		}) 
		
	})
	
	</script>
	
	

	
	
	

</body>
</html>