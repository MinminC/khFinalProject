<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        margin-top:180px;
    }
    #top>h1{
        margin-left: 30px;
    }
    #main{
    	width:1200px;
    	margin:auto;
    	
    }
    table{
        width: 60%;
        border: 0.5px solid lightgray;
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
    th{
        border: 0.5px solid lightgray;
    }

</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <div id="top">
                <h3>문의하기</h3>
            </div>
            <br>

            <form id="enrollForm" method="post" action="insert.inq" enctype="multipart/form-data">
            	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="inqTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ loginUser.userId }" readonly></td>
                    </tr>                    
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="inqContent" required></textarea></td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-secondary" style="width: 720px; height:40px;">등록하기</button>
                </div>
                <br>
            </form>
        </div>
        <br><br>
    </div>
    
    <jsp:include page="../../common/footer.jsp" /></body>
</html>