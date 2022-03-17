<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>

<style>
    /* div{
        border: 1px solid black;
    } */
    #top{
        border-bottom: 1px solid black;
        width: 1200px;
        margin:auto;
        margin-top:200px;
    }
    #top>h1{
        margin-left: 30px;
    }
    .main{
        width: 100%;
        height: 200px;
        display: flex;
    }
    .first{
        flex:1;
        width:30%;
        box-sizing: border-box;
    }
    .second{
        flex:1;
        margin: 0px 2%;
        width:30%;
        box-sizing: border-box;
    }
    .third{
        flex:1;
        width:30%;
        box-sizing: border-box;
    }
    .main>div{
        font-size: 25px;
        text-align: center;
        border: 1px solid black;
        line-height: 110px;
    }
    .main>div>div{
        height: 30px;
    }
    #content{
    	width : 1000px;
    	height : 550px;
		margin : auto;
    }
    
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<br>
	<div id="top">
	    <h3>마이페이지</h3>
	</div>
	<div id="content">
	    <br><br>
	    <div class="main">
	        <div class="first" data-toggle="modal" data-target="#Modal1"><div style="height: 15px;"></div><div><b>개인정보변경</b></div><div style="padding-top: 20px; font-size: 16px;">개인정보를 변경할 수 있습니다.</div></div>
	        <div class="second" data-toggle="modal" data-target="#Modal2"><div style="height: 15px;"></div><div><b>비밀번호 변경</b></div><div style="padding-top: 20px; font-size: 16px;">비밀번호를 변경할 수 있습니다.</div></div>
	        <div class="third" data-toggle="modal" data-target="#Modal3"><div style="height: 15px;"></div><div><b>회원 탈퇴</b></div><div style="padding-top: 20px; font-size: 16px;">회원을 탈퇴할 수 있습니다.</div></div>
	    </div>
	    <br>
	    <div class="main">
	        <div class="first" onclick="location.href='mySchedule.me'"><div style="height: 15px;"></div><div><b>나의 일정</b></div><div style="padding-top: 20px; font-size: 16px;">참여한 일정을 확인할 수 있습니다.</div></div>
	        <div class="second" onclick="location.href='myReview.me'"><div style="height: 15px;"></div><div><b>나의 리뷰</b></div><div style="padding-top: 20px; font-size: 16px;">작성한 리뷰를 확인할 수 있습니다.</div></div>
	        <div class="third" onclick="location.href='myInquiry.me'"><div style="height: 15px;"></div><div><b>1:1문의</b></div><div style="padding-top: 20px; font-size: 16px;">관리자에게 문의할 수 있습니다.</div></div>
	    </div>
	</div>
	
	
    <!-- 모달(개인정보 비밀번호 확인) -->
    <div class="modal fade" id="Modal1">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content" >  
            <div class="modal-body" style="text-align: center;">
                <br><br>
                <h2><b>본인확인</b></h2>
                <br>
                <h6>고객의 소중한 개인정보보호를 위해서 본인 확인을 진행합니다.</h6><br>
                <br>
                              비밀번호&nbsp;&nbsp;&nbsp;<input type="password" style="width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="updateMember();" class="btn btn-secondary" value="확인">
                <br><br><br>
            </div>            
          </div>
        </div>
    </div>
	 
	 <script> // 로그인 구현 시 로직 변경
	 	function updateMember(){
	 		location.href = "update.me";
	 	}	 
	 	
	 </script>
	 
	<!-- 모달(비밀번호 변경 비밀번호 확인) -->
    <div class="modal fade" id="Modal2">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content" >  
            <div class="modal-body" style="text-align: center;">
                <br><br>
                <h2><b>본인확인</b></h2>
                <br>
                <h6>고객의 소중한 개인정보보호를 위해서 본인 확인을 진행합니다.</h6><br>
                <br>
                              비밀번호&nbsp;&nbsp;&nbsp;<input type="password" style="width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-secondary" value="확인" onclick="updatePassword();">
                <br><br><br>
            </div>            
          </div>
        </div>
    </div> 
	 
	  <script> // 로그인 구현 시 로직 변경
	 	function updatePassword(){
	 		location.href = "update.pwd";
	 	}
	 </script>
	 
	<!-- 모달(탈퇴 비밀번호 확인) -->
    <div class="modal fade" id="Modal3">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content" >  
            <div class="modal-body" style="text-align: center;">
                <br><br>
                <h2><b>본인확인</b></h2>
                <br>
                <h6>고객의 소중한 개인정보보호를 위해서 본인 확인을 진행합니다.</h6><br>
                <br>
                              비밀번호&nbsp;&nbsp;&nbsp;<input type="password" style="width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-secondary" value="확인">
                <br><br><br>
            </div>            
          </div>
        </div>
    </div>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>