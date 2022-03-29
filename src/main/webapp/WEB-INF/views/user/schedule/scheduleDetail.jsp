<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>firstclass 모임일정</title>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<script>
		$(function() {
			$("#tab4").trigger('click');
			$("#tab1").trigger('click');
		})
	</script>

	<div class="container" style="margin-top: 200px">
		<div class="row">
			<div class="col">
				<p>모임 일정 Page</p>
				<ul class="nav nav-tabs">

					<li class="nav-item active"><a class="nav-link"
						data-toggle="tab" href="#schedule" id=tab1>일정추가</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#chat" onclick="connect();" id=tab2>채팅</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#diary" id=tab3>가계부</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#maps" id=tab4>일정코스</a></li>
				</ul>

				<div class="tab-content show">
					<!--일정 추가 탭-->
					<div class="tab-pane fade" id="schedule">
						<p>일정 추가하는 탭</p>
						<div class="container-xl" style="height: 600px">
							<form action="addmember.sc">
								<p>멤버추가 ${moNo}</p>
								추가할 회원 ID : <input type="text" name="addId"> <input
									type="hidden" name="mono" value="${moNo}"> <input
									type="submit" value="확인">
							</form>
							<form action="addDetailSChedule.sc">
								<input type="text" id="sample6_postcode" placeholder="우편번호" name="postNum">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
								<input type="text" id="sample6_address" placeholder="주소" name="address"><br> 
								<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="">
							</form>
						</div>
					</div>
					<!--채팅 탭 구역-->

					<div class="tab-pane fade" id="chat">

						<div class="container-xl" style="height: 600px; overflow:auto;"
							id="exampleFormControlTextarea1"></div>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="메세지를 입력하세요"
								aria-label="Recipient's username"
								aria-describedby="button-addon2" id="textarea"
								onkeyup="keyevent(this);">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2" onclick="sendmsg();">입력</button>
						</div>
					</div>
					<script>
    			function sample6_execDaumPostcode() {
       			 new daum.Postcode({
          		  oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
					</script>
					<!--채팅 접속 스크립트-->
					<script>
					function receiveMsg(){
						$.ajax({
							url:"receiveMsg.ajax",
							data:{"mono":mono},
							success:function(e){
								console.log(e);
								console.log("긁어오기성공");
								
								for(var i=0; i<e.length;i++){
									console.log(e[i].chatmsg)
								var node = document.createElement("div");
								var textnode = document.createTextNode(e[i].chatmsg);
								node.appendChild(textnode);
								document.getElementById(
								"exampleFormControlTextarea1")
								.appendChild(node);
								}	
							
							},
							error:function(){
								console.log("실패");
							}
						})
					}
					var mono =  "${moNo}";
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
							
							//채팅기록을 누를때마다 채팅을 긁어오기때문에 포커스가 채팅탭에 와있을때 연속클릭 못하게 온클릭을 막아둠
							$("#tab2").attr("onclick",false);
							$("#exampleFormControlTextarea1").val("");

							var url = "ws://localhost:8008/firstclass/gr";
							socket = new WebSocket(url);

							socket.onopen = function() {
								console.log("서버와 연결되었습니다.");
								receiveMsg();
							}
							socket.onclose = function(){
								console.log("서버와 연결이 종료되었습니다.");
							}
							socket.onerror = function() {
								console.log("오타내지맙시다.");
							}
							socket.onmessage = function(e) {
								
								var date = formatAMPM(new Date());
								var node = document.createElement("div");
								var textnode = document.createTextNode(e.data + " " + date);
								node.appendChild(textnode);
								document.getElementById(
								"exampleFormControlTextarea1")
								.appendChild(node);
								
								$.ajax({
									url:"sendMsg.ajax",
									data:{"newmsg":e.data+" "+ date,
											"mono":mono},
									success:function(){
										console.log("성공");
									},
									error:function(){
										console.log("실패");
									}
								})
							}
						}
						function disconnect() {
							socket.close();
						}
						function sendmsg() {
							var name = "${loginUser.userName}";
							var text = $("#textarea").val();
							var newmsg = name + ":" + text;
							
							console.log("여기들어오긴하니?");
							
							socket.send(newmsg);
							$("#textarea").val("");
						}
						function keyevent() {
							var keycode = event.keyCode;
							if (keycode === 13) {
								var name = "${loginUser.userName}";
								var text = $("#textarea").val();
								var newmsg = name + ":" + text;
								
								socket.send(newmsg);
								$("#textarea").val("");
							}
						}
					</script>
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