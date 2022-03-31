<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

div{
    /*border: 1px solid pink;*/
}
.enrollFormOuter{
    width: 1200px;
    height: 1300px;
    margin: auto;
}

.enrollForm1{
    width: 100%;
    height: 80%;
    border: solid gray 2px ;
}


.enrollForm1 input[type=text]{
    width: 700px;
	display: inline-block;
}

.label{
    margin-right: 550px;
}


</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <br>
    <div class="enrollFormOuter" style="margin-top: 200px;">

        <h3 align="center">회원가입</h3>

        <div class="w3-container enrollForm1">
          
            <form class="w3-container" action="insert.me" method="post">
                <br><br>
                <label class="label"><b>아이디</b></label>
                <input id="userId" class="w3-input w3-border w3-light-grey" type="text" name="userId" placeholder="영문 소문자/숫자 혼합 6~20자 이내" required><button type="button" id = "idCk" style="margin-left:20px;" class="btn btn-info">중복확인</button>
				<label id = "idCkResult" class="label" style="color: red;"></label>
                <br><br>
                <label class="label"><b>비밀번호</b></label>
                <input id="userPwd" class="w3-input w3-border w3-light-grey" type="password" name="userPwd" placeholder="8~16자 첫글자는 영문 대소문자로 시작 영문 대소문자,숫자,특수문자 사용" required>
				<label  id = "pwdResult" style="color: red;"  class="label"></label>
				<br><br>
				<label class="label"><b>비밀번호 확인</b></label> <!-- 서버로 보내지않고 자바스크립트로 처리하기위해 네임값 설정X -->
                <input id="userPwdCk" class="w3-input w3-border w3-light-grey" type="password" placeholder="8~16자 첫글자는 영문 대소문자로 시작 영문 대소문자,숫자,특수문자 사용" required>
				<label  id = "pwdCkResult" style="color: red;"  class="label"></label>
				<br><br>
				<label  class="label"><b>이름</b></label>
                <input class="w3-input w3-border w3-light-grey" type="text" name="userName" placeholder="이름을 입력하세요" required>
				<br><br>
				<label  class="label"><b>생년월일</b></label>
				<br>
				<select  id="year" required>
					<c:forEach var = "i" begin="1900" end="2022">
					<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<span>년</span>
				<select id="month" required>
					<c:forEach var="i" begin="1" end="12">
						<c:choose>
							<c:when test="${i lt 10}">
								<option value="0${i}">0${i}</option>
							</c:when>
							<c:otherwise>
								<option value="${i}">${i}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<span>월</span>
				<select id="day" required>
					<c:forEach var="i" begin="1" end="31">
						<c:choose>
							<c:when test="${i lt 10 }">
								<option value="0${i}">0${i}</option>
							</c:when>
							<c:otherwise>
								<option value="${i}">${i}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<span>일</span>
				<input type="hidden" id="birthBox" name="birth">
				<br><br>
				<label class="label"><b>성별</b></label>
				<br>
				<input type="radio" name="gender" id="M" value="M" checked><label for="M">남</label>
				<input type="radio" name="gender" id="F" value="F" style="margin-left: 20px;"><label for="F">여</label>
				<br><br>
				<label class="label"><b>전화번호</b></label>
                <input class="w3-input w3-border w3-light-grey" type="text" name="phone" placeholder="-를 포함하여 입력해주세요" required>
				<br><br>
				<label class="label"><b>본인확인이메일</b></label>
                <input id="email" class="w3-input w3-border w3-light-grey" type="text" name="email" placeholder="이메일을 입력해주세요" required>
                <button type="button" onclick="sendMail();" style="margin-left:20px;" class="btn btn-info">인증번호 발송</button>
				<br><br>
				<input id ="secret" class="w3-input w3-border w3-light-grey" type="text" name="secret" placeholder="인증번호를 입력해주세요" required>
				<br>
				<label id="secretCkResult" for="lable" style="color:red"></label>
				<br><br>
	            <button id="insetMemBtn" class="w3-button w3-block w3-teal" onclick="birthDay();" disabled>회원가입</button>
	        </form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
    
		//생년월일 val 추가
		function birthDay(){
			var birth =''+$('#year').val()+$('#month').val()+$('#day').val(); //''문자열 넣어주면 문자열로 취급됨
			$('#birthBox').val(birth);
		}

		$(function(){
			//아이디유효성검사,중복확인
			$("#idCk").click(function(){
				var $userId= $('#userId').val();
				var regExp = /^[a-z0-9]{6,20}$/; //영문 소문자 숫자 조합으로 6~20자까지
				
				$.ajax({
					url:"idCheck.me",
					data:{checkId:$('#userId').val()}, //val로 가져오면 무조건 문자열 
					success:function(result){
						if(result=="NNNN"){//사용불가능
							$("#idCkResult").text("중복된 아이디가 존재합니다.");
							$("#userId").focus(); //다시 아이디 입력하도록 유도
						}else{//사용가능
							if(regExp.test($userId)){
								$("#idCkResult").text("사용가능한 아이디입니다.");
							}else{
								$("#idCkResult").text("6가지 이상의 영문 혹은 영문과 숫자를 조합");
								$("#userId").focus(); //다시 아이디 입력하도록 유도
							}
						}
					},error:function(){
						console.log("서버통신신패");
					}
				})
			})
			
			//비밀번호유효검사
			$('#userPwd').keyup(function(){
				var $userPwd =$('#userPwd').val(); //비밀번호
				var $userPwdCk = $('#userPwdCk').val(); //비밀번호확인
				
				var regExp = /^[a-zA-Z][\w $@!%*#?&]{7,15}$/; // /w _를 포함한 영어와 숫자들 
				
				if(!regExp.test($userPwd)){
					$("#pwdResult").html("8~16자 첫글자는 영문 대소문자로 시작/영문 대소문자,숫자,특수문자를 사용하세요 ");
					$("#userPwd").focus(); //다시 입력받도록 유도 
				}else{
					$("#pwdResult").html("");
				}
			})

			//비밀번호확인
			$('#userPwdCk').keyup(function(){
				var $userPwd =$('#userPwd').val(); //비밀번호
				var $userPwdCk = $('#userPwdCk').val(); //비밀번호확인
				if($userPwd==$userPwdCk){
					$('#pwdCkResult').html("비밀번호 일치");
				}else{
					$('#pwdCkResult').html("비밀번호을 확인해주세요");
				}
			})
			
			//이메일 인증번호 확인
			$('#secret').keyup(function(){
				$.ajax({
					url:"check",
					data:{secret:$('#secret').val()},
					success:function(result){
						if(result){
							$('#secretCkResult').text("이메일인증완료");
							$('#insetMemBtn').attr('onclick', '').unbind('click').css({'background':gray});
							$('#email').prop('readonly',true);
							$('#secret').prop('readonly',true);
						}else{
							$('#secretCkResult').text("이메일인증실패");
						}
					},error:function(){
						console.log("서버통신실패");
					}
				})
			})
		})
			
		//이메일 발송
		function sendMail(){
			$.ajax({
				url:"sendMail.me",
				data:{email:$("#email").val()},
				success:function(result){ 
					if(result=='0'){
						alert("이메일발송실패");
					}else{
						alert("이메일이발송되었습니다.3분이내 입력해주세요");
					}
				},error:function(){
					console.log("메일발송실패");
				}
			})
		}
    </script>
</body>
</html>