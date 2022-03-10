<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
        margin-top:200px;
    }
    #top>h1{
        margin-left: 30px;
    }
    #main{
    	width:1200px;
    	margin:auto;
    }
    #pwdCheck{
    	width:400px;
    	height:30px;
    	
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
	            <form action="updateEnrollForm.pwd" method="post" onsubmit= "return check()">
	                <div class="form-group">
	                    <label for="userId"> 변경할 비밀번호  </label>
	                    <input type="password" class="form-control" id="userPwd" name="userPwd"> <br>
	
	                    <label> 비밀번호 확인  </label>
	                    <input type="password" class="form-control" id="checkPwd"> <br>
	                    <label id="pwdCheck"></label>
					</div> 
	                <div class="btns" align="center">
	                    <button type="submit" class="btn btn-secondary" style="width:477px">변경하기</button>
	                </div>
	            </form>
	        </div>
	        <br>
	    </div>
	</div>
	
	<script>
			
		function check(){
			if($('#userPwd').val() == $('#checkPwd').val()){	    // 자바스크립트 : 빈문자열 -> false 반환
				return true;
			}
			$('#pwdCheck').html('비밀번호 확인이 비밀번호와 다릅니다.').css('color','red');
			return false;
		}
		
	</script>

    <jsp:include page="../../common/footer.jsp" />

</body>
</html>