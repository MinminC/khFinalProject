<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/44732af7e3.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
div {
	/* box-sizing: border-box; */
	margin: 0px;
	padding: 0px;
}

.headerOuter {
	width: 1200px;
	height: 180px;
	margin: auto;
	top: 0px;
	
	position: fixed;
	background-color: white;
	width: 100%;
	text-align: center;
}

.top {
	width: 100%;
	height: 80%;
	display: flex;
	justify-content: center;
}

.bottom {
	width: 100%;
	height: 20%;
	display: flex;
	justify-content: center;
}

.top div {
	display: flex;
	flex-direction: column;
}

.logo {
	margin-top: 0px;
	width:auto;
}

.inviteAlert {
	width: 10%;
	height: 100%;
}

.userImg {
	width: 50px;
	height: 100%;
}

.mpLogin {
	width: 150px;
	height: 100%;
}

.mpLogin div {
	width: 100%;
	height: 50%;
}

.mpLogin a:hover {
	color: yellowgreen !important;
	font-weight: bold;
}

.search {
	width: 600px;
	padding: 50px;
	flex-direction:row !important;
}
.search>input{
	height: 40px;
	width: 400px;
}
.searchBtn {
	width:50px;
	height:40px;
	border: 2px solid grey;
}
</style>
<script>
	$(function(){
		$('.searchBtn').click(function(){
			location.href='search?keyword='+$('.search>input').val();
		})
	})
</script>
</head>
<body>
	<!-- alertMsg -->
	<c:if test="${not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>

		<c:remove var="alertMsg" scope="session"/> <!-- session에 있는 alertMsg 삭제  -->
	</c:if>


	<div class="headerOuter"  style="z-index:100">

		<div class="top">
			<div class="logo">
				<img src="resources/img/logo_v3.png" onclick="home()">
			</div>
			<div class="search">
				<input type="text" class="w3-input w3-border w3-light-grey">
				<img src="resources/img/searchBtn.PNG" class="searchBtn">
			</div>
			<c:choose>
				<c:when test="${not empty loginUser}">
					<div class="userImg">
						<i class="fa-solid fa-user fa-2xl" style="margin: auto;"></i>
					</div>
					<div class="mpLogin" style="margin-top:30px;">
						<label style="margin:0;font-size:12px;">${loginUser.userName}님 환영합니다</label>
						<a href="logout.me"
							style="font-size: 15px; text-decoration: none; color: gray;">logout</a>
						<a href="myPage.me" style="font-size: 15px; text-decoration: none; color: gray;">mypage</a>
						<c:if test="${loginUser!=null&&loginUser.userId=='admin1234'}">
						<a href="admin.me" style="font-size: 12px; text-decoration: none;">관리자 페이지로 이동</a>
						</c:if>
					</div>
				</c:when>
				<c:otherwise>
					<div style="padding:50px;">
						<a href="loginForm.me" class="btn btn-info"
							style="width:100px; height: 50px; background-color: #12887A; line-height: 30px;">로그인</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="bottom w3-bar w3-border w3-light-grey" align="center">

			<a href="<%=request.getContextPath()%>"class="w3-bar-item w3-button w3-text-teal"style="font-weight: bold;">홈</a> 
			<a href="main.sc" class="w3-bar-item w3-button w3-text-teal"style="font-weight: bold;">일정</a>
			<a href="main.pl" class="w3-bar-item w3-button w3-text-teal"style="font-weight: bold;">여행지</a>
			<a href="list.no" class="w3-bar-item w3-button w3-text-teal"style="font-weight: bold;">고객센터</a>
		</div>

	</div>
	
	
	<script>
	function home(){//로고 클릭시 홈 페이지로 
		location.href="<%=request.getContextPath()%>";
	}
	</script>

</body>
</html>