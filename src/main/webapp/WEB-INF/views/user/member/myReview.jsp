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
          height: auto;
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
    
   /* 리뷰 부분 */
    .rv2{
	width:100%;
	height: auto;
    }

    .rv2_1{
        padding:15px;
    }
    
    .rv2_1 img{
        width:60px;
        height:60px;
    }

    .rv2_1 p{
        display: inline-block;
        font-size: 35px;
        margin: 0 0 0 10px;
    }
    .rv2_1 pre{
        display: inline-block;
        font-size: 20px;
        margin: 0 0 20 0px;
        float:right;
    }

    .rv2_2{
        width: 100%;
        height: 40px;
    }
    .rv2_2_1{
        width: 50%; 
        height:100%; 
        float: left;
    }

    .rv2_2_1 p{
        font-size: 30px; 
        margin-left: 20px;
    }
    .rv2_2_2{
        width: 50%; 
        height:100%; 
        float: left;
    }

    .rv2_2_2 p{
        font-size: 25px; 
        float: right; 
        margin-right: 30px;
    }

    .rv2_3{
        width: 100%; 
        height: auto; 
        margin-top: 5px; 
        padding: 10px;
    }

    .rv2_3 p{
        font-size: 30px;
        margin-bottom: 0px;
    }

	
    .rv2_3+div{
        height: auto;
        padding: 10px;
        
        overflow: auto;
        position: relative;
        display: flex;
    }    
    
    .rv2_3+div::-webkit-scrollbar{
        width : 7px;
    }    
    .rv2_3+div::-webkit-scrollbar-thumb{
        background-color : #009688;
        border-radius : 10px;
    }    
    
    .rv2_3+div::-webkit-scrollbar-track{
    	background-color: white;
	}
	

    .rv2_3+div img{
        width: auto;
        height: auto;
        padding: 5px;
        
         
    }

	/* 삭제 */
    .deleteReview{
    	cursor : pointer;
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
                
	        </div>
	        <br><br>
	    </div>
	</div>
	
	<script>
	
        $(function(){
            $.ajax({
                url : "mySelectReviewInformation.rev",
                data : {userNo : ${loginUser.userNo}},
                success : function(list){

                    let value="";
                    let star =" "
                    for(let i in list){
                    	for(let j=0; j<list[i].starScore; j++){
							star += "★";
						}
                    	
                        value += 
                        "<div class='rv2'>"
                            +"<div class='rv2_1'>"
			                    +"<p>"+list[i].placeName+"</p>";
			                    
								if('${loginUser.userId}' == list[i].userId){
				                    value += "<pre class='deleteReview'>삭제</pre>"
				                    		+"<input type='hidden' value='"+list[i].revNo+"'>";
								}
			                    
			            value += 
			                "</div>"
                            +"<div class='rv2_2'>"
                                +"<div class='rv2_2_1'><p>"+star+"</p></div>"
                                +"<div class='rv2_2_2'><p>"+list[i].createDate.substr(0, 10)+"</p></div>"
                            +"</div>"
                            +"<div class='rv2_3' ><p>"+list[i].revContent+"</p></div>"
                            +"<div class='"+list[i].revNo+"'></div>"
                            +"<hr>"
                        +"</div>";
						
						star =" ";
						
                    }
                    
                    $('.innerOuter').append(value);
                    
                    $.ajax({
                        url : "myPictureReview.rev",
                        data : {userNo : ${loginUser.userNo}},
                        success : function(list){
                            let value="";
                            for(let i in list){
                                value = "<img src="+list[i].changeName+">";
                                $("div[class='"+list[i].revNo+"']").append(value);
                            }
                        }
                    })
                    
                    $('.deleteReview').click(function(){
			            $.ajax({
				            url : "deleteReview.rev",
				            data : {revNo : $(this).next().val()},
				            success : function(result){
					            alert('리뷰가 삭제되었습니다.');
					            location.reload();
				            }
			            })
		            })
                }
            })   
        })
        
    </script>
    
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>