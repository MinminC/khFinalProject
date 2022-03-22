<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://kit.fontawesome.com/44732af7e3.js" crossorigin="anonymous"></script>
<style>



.mcOuter{
    width: 1000px;
    height: 600px;
    margin: auto;
}

.mc1{
    width: 100%;
    height: 10%;
}

.mc2{
    width: 100%;
    height: 80%;
    border: solid gray 2px;
    margin-left:10px;
}

.mc3{
    width: 100%;
    height: 10%;
}

.mc2-1{
    width: 100%;
    height: 10%;
}

.mc2-2{
    width: 100%;
    height: 90%;
}

.mc2-1>span{
    float: left;
}

table td{
 font-size:12px;

}


</style>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>

<div class="mcOuter" style="margin-left: 200px;" align="center">
    <h6>회원관리</h6>

    <div class="mc1">
        <form action="search.me">
        <input type="hidden" name="currentPage" value="1">
        <select name="condition">
            <option value="id">아이디</option>
            <option value="name">이름</option>
        </select>
        <input type="text" style="width: 500px;" name="keyword" value="${keyword}"><button style="margin-left:5px" class="btn btn-info">검색</button>
        </form>
    </div>
    <div class="mc2">
       
        <div class="mc2-1">
            <span>회원목록</span>
            <span style="color:blue;">${listCount}명</span>
            <span>검색결과</span>
            <span style="color:blue;">${searchCount}명</span>
            <button id="deleteBtn" class="btn btn-info" style="float: right;">회원탈퇴</button>
        </div>

        <div class="mc2-2">


            <table class="w3-table w3-bordered">
                
                <tr>
                <th><input type="checkbox" class="allCk">회원번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>이메일</th>
                <th>가입날짜</th>
                <th>회원상태</th>
            </tr>
            
		<c:forEach var="m" items="${list}">
            <tr>
                <td><input type="checkbox" class="memCk" name="memChk"><input type="hidden" value="${m.userNo}">${m.userNo}</td>
                <td>${m.userId}</td>
                <td>${m.userName}</td>
                <td>${m.birth}</td>
                <td>${m.email}</td>
                <td>${m.enrollDate}</td>
                <td>${m.status}</td>
            </tr>
		</c:forEach>
          
        </table>
        </div>
        
    </div>
    <div class="mc3">
        <br>
 		<c:choose>
       		<c:when test="${pi.currentPage eq 1}">
		        <a href="#"class="w3-bar-item w3-button" disabled>previous</a><!-- 현재 1번페이지일경우 비활성화 -->
        	</c:when>
        	<c:otherwise>
        		<c:choose>
        			<c:when test="${empty condition}">
        				<a href="admin.me?cpage=${pi.currentPage-1}" class="w3-bar-item w3-button">previous</a><!-- 1번페이지가 아닐때 -->
        			</c:when>
        			<c:otherwise>
        				<a href="search.me?currentPage=${pi.currentPage-1}&condition=${condition}&keyword=${keyword}" class="w3-bar-item w3-button">previous</a><!-- 1번페이지가 아닐때 -->
        			</c:otherwise>
        		</c:choose>
        	</c:otherwise>
        </c:choose>
        
		<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
			<c:choose>
				<c:when test="${empty condition}">
        			<a href="admin.me?cpage=${p}" class="w3-bar-item w3-button">${p}</a>
        		</c:when>
        		<c:otherwise>
        			<a href="search.me?currentPage=${p}&condition=${condition}&keyword=${keyword}" class="w3-bar-item w3-button">${p}</a>
        		</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pi.currentPage eq pi.maxPage}">
        	<a class="w3-bar-item w3-button" disabled>next</a><!-- 마지막페이지 일경우 비활성화 -->
        	</c:when>
        	<c:otherwise>
        		<c:choose>
        			<c:when test="${empty condition}">
        				<a href="admin.me?cpage=${pi.currentPage+1}"class="w3-bar-item w3-button">next</a>
        			</c:when>
        			<c:otherwise>
        				<a href="search.me?currentPage=${pi.currentPage+1}&condition=${condition}&keyword=${keyword}" class="w3-bar-item w3-button">next</a>
        			</c:otherwise>
        		</c:choose>
        	</c:otherwise>
        </c:choose>
    </div>
	
</div>

	<script>
	
	$(function(){
		
		$('.allCk').on('change',function(){
			
			var $allCk = $('.allCk').prop('checked');
			
			if($allCk){    
				$('.memCk').prop('checked',true);
			}else{
				$('.memCk').prop('checked',false);
			}
		})
		
	
			
		$('.memCk').on('change',function(){
			
			if($(this).prop('checked')==false){ //멤쳌 이 변했는데 그게 체크되어있지 않으면 allCk체크도 false로
				$('.allCk').prop('checked',false)
			}
			
			
				var memLength = $("input[name=memChk]").length; //name이 memCk인 총 길이
				var memCkLength = $("input[name=memChk]:checked").length; //name이 memCk이고 체크된 총 길이
				
				/*console.log($("input[name=memChk]"));*/
				
				console.log(memLength);
				console.log(memCkLength);
				
				
				if(memLength==memCkLength){//둘이 길이가 같으면 올체크 선택 되게 해주세요
				$('.allCk').prop('checked',true);
				}
			
			
		})

		
				
			
	
		
	
	
		$('#deleteBtn').on("click", function(){
		
		var checkboxArr = [];
		
		$("input[name=memChk]:checked").each(function(){
			
			console.log($(this).text());
			checkboxArr.push($(this).next().val()); //체크된거 userNo을 배열에 넣어주기
			//클릭한 체크박스 옆에 인풋의 값 은 userNo
			//console.log($(this).next().val());
		})
		
		
		$.ajax({
			
			url:"delete.me",
			type:"post",
			traditional:true,
			data:{"checkboxArr":checkboxArr},
			success:function(result){
				
				if(result!=0){
					alert("회원탈퇴성공!");
					location.href="admin.me?cpage=1";
				}else{
					alert("탈퇴실패ㅠㅠ");
				
				}
						
			},error:function(){
				alert("에러");
			}

		})
			
	})
		
})	
		
	
	
	
	</script>
	
   

</body>
</html>