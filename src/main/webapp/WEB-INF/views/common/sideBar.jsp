<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://kit.fontawesome.com/44732af7e3.js" crossorigin="anonymous"></script>

<style>
    #adminDiv{
    background-color: gray !important;
}

</style>
</head>
<body>

<!-- Sidebar -->

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:200px">

    <a href="<%=request.getContextPath()%>"  style="text-decoration: none;"><h3 class="w3-bar-item"><i class="fa-solid fa-house fa-xl"></i>&nbsp;홈으로</h3></a>
    <a href="#" class="w3-bar-item w3-button">회원관리</a>
    <a href="#" class="w3-bar-item w3-button">일정관리</a>
    <a href="#" class="w3-bar-item w3-button">공지사항관리</a>
    <a href="list.pl" class="w3-bar-item w3-button">여행지관리</a>
    <a href="" class="w3-bar-item w3-button">리뷰관리</a>
    <a href="inquiry.ad" class="w3-bar-item w3-button">1:1문의</a>
</div>
    
<!-- Page Content -->

<div style="margin-left:200px">


<div class="w3-container w3-teal" id="adminDiv">
    <h1><i class="fa-solid fa-user fa-xl"></i>관리자페이지</h1>
</div>
</div>
        
</body>
</html>