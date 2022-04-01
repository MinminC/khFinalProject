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
    #enrollForm{
    	width:1200px;
    }
	.form-control{
		margin:auto;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/sideBar.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <br>
            <form id="enrollForm" method="post" action="update.inq" enctype="multipart/form-data">
				
            	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
            	<input type="hidden" name="inqNo" value="${ i.inqNo }">
                <table align="center">
                	<br>
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="inqTitle" value="${ i.inqTitle }" readonly></td>
                    </tr>                   
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="inqContent" readonly>${ i.inqContent }</textarea></td>
                    </tr>
                    <c:if test="${ not empty i.inqReply }">
				        <tr>
	                        <th><label for="content">답글</label></th>
	                        <td><textarea id="content" class="form-control" rows="2" style="resize:none;" name="inqContent" readonly>${ i.inqReply }</textarea></td>
	                    </tr>          			
			    	</c:if>
                </table>
                <br>
                <div align="center">
                    <button type="button" class="btn btn-secondary" style="width: 360px; height:40px;"  data-toggle="modal" data-target="#Modal">댓글</button>
                	<button type="button" id="delete" class="btn btn-danger" style="width: 360px; height:40px;">삭제</button>
                </div>
                <br>
            </form>
        </div>
        <br><br>
    </div>
    
    <script>
    $(function(){
		$('#delete').click(function(){
			location.href="deleteInquiry.ad?no="+${i.inqNo};
		})
		
		$('#reply').click(function(){
			$.ajax({
				url : 'registReply.ad',
				data : {inqReply : $('#registReply').val(),
						inqNo : ${i.inqNo}},
				success : function(result){
					if(result == 1){
						alert('성공적으로 등록되었습니다.');
						location.href="inquiry.ad";
					}
					else{
						alert('댓글 실패');
					}
				}
			})
		})
	})
	
	
    </script>
    
    <div class="modal fade" id="Modal">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content" style=" width:500px; height:400px;" >  
            <div class="modal-body" style="text-align: center;">
                <br>
                <h3><b>문의 댓글</b></h3>
                <textarea class="form-control" style="resize:none; width:360px; height:200px" name="inqReply" id="registReply"></textarea>
                <br>
                <button type="button" id="reply" class="btn btn-secondary" style="width: 360px; height:40px;">작성</button>
                <br><br><br>
            </div>            
          </div>
        </div>
    </div>
    
</html>