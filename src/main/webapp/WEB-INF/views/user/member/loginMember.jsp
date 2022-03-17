<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

div{
    /*border: 1px solid pink;*/
}
.loginOuter{
    width: 1200px;
    height: 500px;
    margin: auto;
}

.login1{
    width: 100%;
    height: 70%;
    border: solid gray 2px ;
}

.login2{
    width: 100%;
    height: 30%;
}

.login1 input{
    width: 600px;
}

.login1 label{
    margin-right: 550px;
}

.w3-modal {
    z-index: 200 !important;
 }


</style>
</head>
<body>




    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <br>
    <div class="loginOuter" style="margin-top: 200px;">

        <h3 align="center">로그인</h3>

        <div class="w3-container login1" align="center">
          
            
            <form class="w3-container" action="login.me" method="post">
                <br><br>
                <label><b>아이디</b></label>
                <input class="w3-input w3-border w3-light-grey" type="text" name="userId">
                <br>
                <label><b>비밀번호</b></label>
                <input class="w3-input w3-border w3-light-grey" type="password" name="userPwd">
            <br><br>
            <button class="w3-bar-item w3-button w3-teal" style="width:600px">로그인</button>
        </form>
        </div>

        <div class="login2" align="center">
            <br><br>
            <!--onclick속성으로 클릭하면 id01 모달 뜰 수 있게 해라 -->
                <button class="w3-bar-item w3-button"><a href="enrollForm.me" style="color: black;">회원가입</a></button> 
                <button onclick="document.getElementById('id01').style.display='block'" class="w3-bar-item w3-button">아이디찾기</button>
                <button onclick="document.getElementById('id02').style.display='block'" class="w3-bar-item w3-button">비밀번호찾기</button>

        </div>
        
        <!--아이디찾기 모달창-->
        <div id="id01" class="w3-modal">
            <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px;">

              <div class="w3-center"><br>
                <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
              </div>

              <h5 align="center">아이디찾기</h5>
              <form class="w3-container" action="searchId.me" method="post">
                <div class="w3-section">
                  <label><b>이름</b></label>
                  <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="이름을 입력해주세요" name="userName" required>
                  <label><b>이메일</b></label>
                  <input class="w3-input w3-border" type="text" placeholder="이메일을 입력해주세요" name="email" required>
                  <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">아이디찾기</button>
                </div>
              </form>

              <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
              </div>
            </div>
          </div>
        
            <!--비밀번호찾기 모달창-->
        <div id="id02" class="w3-modal">
            <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px;">
                
              <div class="w3-center"><br>
                <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
              </div>

              <h5 align="center">비밀번호찾기</h5>
              <form class="w3-container" action="searchPwd.me" method="post">
                <div class="w3-section">
                  <label><b>아이디</b></label>
                  <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디를 입력해주세요" name="userId" required>
                  <label><b>이메일</b></label>
                  <input class="w3-input w3-border" type="text" placeholder="이메일을 입력해주세요" name="email" required>
                  <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">임시비밀번호발송</button>
                  <!--비밀번호 발송되면 alert창 뜨기-->
                </div>
              </form>

              <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
              </div>
            </div>
          </div>
        
        

    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
</body>
</html>