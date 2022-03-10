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


</style>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>

<div class="mcOuter" style="margin-left: 200px;" align="center">
    <h6>회원관리</h6>

    <div class="mc1">
        <form>
        <select>
            <option>아이디</option>
            <option>이름</option>
        </select>
        <input type="text" style="width: 500px;"> <button class="btn btn-info">검색</button>
        </form>
    </div>
    <div class="mc2">
       
        <div class="mc2-1">
            <span>회원목록</span>
            <span>100명</span>
            <span>검색결과</span>
            <span>2명</span>
            <button class="btn btn-info" style="float: right;">회원탈퇴</button>
        </div>

        <div class="mc2-2">


            <table class="w3-table w3-bordered">
                
                <tr>
                    <th><input type="checkbox">번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>이메일</th>
                <th>가입날짜</th>
                <th>회원상태</th>
            </tr>
            <tr>
                <td><input type="checkbox">1</td>
                <td>Last Name</td>
                <td>Points</td>
                <td>Points</td>
                <td>Points</td>
                <td>Points</td>
                <td>Points</td>
            </tr>
            <tr>
                <td><input type="checkbox">2</td>
                <td>Smith</td>
                <td>Smith</td>
                <td>Smith</td>
                <td>Smith</td>
                <td>Smith</td>
                <td>50</td>
            </tr>
            <tr>
                <td><input type="checkbox">3</td>
                <td>Jackson</td>
                <td>Jackson</td>
                <td>Jackson</td>
                <td>Jackson</td>
                <td>Jackson</td>
                <td>94</td>
            </tr>
            <tr>
                <td><input type="checkbox">4</td>
                <td>Johnson</td>
                <td>Johnson</td>
                <td>Johnson</td>
                <td>Johnson</td>
                <td>Johnson</td>
                <td>67</td>
            </tr>
        </table>
        </div>
        
    </div>
    <div class="mc3">
        <br>
        <button class="w3-bar-item w3-button">1</button>
        <button class="w3-bar-item w3-button">2</button>
        <button class="w3-bar-item w3-button">3</button>
    </div>

</div>


   

</body>
</html>