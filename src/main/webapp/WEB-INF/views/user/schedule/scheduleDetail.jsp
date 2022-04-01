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
/*-----스타일 추가220331-----*/
.title {
	color: rgba(18, 136, 122);
}

#idInput {
	display: inline;
}
/*일정추가*/
#container-xl {
	height: auto;
}

#content1 {
	width: 500px;
}

.input_title {
	font-weight: 600;
}

.box {
	display: block;
	width: 250px;
	height: 45px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	position: relative;
	margin: 5px
}

.inputStyle {
	display: block;
	position: relative;
	width: 100%;
	height: 25px;
	border: none;
	font-size: 13px;
}

#address_input {
	display: block;
	position: relative;
	width: 110px;
	height: 25px;
	border: none;
	font-size: 13px;
}

#address_btn {
	width: auto;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 7px;
	margin-top: -15px;
	background-color: rgba(18, 136, 122);
	color: #fff;
	border-radius: 9px;
	font-size: 13px;
}

.btn1 {
	width: 70px;
	height: 30px;
	border: 0;
	color: #fff;
	border-radius: 9px;
	background-color: rgba(18, 136, 122);
	font-size: 15px;
	font-weight: 800;
}

.btn2 {
	width: 130px;
	height: 30px;
	border: 0;
	color: #fff;
	border-radius: 9px;
	background-color: rgba(18, 136, 122);
	font-size: 15px;
	font-weight: 800;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a43134914ba810cc56c07e82b246c2cf&libraries=services"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container" style="margin-top: 200px;">
		<div class="row">
			<div class="col">
				<p>
					<span
						style="border-radius: 15px 15px 0 0; border-bottom: 2px solid rgba(18, 136, 122); padding: 0.5em; background: #c9e7e7;">모임
						일정 page</span>
				</p>
				<ul class="nav nav-tabs">

					<li class="nav-item active"><a class="nav-link"
						data-toggle="tab" href="#schedule" id="tab1" onclick="selectTime();">일정추가</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#chat" onclick="connect();" id="tab2">채팅</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#diary" id="tab3" onclick="selectAccount();">가계부</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#maps" id="tab4" onclick="selectAddress();">일정코스</a></li>
				</ul>

				<div class="tab-content show">
					<!--일정 추가 탭-->
					<div class="tab-pane fade" id="schedule">
						<p
							style="border-left: 10px solid #e6e6e6; padding: 0.5em; border-bottom: 2px solid #e6e6e6;">멤버추가</p>
						<div class="container-xl" id="container-xl">
							<form action="addmember.sc">
								<h5 class="input_title" id="idIput">추가할 회원 ID</h5>
								<input type="text" name="addId" style="display: inline;">
								<input type="hidden" name="mono" value="${moNo}"> <input
									class="btn1" type="submit" value="ok">
							</form>
							<br>
							<div id="content1">
								<form action="addDetailSchedule.sc">
									<input type="hidden" name="mo_no" value="${moNo}">
									<h5 class="input_title">주소</h5>
									<div>
										<h6 class="input_title">&nbsp;활동내용</h6>
										<span class="box"> <input type="text"
											class="inputStyle" name="activites">
										</span>
									</div>
									<div>
										<span class="box"> <input type="text"
											id="address_input" id="sample6_postcode" placeholder="우편번호"
											name="postNum"> <input type="button" id="address_btn"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</span>
									</div>
									<div>
										<span class="box"> <input type="text"
											class="inputStyle" id="sample6_address" placeholder="주소"
											name="address">
										</span>
									</div>
									<div>
										<span class="box"> <input type="text"
											class="inputStyle" id="sample6_detailAddress"
											placeholder="상세주소" name="detailAddress">
										</span>
									</div>
									<div>
										<span class="box"> <input type="text"
											class="inputStyle" id="sample6_extraAddress"
											placeholder="참고항목" name="aaa">
										</span>
									</div>
									<div>
										<h6 class="input_title">&nbsp;여행날짜</h6>
										<span class="box"> <input type="date"
											class="inputStyle" name="scheduleDate" id="scheduledate">
										</span>
									</div>
									<div>
										<h6 class="input_title">&nbsp;여행지 이름</h6>
										<span class="box"> <input type="text"
											class="inputStyle" name="scheduleTitle">
										</span>
									</div>
									<div>
										<h6 class="input_title">&nbsp;여행지 소개</h6>
										<span class="box"> <input type="text"
											class="inputStyle" name="scheduleTitle">
										</span>
									</div>
									<br> <input type="submit" class="btn2" value="submit" />
									<input type="reset" class="btn2" value="reset" />
								</form>
								<br> <br>
							</div>
						</div>
					</div>
					<!--채팅 탭 구역-->

					<div class="tab-pane fade" id="chat">

						<div class="container-xl" style="height: 600px; overflow: auto;"
							id="exampleFormControlTextarea1"></div>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="메세지를 입력하세요"
								aria-label="Recipient's username"
								aria-describedby="button-addon2" id="textarea"
								onkeyup="keyevent(this);">
							<button class="btn btn-outline-secondary " type="button"
								id="button-addon2" onclick="sendmsg();">입력</button>
						</div>
					</div>

					<!--가계부 탭 구역-->
					<div class="tab-pane fade" id="diary">
						<div class="w3-container" style="margin-top: 200px; z-index: 49;">
							<div id="accountArea"></div>
						</div>
						<div class="w3-container" style="margin-top: 200px; z-index: 50;">
							<button
								onclick="document.getElementById('id02').style.display='block';selectMember();"
								class="w3-button w3-black">지출등록</button>
						</div>
						<!-- 모달창 -->
						<div id="id02" class="w3-modal">
							<div class="w3-modal-content">
								<div class="w3-container">
									<span
										onclick="document.getElementById('id02').style.display='none'"
										class="w3-button w3-display-topright">&times;</span>

									<form action="addAccount.sc" accept-charset="UTF-8"
										name="addSchedule" method="post">
										<fieldset style="width: 150; z-index: 50; margin-top: 200px;">
											<legend>지출 등록</legend>
											<div id="selectMember"></div>
											<input type="hidden" name="mo_no" value="${moNo}" /> 지출 내용<input
												type="text" name="scheduleTitle" required /><br> <br>
											지출 날짜<input type="date" name="accountDate" id="accountDate"
												required /><br> <br> 금액 <input type="number"
												name="pay" required /><br> <br> 생성하기<input
												type="submit" value="submit" /> 초기화<input type="reset"
												value="reset" /><br> <br>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!--지도 탭 구역-->
					<div class="tab-pane fade" id="maps">
						<p>카카오맵 표시 구역</p>
						<div id="map" style="width: 100%; height: 350px;"></div>
						<select name="address" onchange="select_change(this);">
							<option value="제주특별자치도 제주시 첨단로 242">전체선택</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript">
	  	   var addressvalue;
	     		
	         $("#tab3").trigger('click');
	         $("#tab1").trigger('click');
	        
	  	
	  	   function select_change(e){
	  		   
	  		   var checkText = $("select[name='address'] option:selected").text();
		   	   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		   mapOption = {
		       center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		       level: 3 // 지도의 확대 레벨
		   };  

				//지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				//주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				//주소로 좌표를 검색합니다
				geocoder.addressSearch(e.value, function(result, status) {

		   // 정상적으로 검색이 완료됐으면 
		    if (status === kakao.maps.services.Status.OK) {

		       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		       // 결과값으로 받은 위치를 마커로 표시합니다
		       var marker = new kakao.maps.Marker({
		           map: map,
		           position: coords
		       });

		       // 인포윈도우로 장소에 대한 설명을 표시합니다
		       var infowindow = new kakao.maps.InfoWindow({
		           content: '<div style="width:150px;text-align:center;padding:6px 0;">'+checkText+'</div>'
		       });
		       infowindow.open(map, marker);

		       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		       map.setCenter(coords);
		 				  }
	    			  
	     		 })
	  	   }
	     		 
	                  function sample6_execDaumPostcode() {
	                     new daum.Postcode(
	                           {
	                              oncomplete : function(data) {
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
	                                 if (data.userSelectedType === 'R') {
	                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                                    if (data.bname !== ''
	                                          && /[동|로|가]$/g
	                                                .test(data.bname)) {
	                                       extraAddr += data.bname;
	                                    }
	                                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                                    if (data.buildingName !== ''
	                                          && data.apartment === 'Y') {
	                                       extraAddr += (extraAddr !== '' ? ', '
	                                             + data.buildingName
	                                             : data.buildingName);
	                                    }
	                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                                    if (extraAddr !== '') {
	                                       extraAddr = ' ('
	                                             + extraAddr + ')';
	                                    }
	                                    // 조합된 참고항목을 해당 필드에 넣는다.
	                                    document
	                                          .getElementById("sample6_extraAddress").value = extraAddr;

	                                 } else {
	                                    document
	                                          .getElementById("sample6_extraAddress").value = '';
	                                 }
	                                 
	                                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                                 document
	                                       .getElementById('sample6_postcode').value = data.zonecode;
	                                 document
	                                       .getElementById("sample6_address").value = addr;
	                                 // 커서를 상세주소 필드로 이동한다.
	                                 document.getElementById(
	                                       "sample6_detailAddress")
	                                       .focus();
	                              }
	                           }).open();
	                  }

	                  function receiveMsg() {
	                     $.ajax({
	                        url : "receiveMsg.ajax",
	                        data : {
	                           "mono" : "${moNo}"
	                        },
	                        success : function(e) {
	                           for (var i = 0; i < e.length; i++) {
	                              var node = document
	                                    .createElement("div");
	                              var textnode = document
	                                    .createTextNode(e[i].chatmsg);
	                              node.appendChild(textnode);
	                              document.getElementById(
	                                    "exampleFormControlTextarea1")
	                                    .appendChild(node);
	                           }

	                        },
	                        error : function() {
	                           console.log("실패");
	                        }
	                     })
	                  }

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
	                     $("#tab2").attr("onclick", false);
	                     $("#exampleFormControlTextarea1").val("");

	                     var url = "ws://localhost:8008/firstclass/gr";
	                     socket = new WebSocket(url);

	                     socket.onopen = function() {
	                        console.log("서버와 연결되었습니다.");
	                        receiveMsg();
	                     }
	                     socket.onclose = function() {
	                        console.log("서버와 연결이 종료되었습니다.");
	                     }
	                     socket.onerror = function() {
	                        console.log("오타내지맙시다.");
	                     }
	                     socket.onmessage = function(e) {

	                        var date = formatAMPM(new Date());
	                        var node = document.createElement("div");
	                        var textnode = document.createTextNode(e.data
	                              + " " + date);
	                        node.appendChild(textnode);
	                        document.getElementById(
	                              "exampleFormControlTextarea1")
	                              .appendChild(node);

	                        $.ajax({
	                           url : "sendMsg.ajax",
	                           data : {
	                              "newmsg" : e.data + " " + date,
	                              "mono" : "${moNo}"
	                           },
	                           success : function() {
	                              console.log("성공");
	                           },
	                           error : function() {
	                              console.log("실패");
	                           }
	                        });
	                     }
	                  }
	                  function disconnect() {
	                     socket.close();
	                  }
	                  function sendmsg() {
	                     var name = "${loginUser.userName}";
	                     var text = $("#textarea").val();
	                     var newmsg = name + ":" + text;


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
	   
	                  function selectAccount() {
	                    	 $.ajax({
	                              url : "selectAccount.ajax",
	                              data : {
	                                 "mono" : "${moNo}"
	                              },
	                              success : function(e) {
	                                 for (var i = 0; i < e.length; i++) {
	                                    var node = document
	                                          .createElement("div");
	                                    var textnode = document
	                                          .createTextNode("담당인원 : "
	                                                + e[i].user_name
	                                                + "지출명목 : "
	                                                + e[i].scheduleTitle
	                                                + "지출 날짜 : "
	                                                + e[i].accountDate
	                                                + "지출 금액: "
	                                                + e[i].pay);
	                                    node.appendChild(textnode);
	                                    document.getElementById(
	                                          "accountArea")
	                                          .appendChild(node);
	                                 }
	                                 $("#tab3").attr("onclick", false);
	                              },
	                              error : function() {
	                                 console.log("가계부 긁어오기 실패")
	                              }
	                           })
	                  }

 
				      function selectMember() {
			
				         $.ajax({
				                  url : "selectMember.sc",
				                  data : {
				                     "moNo" : "${moNo}"
				                  },
				                  success : function(e) {
				                     for (var i = 0; i < e.length; i++) {
				                        document.getElementById("selectMember").innerHTML += "<input type='checkbox' name='user_name' value='"+e[i]+"'><label>"
				                              + e[i] + "</label>";
				                     }
			
				                  },
				                  error : function() {
				                     console.log("실패");
				                  }
				               });
				         $.ajax({
				            url : "selectTime.sc",
				            data : {
				               "moNo" : "${moNo}"
				            },
				            success : function(e) {
				               console.log(e);
				               var start = e[0].MO_ARRIVALDATE;
				               var end = e[0].MO_DEPARTUREDATE;
				               document.getElementById("accountDate").setAttribute('max',
				                     start);
				               document.getElementById("accountDate").setAttribute('min',
				                     end);
			
				            },
				            error : function() {
				               console.log("시간긁어오기실패");
				            }
				         });
				      }
				      function selectTime() {
				         $.ajax({
				            url : "selectTime.sc",
				            data : {
				               "moNo" : "${moNo}"
				            },
				            success : function(e) {
				               var start = e[0].MO_ARRIVALDATE;
				               var end = e[0].MO_DEPARTUREDATE;
			
				               document.getElementById("scheduledate").setAttribute('max',
				                     start);
				               document.getElementById("scheduledate").setAttribute('min',
				                     end);
				            },
				            error : function() {
				               console.log("시간긁어오기 실패");
				            }
				         })
				      }

				   		function selectAddress(){
				   			$.ajax({
				   				url: "selectAddress.sc",
				   				data : {"moNo":"${moNo}"},
				   				success : function(e){
				   					console.log(e);
				   					console.log("주소긁기성공");
				   					var select_address = document.getElementsByName("address")[1];
				   					console.log(select_address);
				   					
				   					for(var i =0; i< e.length; i++){
					   					var select_address = e[i].ADDRESS;
					   					var select_title = e[i].SCHEDULETITLE;
					   					
					   					console.log(select_address + ' ' + select_title);
					   					
					   					var select_node = document.createElement("OPTION");
					   						select_node.text=select_title;
					   						select_node.value=select_address;
					   						console.log(select_node);
					   						
					   						document.getElementsByName("address")[1].appendChild(select_node);
					   						document.getElementById('tab4').setAttribute('onclick',false);
					   						
				   					}
				   				},
				   				error : function(){
				   					console.log("주소긁기실패");
				   				}
				   				
				   			});
				   		}
	      
	   	
	</script>

</body>

</html>