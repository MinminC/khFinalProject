<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
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
		        <h3>비밀번호 변경</h3>
		</div>
	    <div class="content">
	        <br><br>
	        <div class="innerOuter">
	            <form action="update.me" method="post">
	                <div class="form-group">
	                    <label for="userId"> 변경할 비밀번호  </label>
	                    <input type="password" class="form-control" id="userPwd" name="userPwd"> <br>
	
	                    <label> 비밀번호 확인  </label>
	                    <input type="password" class="form-control" > <br>
					</div> 
	                <br>
	                <div class="btns" align="center">
	                    <button type="submit" class="btn btn-secondary" style="width:477px">변경하기</button>
	                </div>
	            </form>
	        </div>
	        <br><br>
	    </div>
	</div>

    <jsp:include page="../../common/footer.jsp" />

</body>
</html>