<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>myPage</title>

<style>
    /* div{
        border: 1px solid black;
    } */
    #top{
        border-bottom: 1px solid black;
        width: 1200px;
    }
    #top>h1{
        margin-left: 30px;
    }
    .main{
        width: 1200px;
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
    	width : 1200px;
    	height : 550px;
		margin : auto;
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div id="content">
		<br>
		<div id="top">
	        <h2>마이페이지</h2>
	    </div>
	    <br><br>
	    <div class="main">
	        <div class="first" data-toggle="modal" data-target="#Modal"><div style="height: 15px;"></div><div><b>개인정보변경</b></div><div style="padding-top: 20px; font-size: 16px;">개인정보를 변경할 수 있습니다.</div></div>
	        <div class="second"><div style="height: 15px;"></div><div><b>비밀번호 변경</b></div><div style="padding-top: 20px; font-size: 16px;">비밀번호를 변경할 수 있습니다.</div></div>
	        <div class="third"><div style="height: 15px;"></div><div><b>회원 탈퇴</b></div><div style="padding-top: 20px; font-size: 16px;">회원을 탈퇴할 수 있습니다.</div></div>
	    </div>
	    <br>
	    <div class="main">
	        <div class="first"><div style="height: 15px;"></div><div><b>나의 일정</b></div><div style="padding-top: 20px; font-size: 16px;">참여한 일정을 확인할 수 있습니다.</div></div>
	        <div class="second"><div style="height: 15px;"></div><div><b>나의 리뷰</b></div><div style="padding-top: 20px; font-size: 16px;">작성한 리뷰를 확인할 수 있습니다.</div></div>
	        <div class="third"><div style="height: 15px;"></div><div><b>1:1문의</b></div><div style="padding-top: 20px; font-size: 16px;">관리자에게 문의할 수 있습니다.</div></div>
	    </div>
	</div>
    <br><br><br>

	
    <!-- 모달
    <div class="modal fade" id="Modal">
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
     -->
	 
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>