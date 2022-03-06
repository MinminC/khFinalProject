<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 일정</title>
<style>
	.content {
            width:1200px;
            margin:auto;
        }
    .innerOuter {
          border:1px solid lightgray;
          width:60%;
          margin:auto;
          padding:5% 10%;
   }
   #top{
        border-bottom: 1px solid black;
        width: 1200px;
    }
    #top>h1{
        margin-left: 30px;
    }
    #main{
    	width:1200px;
    	margin:auto;
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div id="main">
		<br>
		<div id="top">
		        <h3>나의 일정</h3>
		</div>
	    <div class="content">
	        <br><br>
	        <div class="innerOuter">
	            <form action="" method="post">
	            
	            
	            
	            
	          
	                
	                
	                
	            </form>
	        </div>
	        <br><br>
	    </div>
	</div>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>