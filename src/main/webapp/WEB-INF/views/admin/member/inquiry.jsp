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
        margin-left: 200px;
    	
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
    tbody tr{
        width: 100%;
        height: 40px;
        cursor : pointer;
    }
    
    tbody tr:hover{
        background-color : lightgray;
    }
    .pagination{
    	text-align: center;
    	margin: auto;
    	width: 250px;
    	margin-bottom:12px;
    }
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/sideBar.jsp"/>
	
	<div id="main">
		<br>
		
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

                        <c:forEach var="b" items="${ list }">
		                    <tr>
		                        <td class="no">${ b.inqNo }</td>
		                        <td>${ b.inqTitle }</td>
		                        <td>${ b.createDate }</td>
		                        <td>
		                       		<c:choose>
			                       		<c:when test="${ empty b.inqReply }">
			                       			처리중
			                       		</c:when>
			                       		<c:otherwise>
			                       			처리완료
			                       		</c:otherwise>
		                       		</c:choose>
		                        </td>
		                    </tr>
                    	</c:forEach>
                    
                    </tbody>
                </table>
				<hr>
				
                <!-- 페이징처리(5개) -->
				<div id="pagingArea">
                	<ul class="pagination">
                
	            	<c:choose>
		            	<c:when test="${ pi.currentPage eq 1 }">
		                    <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="inquiry.ad?cpage=${pi.currentPage - 1}">&lt;</a>
						</c:otherwise>
	            	</c:choose>

					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="inquiry.ad?cpage=${p}">${ p }</a></li>
					</c:forEach>
					
					
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="inquiry.ad?cpage=${pi.currentPage + 1}">&gt;</a></li>
                		</c:otherwise>
					</c:choose>
                
                	</ul>
                                
            	</div>


	        </div>
	        <br><br>
	    </div>
	</div>
	
	<script>
			$(function(){
				$('tbody>tr').click(function(){
					location.href="inquiryDetail.ad?no="+$(this).children('.no').text();
				})
			})
	</script>
	
</body>
</html>