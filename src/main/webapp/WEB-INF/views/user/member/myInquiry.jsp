<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<style>
	.content {
            width:1200px;
            margin:auto;
        }
    .innerOuter {
          border-top:2.5px solid lightgray;
          border-bottom:2.5px solid lightgray;
          width:100%;
          margin:auto;
          padding:0;
   }
   #top{
        border-bottom: 1px solid black;
        width: 1200px;
        margin-top:200px;
    }
    #top>h1{
        margin-left: 30px;
    }
    #main{
    	width:1200px;
    	margin:auto;
    	
    }
    table{
        width: 100%;
    }
    thead{
        width: 100%;
        height: 60px;
        font-size: 22px;
        border-bottom:0.2px solid lightgray;
        text-align: center;
    }
    tbody{
        width: 100%;
        text-align: center;
    }
    tr{
        width: 100%;
        height: 40px;
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div id="main">
		<br>
		<div id="top">
		        <h3>나의 문의내역</h3>
		</div>
	    <div class="content">
	        <br><br>
	        <div class="innerOuter">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 7%;">번호</th>
                            <th style="width: 73%;">제목</th>
                            <th style="width: 10%;">날짜</th>
                            <th style="width: 10%;">처리</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>3</td>
                            <td>이상해씨이상해풀이상해꽃꼬부기어니부기거북왕</td>
                            <td>2022-03-09</td>
                            <td>처리중</td> <!-- 댓글이 있으면 처리완료로 수정, 관리자만 댓글 가능 -->
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>이상해씨</td>
                            <td>2022-03-09</td>
                            <td>처리중</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td>이상해요</td>
                            <td>2022-03-08</td>
                            <td>처리완료</td>
                        </tr>
                    </tbody>
                </table>

                <!-- 페이징처리(10개) -->

	        </div>
	        <br><br>
	    </div>
	</div>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>