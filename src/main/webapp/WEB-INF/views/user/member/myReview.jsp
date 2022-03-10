<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
<style>
	.content {
            width:1200px;
            margin:auto;
        }
    .innerOuter {
          border:1px solid lightgray;
          width:100%;
          margin:auto;
          padding-left: 20px;
   }
   #top{
        border-bottom: 1px solid black;
        width: 1200px;
        margin-top:200px;
    }
    #top>h1{
        margin-left: 30px;
    }
    #main{
    	width:1200px;
    	margin:auto;
    }
    .innerOuter div{
        /* border: 1px solid black; */
    }
    .reviewBox{
        width: 370px;
        height: 500px;
        border:1px solid lightgray;
        display: inline-block;
        margin: 6px;
    }
    .rb1{
        width: 100%;
        height: 7%;
        font-size: 20px;
    }
    .rb1_btn{
        border: 0;
        background-color: white;
        float: right;
        width: 30px;
        height: 30px;
    }
    .rb2{
        width: 100%;
        height: 45%;
        border:1px solid lightgray;
        margin-bottom: 5px;
    }
    .rb2 img{
        width: 100%;
        height: 100%;
    }
    .rb3{
        width: 100%;
        height: 10%;
        padding-top: 5px;
    }
    .rb3_1, .rb3_2{
        width: 50%;
        height: 100%;
        float: left;
        font-size: 25px;
    }
    .rb3_1{
        padding-left: 30px;
        font-weight: 600;
    }
    .rb3_2{
        text-align: center;
    }
    .rb4{
        width: 100%;
        height: 38%;
        font-size: 20px;
        padding: 10px;
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div id="main">
		<br>
		<div id="top">
		        <h3>나의 리뷰</h3>
		</div>
	    <div class="content">
	        <br><br>
	        <div class="innerOuter">

                <div class="reviewBox">                      <!-- 리뷰 박스 -->
                    <div class="rb1"><button class="rb1_btn">x</button></div>                 <!-- 삭제 -->
                    <div class="rb2"><img src="resources/img/kyeongju.png"></div>    <!-- 슬라이드 -->
                    <div class="rb3">                        <!-- 여행지 이름, 별점 -->
                        <div class="rb3_1">제주도</div>
                        <div class="rb3_2">★★</div> 
                    </div>
                    <div class="rb4">가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가</div> <!-- 내용 : 길이가 길어지면 슬라이드로-->
                </div>

                <div class="reviewBox">                      <!-- 리뷰 박스 -->
                    <div class="rb1"><button class="rb1_btn">x</button></div>                 <!-- 삭제 -->
                    <div class="rb2"><img src="resources/img/logo2.png"></div>    <!-- 슬라이드 -->
                    <div class="rb3">                        <!-- 여행지 이름, 별점 -->
                        <div class="rb3_1">제주도</div>
                        <div class="rb3_2">★★★★</div> 
                    </div>
                    <div class="rb4">가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가</div> <!-- 내용 : 길이가 길어지면 슬라이드로-->
                </div>

                <div class="reviewBox">                      <!-- 리뷰 박스 -->
                    <div class="rb1"><button class="rb1_btn">x</button></div>                 <!-- 삭제 -->
                    <div class="rb2">사진들어가는부분</div>    <!-- 슬라이드 -->
                    <div class="rb3">                        <!-- 여행지 이름, 별점 -->
                        <div class="rb3_1">제주도</div>
                        <div class="rb3_2">★</div> 
                    </div>
                    <div class="rb4">가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가</div> <!-- 내용 : 길이가 길어지면 슬라이드로-->
                </div>

                <div class="reviewBox">                      <!-- 리뷰 박스 -->
                    <div class="rb1"><button class="rb1_btn">x</button></div>                 <!-- 삭제 -->
                    <div class="rb2">사진들어가는부분</div>    <!-- 슬라이드 -->
                    <div class="rb3">                        <!-- 여행지 이름, 별점 -->
                        <div class="rb3_1">제주도</div>
                        <div class="rb3_2">★★★★★</div> 
                    </div>
                    <div class="rb4">가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가</div> <!-- 내용 : 길이가 길어지면 슬라이드로-->
                </div>
                
                <div class="reviewBox">                      <!-- 리뷰 박스 -->
                    <div class="rb1"><button class="rb1_btn">x</button></div>                 <!-- 삭제 -->
                    <div class="rb2">사진들어가는부분</div>    <!-- 슬라이드 -->
                    <div class="rb3">                        <!-- 여행지 이름, 별점 -->
                        <div class="rb3_1">제주도</div>
                        <div class="rb3_2">★★★★★</div> 
                    </div>
                    <div class="rb4">가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가</div> <!-- 내용 : 길이가 길어지면 슬라이드로-->
                </div>
                <div class="reviewBox">                      <!-- 리뷰 박스 -->
                    <div class="rb1"><button class="rb1_btn">x</button></div>                 <!-- 삭제 -->
                    <div class="rb2">사진들어가는부분</div>    <!-- 슬라이드 -->
                    <div class="rb3">                        <!-- 여행지 이름, 별점 -->
                        <div class="rb3_1">제주도</div>
                        <div class="rb3_2">★★★★★</div> 
                    </div>
                    <div class="rb4">가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가</div> <!-- 내용 : 길이가 길어지면 슬라이드로-->
                </div>
                <div class="reviewBox">                      <!-- 리뷰 박스 -->
                    <div class="rb1"><button class="rb1_btn">x</button></div>                 <!-- 삭제 -->
                    <div class="rb2">사진들어가는부분</div>    <!-- 슬라이드 -->
                    <div class="rb3">                        <!-- 여행지 이름, 별점 -->
                        <div class="rb3_1">제주도</div>
                        <div class="rb3_2">★★★★★</div> 
                    </div>
                    <div class="rb4">가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가나다라마가</div> <!-- 내용 : 길이가 길어지면 슬라이드로-->
                </div>
	        </div>
	        <br><br>
	    </div>
	</div>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>