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
          
            <form class="w3-container" action="enroll.me">
                <br><br>
                <label class="label"><b>아이디</b></label>
                <input class="w3-input w3-border w3-light-grey" type="text" name="userId" placeholder="영문 소문자/숫자 혼합 8자 이내"><button style="margin-left:20px;" class="btn btn-info">중복확인</button>
				<label class="label" style="color: red;">사용가능한 아이디 입니다</label>
                <br><br>
                <label class="label"><b>비밀번호</b></label>
                <input class="w3-input w3-border w3-light-grey" type="password" name="userPwd" placeholder="영문 소문자/숫자/특수문자 혼합 16자 이내">
				<br><br>
				<label class="label"><b>비밀번호 확인</b></label>
                <input class="w3-input w3-border w3-light-grey" type="password" name="userPwdCk" placeholder="영문 소문자/숫자/특수문자 혼합 16자 이내">
				<label style="color: red;"  class="label">비밀번호를 확인해주세요</label>
				<br><br>
				<label  class="label"><b>이름</b></label>
                <input class="w3-input w3-border w3-light-grey" type="password" name="userName" placeholder="이름을 입력하세요">
				<br><br>
				<label  class="label"><b>생년월일</b></label>
				<br>
				<select>
					<option>1990</option>
					<option>1991</option>
					<option>1992</option>
					<option>1993</option>
					<option>1994</option>
				</select>
				<span>년</span>
				<select>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
				<span>월</span>
				<select>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
				</select>
				<span>일</span>
				<br><br>
				<label class="label"><b>성별</b></label>
					<br>
					<input type="radio" name="gender" id="M"><label for="M">남</label>
					<input type="radio" name="gender" id="F"  style="margin-left: 20px;"><label for="F">여</label>
					<br><br>
				<label class="label"><b>전화번호</b></label>
                <input class="w3-input w3-border w3-light-grey" type="text" name="phone" placeholder="-를 포함하여 입력해주세요">
					<br><br>

				<label class="label"><b>본인확인이메일</b></label>
                <input class="w3-input w3-border w3-light-grey" type="text" name="email" placeholder="이메일을 입력해주세요"><button style="margin-left:20px;" class="btn btn-info">인증번호 발송</button>
				<br><br>
				<input class="w3-input w3-border w3-light-grey" type="text" name="identyNum" placeholder="인증번호를 입력해주세요">
				<br>
				<label for="lable" style="color:red">인증번호확인완료</label>
				<br><br>
            <button class="w3-button w3-block w3-teal">회원가입</button>
        </form>
        </div>
        
        
          
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

   
    <script>
    
    </script>
</body>
</html>