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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<div class="w3-container" style="margin-top: 200px">
		<c:forEach var="moNo" items="${loginUser.moNo}">
			<div style="display:inline-block; width:200px"><a href="scheduleDetail.sc?moNo=${moNo}"><c:out value="${moNo}"/></a></div>
		</c:forEach>
	</div>
	
	<div class="w3-container" style="margin-top: 200px">
		<button
			onclick="document.getElementById('id01').style.display='block'"
			class="w3-button w3-black">모임만들기</button>
	</div>
	<!-- 모달창 -->
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>

				<form action="add.sc" accept-charset="UTF-8" name="addSchedule"
					method="post">
					<fieldset style="width: 150">
						<legend>모임 생성</legend>
						모임명<input type="text" name="scheduleTitle" required /><br>
						<br> 출발<input type="date" name="departureDate" required /> <br>
						<br> 도착<input type="date" name="arrivalDate" required /> <br>
						<br> 생성하기<input type="submit" value="submit" /> 초기화<input
							type="reset" value="reset" /><br>
						<br>
					</fieldset>
				</form>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />



</body>
</html>