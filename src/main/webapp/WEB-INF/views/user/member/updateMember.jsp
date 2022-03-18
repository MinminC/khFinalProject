<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경</title>
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
	.form-group{
		height: 620px;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div id="main">
		<br>
		<div id="top">
		        <h3>정보 변경</h3>
		</div>
	    <div class="content">
	        <br><br>
	        <div class="innerOuter">
	            <form action="updateEnrollForm.me" method="post" id="updateEnrollForm">
	                <div class="form-group">
	                    <label for="userId"> 아이디  </label>
	                    <input type="text" class="form-control" id="userId" value="${loginUser.userId}" name="userId" readonly> <br>
	
	                    <label for="userName"> 이름  </label>
	                    <input type="text" class="form-control" id="userName" value="${loginUser.userName}" name="userName" readonly> <br>
	
						<label for="birth"> 생년월일  </label>
	                    <input type="text" class="form-control" id="birth" value="${loginUser.birth}" name="birth" readonly> <br>
	
	                    <label for="gender"> &nbsp; 성별  </label>
	                    <input type="text" class="form-control" id="gender" value="${loginUser.gender}" name="gender" readonly> <br>
	
	                    <label for="phone"> &nbsp; 연락처  </label>
	                    <input type="text" class="form-control" id="phone" value="${loginUser.phone}" name="phone"> <br>
	                    
	                    <label for="email" style="margin-top: 15px;"> &nbsp; 이메일  </label> <button type="button" id="emailbtn" class="btn btn-secondary" style="float: right;">인증</button>
	                    <input type="text" class="form-control" id="email" value="${loginUser.email}" name="email"> <br>
						<input type="text" class="form-control" id="emailCheck" placeholder="인증번호를 입력하세요."> <br>
						<label id="check"></label>
	                </div> 
	                <br>
	                <div class="btns" align="center">
	                    <button type="submit" class="btn btn-secondary" style="width:477px">수정하기</button>
	                </div>
	            </form>
	        </div>
	        <br><br>
	    </div>
	</div>

	<script>

		$('#email').focus(function(){
			$('#updateEnrollForm :submit').attr('disabled', true);
		})

		$('#emailbtn').click(function(){
			$.ajax({
				url : "sendEmail.me",
				data : {email : $('#email').val()},
				success : function(secret){
					alert('메일이 전송되었습니다.');
					console.log(secret);
					$('#emailCheck').keyup(function(){
						if($('#emailCheck').val() == secret){
							$('#check').show().css("color","green").text("인증 확인");
							$('#updateEnrollForm :submit').attr('disabled', false);
						}
						else{
							$('#check').show().css("color","red").text("다시 인증해주세요.");
							$('#updateEnrollForm :submit').attr('disabled', true);
						}
					})

				}
			})
		})
	</script>

    <jsp:include page="../../common/footer.jsp" />


</body>
</html>