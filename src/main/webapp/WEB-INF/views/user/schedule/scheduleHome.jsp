<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>firstclass 모임일정</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
p {
	margin: 20px 0px;
}

select {
	display: block;
}

textarea {
	height: 100%;
	resize: none;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a43134914ba810cc56c07e82b246c2cf"></script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container" style="margin-top: 200px">
		<div class="row">
			<div class="col">
				<p>모임 일정 Page</p>
				<ul class="nav nav-tabs">

					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#addSchedule" onclick="">모임생성</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#chat" onclick="connect();">채팅</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#schedule">일정추가</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#diary">가계부</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#maps">일정코스</a></li>

				</ul>

				<!-- 모임생성 탭 -->
				<div class="tab-content show active">
					<div class="tab-pane fade show active" id="addSchedule">
						<div>머라도 적어놓으면 바뀌겟지?</div>
					</div>

					<!--채팅 탭 구역-->

					<div class="tab-pane fade" id="chat">


						<label for="exampleFormControlTextarea1" class="form-label">모임명
							받아올 자린데 어찌 받아오지?</label>
						<div class="container-xl" style="height: 600px" id="exampleFormControlTextarea1"></div>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="메세지를 입력하세요"
								aria-label="Recipient's username"
								aria-describedby="button-addon2" id="textarea"
								onkeyup="keyevent(this);">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2" onclick="sendmsg();">입력</button>
						</div>
					</div>
					<!--채팅 접속 스크립트-->
					<script>
					function formatAMPM(date) {
		                var hours = date.getHours();
		                var minutes = date.getMinutes();
		                var ampm = hours >= 12 ? 'PM' : 'AM';
		                hours = hours % 12;
		                hours = hours ? hours : 12; // the hour '0' should be '12'
		                minutes = minutes < 10 ? '0' + minutes : minutes;
		                var strTime = hours + ':' + minutes + ' ' + ampm;
		                return strTime;
		              }
						var socket;
						function connect() {

							$("#exampleFormControlTextarea1").val("");

							var url = "ws://localhost:8008/firstclass/gr";
							socket = new WebSocket(url);

							socket.onopen = function() {
								console.log("서버와 연결되었습니다.");
							}
							socket.onclose = function() {
								console.log("서버와 연결이 종료되었습니다.");
							}
							socket.onerror = function() {
								console.log("오타내지맙시다.");
							}
							socket.onmessage = function(e) {
								console.log("메세지가 도착했습니다.");
								console.log(e);
								var date = formatAMPM(new Date());
								var node = document.createElement("div");
								var textnode = document.createTextNode("${loginUser.userName}"+":"+ e.data +" "+ date);
								
								node.appendChild(textnode);
								
								document.getElementById("exampleFormControlTextarea1").appendChild(node);

							
							}
						}
						function disconnect() {
							socket.close();
						}
						function sendmsg() {
							console.log("여기들어오긴하니?");
							var text = $("#textarea").val();
							console.log(text);
							if (!text) {
								return;
							}
							socket.send(text);
							$("#textarea").val("");
						}
						function keyevent() {
							var keycode = event.keyCode;
							if (keycode === 13) {
								var text = $("#textarea").val();
								console.log(text);
								if (!text) {
									return;
								}
								socket.send(text);
								$("#textarea").val("");
							}
						}
					
					</script>


					<!--일정 추가 탭-->
					<div class="tab-pane fade" id="schedule">
						<p>일정 추가하는 탭</p>
						<form action="">
							<button>일정추가</button>
							<input type="datetime-local" name="" id=""> <select
								class="form-select" aria-label="Default select example">
								<option selected>시-도를 선택하라고할꺼임</option>
								<option value="1">서울특별시</option>
								<option value="2">경기도</option>
								<option value="3">충청도</option>
								<option value="4">경상도</option>
								<option value="5">전라도</option>
							</select> <input type="search" name="keyword" id="">이건뭐임
						</form>
					</div>


					<!--가계부 탭 구역-->
					<div class="tab-pane fade" id="diary">
						<p>가계부 구역</p>
						<button>지출 등록</button>
					</div>

					<!--지도 탭 구역-->
					<div class="tab-pane fade" id="maps">
						<p>카카오맵 표시 구역</p>
						<div id="map" style="width: 500px; height: 400px;"></div>
						<input type="text" placeholder="주소를 입력하세요.">
					</div>


				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>