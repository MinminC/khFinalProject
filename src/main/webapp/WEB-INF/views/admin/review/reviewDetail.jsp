<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<style>
	.content {
            width:1200px;
            margin:auto;
        }
    .innerOuter {
          border-top:2.5px solid lightgray;
          border-bottom:2.5px solid lightgray;
          width:100%;
          margin:auto;
          padding:0;
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
        margin-left: 200px;
    	
    }
       
    
    .innerOuter div{
   }
   .io1{
   		width : 100%;
   		height : 80px;
   		padding : 10px
   }
   .io1 img{
   		width:50px;
        height:50px;
   		float : left;
    	
   }
   .io1 p{
   		font-size : 30px;
   		display : inline-block;
   }
    
   .io1 pre{
    	float : right;
    	font-size : 20px;
    	margin-right : 10px;
    	margin-top : 10px;
    	cursor : pointer;
   }
   
   .io2{
   		width : 100%;
   		height : 60px;
   		font-size : 35px;
   		padding-left : 10px
   		
   }
   
   .io3{
   		font-size : 25px;
   		height : auto;
   		padding : 10px
   }
   
   .io4{
   		width : 100%;
   		height : auto;
   		overflow: auto;
        position: relative;
        display: flex;
   }
   
   .io4 img{
   		float : left;
   		width : 100%;
   		height : 800px;
   		padding : 5px;
   }
    
    .io4::-webkit-scrollbar{
        width : 1px;
    }    
    .io4::-webkit-scrollbar-thumb{
        background-color : #009688;
        border-radius : 10px;
    }    
    
    .io4::-webkit-scrollbar-track{
    	background-color: white;
	}
   
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
	
	<div id="main">
		<br>
		
	    <div class="content">
	        <br><br>
	        
	        <div class="innerOuter">
	            <div class="io1"><img src='resources/upfiles/user/profilePic.png' alt='프로필' class='rounded-circle'><p>&nbsp;${r.userId}</p><pre class='deleteReview'>삭제</pre><input type='hidden' value='${r.revNo }'></div> <!-- 이름, 삭제 -->
	            <div class="io2"></div> <!-- 별점 -->
	            <div class="io3">${ r.revContent }</div> <!-- 내용 -->
	            <div class="io4">
	            	<c:forEach var='rp' items='${rp}'>
	            		<img src='${rp.changeName}'>
	            	</c:forEach>
	            </div> <!-- 사진 -->
              
	        </div>
	        <br><br>
	    </div>
	</div>
	
	<script>
		$(function(){
			$('.deleteReview').click(function(){
		        $.ajax({
		            url : "deleteReview.rev",
		            data : {revNo : $(this).next().val()},
		            success : function(result){
			            alert('리뷰가 삭제되었습니다.');
			            location.href='review.ad';
		            }
		        })
		    })
		    
		    for(var i=0; i<${r.starScore}; i++){
		    	$(".io2").append("★");
		    }
			
		})
	</script>
</body>
</html>