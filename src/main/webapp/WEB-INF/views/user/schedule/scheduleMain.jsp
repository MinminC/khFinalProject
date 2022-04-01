<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Firstclass 모임</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="resources/css/search.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
   /*레이아웃 나누기*/
   div {
        width: 100%;
    }
    div.left {
        width: 40%;
        height: 1100px;
        float: left;
        box-sizing: border-box;
    }
    
    #list{
    	 margin-left: 15%;
    	 margin-top: 100px;
    	 
    }
    div.right {
        width: 60%;
        height: 1100px;
        float: right;
        box-sizing: border-box;
    }

   /*모임만들기 버튼*/
    #main_title {
      
      font-size: 20px;
      font-weight: 600;
      color: #fff;
      margin-left: 47%;
      margin-top: 5%;
    }

    @import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");
   
    #main_img{
       width: 1300px;
    }
    button {
        margin: 20px;
    }
    .btn_area {
         margin-left: 47%;
         margin-bottom: 60px
   }
    .w-btn {
        width: 150px;
        position: relative;
        border: none;
        display: inline-block;
        padding: 12px 30px;
        border-radius: 15px;
        font-family: "paybooc-Light", sans-serif;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
    }
    .w-btn-green2 {
        background-color: rgba(18, 136, 122);
        color: #c9e7e7;
    }
    .w-btn:hover {
        letter-spacing: 2px;
        transform: scale(1.2);
        cursor: pointer;
   }  
   
   /*모달창*/
   form {
      text-align:center;
   }
   #modal_content {
      margin:auto;
      width: 300px;
   }
   #modal-title{
      font-weight: 700;
   }     
   /* 모달 입력폼 */
   .modal_title{
      font-weight: 600;
   }
   .box {
      display: block;
      width: 100;
      height: 51px;
      border: solid 1px #dadada;
      padding: 10px 14px 10px 14px;
      box-sizing: border-box;
      position: relative;
      margin: 10px
   }
   .inputStyle {
      display: block;
      position: relative;
      width: 100%;
      height: 29px;
      border: none;
      font-size: 13px;
   }
   #btnSubmit {
      width: 110px;
      padding: 13px 17px;
      border: 0;
      color: #fff;
      border-radius: 15px;
      background-color: rgba(18, 136, 122);
      font-size: 15px;
      font-weight: 900;
   }
   #btnRest {
      width: 110px;
      padding: 13px 17px;
      border: 0;
      color: #fff;
      border-radius: 15px;
      background-color: rgba(18, 136, 122);
      font-size: 15px;
      font-weight: 900;
   }
 

</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
   <div><!-- 영역 나누기 시작 -->
    <br><br><br><br><br><br><br><br><br><br>
    <!-- 타이틀 -->
    <div><span id="main_title"style=" border-radius: 15px 15px 0 0; border-bottom: 2px solid rgba(18, 136, 122); padding: 0.5em; background: #c9e7e7">모임 만들기 page</span></div>
   
   <!-- left 영역 시작 -->
   
   <div class="left">
   		<div id="list"> <!-- 회원 리스트 -->
   		<br>
	      <c:forEach var="list" items="${list}">
	         <div style=" margin-top:50px; margin-left:300px;">
	         <a href="scheduleDetail.sc?moNo=${list.mo_no}"><c:out value="${list.mo_no}"/><c:out value="${list.mo_title}"/><c:out value="${list.mo_departuredate}"/><c:out value="${list.mo_arrivaldate}"/></a>
	         </div>
	      </c:forEach>
	    </div>   
   </div><!-- left 영역 끝 -->
   <!-- right 영역 시작 -->
   <div class="right">
	   <div class="w3-container .btn_css" style="margin-top: 100px; z-index:50;">
	      <!--이미지-->
	      <div style="text-align:center;">
	         <img src="resources/img/scheduleimg.jpg" alt="일반회원" id="main_img">
	      </div>
	   </div>
   </div><!-- right 영역 끝 -->
       <!-- 모임만들기 버튼 -->
      <div class="btn_area">
      <button type="button" class="w-btn w-btn-green2" 
         onclick="document.getElementById('id01').style.display='block'">모임만들기</button>
      </div>
   </div> <!-- 영역 나누기 끝 -->
   <!-- 모달창 -->
   <div id="id01" class="w3-modal" style="z-index: 101;">
      <div class="w3-modal-content">
         <div class="w3-container">
            <span onclick="document.getElementById('id01').style.display='none'"
               class="w3-button w3-display-topright">&times;</span>
            <br><br>
            <form action="add.sc" accept-charset="UTF-8" name="addSchedule"
               method="post" onsubmit="return addSubmit();">
               <fieldset id="modal_content">
                  <legend id="modal-title">
                  <span style="border-radius: 5em; padding: 0.5em; color:#fff; background-color: rgba(18, 136, 122);">&nbsp;모임생성&nbsp;</span>
                  </legend><br>
                  <div>
                     <h6 class="modal_title">모임명</h6>
                     <span class="box">
                         <input type="text"class="inputStyle" name="scheduleTitle" required >
                      </span>
                  </div>
                  <div>
                     <h6 class="modal_title">출발</h6>
                     <span class="box">
                        <input type="date" class="inputStyle" name="departureDate" required>
                     </span>
                  </div>
                  <div>
                     <h6 class="modal_title">도착</h6>
                     <span class="box">
                        <input type="date" class="inputStyle" name="arrivalDate" required>
                     </span>
                  </div>
                  <br>
                  <input type="submit" value="submit" id="btnSubmit"/> 
                  <input type="reset" value="reset" id="btnRest"/>
                  <br><Br><br>
               </fieldset>
            </form>
         </div>
      </div>
   </div>
   <script>
   function addSubmit(event){
      var rv = false;
      var start = $("input[name=departureDate]").val()   
      var end = $("input[name=arrivalDate]").val()
      if(start > end){
         alert("시작날짜가 도착날짜보다 크면안됨둥");
      }else{
         rv = true;
      }
      return rv;
   }
   
   
   </script>



   <jsp:include page="/WEB-INF/views/common/footer.jsp" />



</body>
</html>