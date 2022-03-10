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
	/* border: 1px solid pink; */
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
}

.headerOuter {
	width: 1200px;
	height: 180px;
	margin: auto;
	top: 0px;
}

.top {
	width: 100%;
	height: 80%;
	display: flex;
}

.bottom {
	width: 100%;
	height: 20%;
	display: flex;
	justify-content: center
}

.top div {
	/*display: inline-table;*/
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.logo {
	width: 30%;
	height: 100%;
	margin-top: 0px;
}

.search {
	width: 30%;
}

.searchBtn {
	width: 10%;
}

.inviteAlert {
	width: 10%;
	height: 100%;
}

.userImg {
	width: 10%;
	height: 100%;
}

.mpLogin {
	width: 10%;
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

.headerOuter {
	position: fixed;
	background-color: white;
	width: 100%;
}
</style>
</head>
<body>

	<div class="headerOuter">
		<div class="top">
			<div class="logo">
				<img src="resources/img/reallogo.png" height="330px">
			</div>
			<div class="search">
				<input class="w3-input w3-border w3-light-grey"
					style="height: 40px; margin: auto;">
			</div>
			<div class="searchBtn">
				<img src="resources/img/searchBtn.PNG" width="50px" height="40px"
					style="margin-top: 0px; border: 2px solid grey;">
			</div>
			<c:choose>
				<c:when test="${not empty loginUser}">
					<div class="inviteAlert">
						<i class="fa-solid fa-envelope fa-2xl"><span
							style="font-size: 10px; color: red;">3</span></i>
					</div>
					<div class="userImg">
						<i class="fa-solid fa-user fa-2xl" style="margin: auto;"></i>
					</div>
					<div class="mpLogin">

						<label style="margin-top: 70px;"><p>${loginUser.userName}님 환영합니다</p></label>

						<div>
							<a href="logout.me"
								style="font-size: 15px; text-decoration: none; color: gray;">logout</a>
						</div>
						<div style="margin-bottom: 100px;">
							<a href="myPage.me"
								style="font-size: 15px; text-decoration: none; color: gray;">mypage</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<a href="loginForm.me" class="btn btn-info"
						style="height: 50px; margin-top: 50px; background-color: #12887A;">로그인화면으로</a>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="bottom w3-bar w3-border w3-light-grey" align="center">


			<a href="<%=request.getContextPath()%>"class="w3-bar-item w3-button w3-text-teal"style="font-weight: bold;">홈</a> 
			<a href="main.sc" class="w3-bar-item w3-button w3-text-teal"style="font-weight: bold;">일정</a>
			<a href="#"	class="w3-bar-item w3-button w3-text-teal"style="font-weight: bold;">여행지</a>

		</div>


	</div>





</body>
</html>