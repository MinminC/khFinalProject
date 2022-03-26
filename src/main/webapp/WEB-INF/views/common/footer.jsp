<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>

<style>

    div{
       /* border: solid pink 1px;*/
    }
    .footerOuter{
        width: 1200px;
        height: 100px;
        margin: auto;
        background-color: lightgray;
        width: 100%;
    
    	//푸터 고정용 구문 -손민성- 이거 고정안하면 제꺼 컨텍스트 영역 움직일때마다 푸터 같이 움직여서 고정했어요 
        position: absolute;
  		bottom: 0;
    }

    .footerOuter1{
        width: 100%;
        height: 30%;
        margin-top: 10px;

    }

    .footerOuter2{
        width: 100%;
        height: 70%;
    }

    .footerOuter1>a{
        text-decoration: none;
    }
  
    p{
        font-size: 12px;
    }
    
   .footerOuter1>a{
   		color:black;
   }

</style>
</head>
<body>

    <div class="footerOuter">
        <div class="footerOuter1">
            <a href="" target="blank">&nbsp;&nbsp;개인정보처리방침&nbsp;|</a><a href="" target="blank">&nbsp;이용약관&nbsp;|</a><a href="" target="blank">&nbsp;저작권정책&nbsp;|</a><a href="" target="blank">&nbsp;고객센터</a>
        </div>
        <div class="footerOuter2">
            <p>&nbsp;&nbsp; firstclass ｜ 사업자등록번호 : 851-87-00622 ｜ 서울 강남 제2014-01호 ｜ 대표자 : 양진선 ｜ 책임자 : 최홍석 ｜  개인정보관리책임자 : 양진선</p>
            <p>&nbsp;&nbsp; Copyright © 1998-2022 KH Information Educational Institute All Right Reserved</p>
        </div>

    </div>

</body>
</html>