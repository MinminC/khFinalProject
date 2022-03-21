<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 목록</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-notice.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp" />
<div id="wrap" style="margin-top:200px;">
	<!-- 중요 공지만 보기 -->
	
	<table class="table" id="notice-list">
		<thead>
			<tr>
				<th><input type="checkbox" id="all"></th>
				<th>번호</th>
				<th>구분</th>
				<!-- 구분으로 선택해서 filter -->
				<th>제목</th>	
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr><td>공지사항이 존재하지 않습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" items="${list}">
						<!-- 중요 공지 상단, 중요 표시 -->
						<tr>
							<td><input type="checkbox" class="select"></td>
							<td>${i.noticeNo}</td>
							<td>${i.category}</td>
							<td>${i.noticeTitle}</td>
							<td>${i.createDate}</td>
							<td>${i.views}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	
	<!--pagination-->
	<ul class="pagination">
		<c:if test="${pi.currentPage != 1}">
			<li class="page-item"><a class="page-link" href="listAdmin.no?pageNo=${pi.currentPage - 1}">&lt;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item"><a class="page-link" href="listAdmin.no?keyword=${keyword}&pageNo=${i}">${i}</a></li>
			<!--해당되는 번호에 클래스 active 넣어주기!-->
		</c:forEach>
		<c:if test="${pi.currentPage != pi.maxPage}">
			<li class="page-item endPage"><a class="page-link" href="listAdmin.no?pageNo=${pi.currentPage + 1}">&gt;</a></li>
		</c:if>
	</ul>
	<a href="insertForm.no" class="btn btn-secondary">등록</a>
	<button type="button" id="modalBtn" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">삭제</button>
	
	<div class="notice-search">
		<form action="searchAdmin.no" method="get">
			<select name="type">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="keyword">
			<input type="submit" value="검색">
		</form>
	</div>
	<c:if test="${not empty keyword}">
		<script>
			var $pageArr = $('.pagination a');
			
			for(var i=0; i<$pageArr.length;i++)
				$pageArr[i].href='searchAdmin.no?keyword=${keyword}&pageNo='+$pageArr[i].innerText;
			
			$('.pagination .firstPage>a').attr('href', 'searchAdmin.no?keyword=${keyword}&pageNo=${pi.currentPage - 1}');
			$('.pagination .endPage>a').attr('href', 'searchAdmin.no?keyword=${keyword}&pageNo=${pi.currentPage + 1}');
		</script>
	</c:if>
	<c:if test="${not empty selectCategory}">
		<script>
			var $pageArr = $('.pagination a');
			
			for(var i=0; i<$pageArr.length;i++)
				$pageArr[i].href='listAdmin.no?category=${selectCategory}&pageNo='+$pageArr[i].innerText;
			
			$('.pagination .firstPage>a').attr('href', 'listAdmin.no?category=${selectCategory}&pageNo=${pi.currentPage - 1}');
			$('.pagination .endPage>a').attr('href', 'listAdmin.no?category=${selectCategory}&pageNo=${pi.currentPage + 1}');
		</script>
	</c:if>
<script>
	$(function(){
		//삭제 목록
		var deleteContent = [];
		
		//'전체' 체크하면 전체 불 들어오고 끄면 다 꺼지기. 하나씩 다 눌러서 다 채울때 불 들어오거나 하나라도 체크해제하면 불 꺼지는거 구현 안함
		$('#all').on('change', function () {
	       if ($(this).prop('checked'))
	           $('.select').prop('checked', true);
	       else
	           $('.select').prop('checked', false);
		})
		   
		//체크가 될 경우 modal에 삭제 목록에 들어감. 해제될 경우 사라짐
		$('.select').change('checked', function(){
			//삭제할 번호, 삭제할 제목 2개 받아옴
			var deleteNo = $(this).parent().siblings().eq(0).text();
			var deleteTitle = $(this).parent().siblings().eq(2).text();
			
			if ($(this).prop('checked'))
				deleteContent.push({deleteNo, deleteTitle});
			else
				deleteContent.pop({deleteNo, deleteTitle});
		})
		$('#modalBtn').click(function(){
			var result = '';
			for(var i=0;i<deleteContent.length;i++){
				console.log(deleteContent[i].deleteTitle);
				result += '<li>'+deleteContent[i].deleteTitle+'</li>';
			}
			console.log(deleteContent.map(a=> a.deleteNo));
			$('#deleteList').html(result);
		})
		//삭제modal-삭제 누르면 delete.no에 리스트로 전달
		$('#deleteSubmit').click(function(){
			var delList = deleteContent.map(a=> a.deleteNo);
			if(deleteContent.length == 0)
				alert('삭제할 항목을 선택해주세요');
			else//produces로 객체로 넘기는 방법은?
				$.ajax({
					url:'delete.no',
					type:'post',
					dataType : 'json',
					traditional: true,
					data:{'noticeNo':delList},
					success:function(){
						alert('삭제 성공했습니다.');
					},
					error:function(){
						alert('삭제 실패했습니다.');
					}
				})
		})
		
		//상세조회 tr 누를 시 상세조회 들어가기!!
		$('#notice-list tbody>tr>td').click(function(){
			var loc = $(this).siblings().eq(1).text();
			if($(this).parent().children().eq(0).text()!=$(this).text())
				location.href='detailAdmin.no?noticeNo='+loc;
		})
	})	
</script>

	<!-- Modal : DeleteForm -->
	<div class="modal delete-form" id="deleteForm">
		<div class="modal-dialog">
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">공지사항 삭제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<ul id="deleteList"></ul>
						삭제하시겠습니까? 
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button id="deleteSubmit" type="submit" class="btn btn-danger" data-dismiss="modal">삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>