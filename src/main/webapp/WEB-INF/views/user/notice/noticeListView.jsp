<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자-공지사항 목록</title>
<link rel="stylesheet" type="text/css" href="resources/css/notice.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div id="wrap">
	<div>
		<h1>고객센터</h1>
		<h3>공지사항</h3>
		<p>
			상세한 문의는 전화 문의(02-1234-1234)와 1:1문의를 이용하시기 바랍니다.<br>
			고객센터 운영시간 : 월-금(08:00~22:00)/토(08:00~13:00)
		</p>
	</div>
	<div class="notice-search">
		<form action="search.no" method="get">
			<select name="type" class="form-control">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" class="form-control" name="keyword">
			<input type="submit" class="btn btn-secondary btn-firstclass" value="검색">
		</form>
	</div>
	<br><br>
	<div>
		<div class="float-left">
			총 게시물 <span>${pi.listCount}</span>건 &nbsp;&nbsp;&nbsp;현재 페이지 <span>${pi.currentPage}</span>/${pi.maxPage}
		</div>
		<div class="float-right">
			<input type="checkbox" id="hide-important"><label for="hide-important">중요 공지 숨기기</label>
		</div>
	</div>
	<table class="table" id="notice-list">
		<thead>
			<tr>
				<th>번호</th>
				<th class="category">
					<button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
						구분
				    </button>
				    <div class="dropdown-menu">
						<c:forEach var="i" items="${category}">
							<li class="dropdown-item" onclick="location.href='list.no?category=${i.CATEGORY_NO}'">${i.CATEGORY_CONTENT}</li>
						</c:forEach>
				    </div>
				</th>
				<!-- 구분으로 선택해서 filter -->
				<th style="width:350px;">제목</th>	
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
					<!-- 중요 공지 상단, 중요 표시 -->
					<c:forEach var="i" items="${list}">
						<tr>
							<td>${i.noticeNo}</td>
							<td>${i.category}</td>
							<c:choose>
								<c:when test="${i.category eq '중요'}">
									<td class="important">${i.noticeTitle}</td>
								</c:when>
								<c:otherwise>
									<td>${i.noticeTitle}</td>
								</c:otherwise>
							</c:choose>
							<td>${i.createDate}</td>
							<td>${i.views}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<!--pagination-->
	<c:if test="${pi.listCount != 0}">
		<ul class="pagination">
			<c:if test="${pi.currentPage != 1}">
				<li class="page-item firstPage"><a class="page-link" href="list.no?pageNo=${pi.currentPage - 1}">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${pi.currentPage eq i}">
						<li class="page-item active"><a class="page-link" href="list.no?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="list.no?pageNo=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pi.currentPage != pi.maxPage}">
				<li class="page-item endPage"><a class="page-link" href="list.no?pageNo=${pi.currentPage + 1}">&gt;</a></li>
			</c:if>
		</ul>
	</c:if>
</div>
<c:if test="${not empty cookie.hideImportantNotice}">
	<script>
		$(function(){
			$('#hide-important').prop('checked', true);
			hideImportant();
		})
	</script>
</c:if>
<c:if test="${not empty keyword}">
	<script>
		var $pageArr = $('.pagination a');
		
		for(var i=0; i<$pageArr.length;i++)
			$pageArr[i].href='search.no?keyword=${keyword}&pageNo='+$pageArr[i].innerText;
		
		$('.pagination .firstPage>a').attr('href', 'search.no?keyword=${keyword}&pageNo=${pi.currentPage - 1}');
		$('.pagination .endPage>a').attr('href', 'search.no?keyword=${keyword}&pageNo=${pi.currentPage + 1}');
	</script>
</c:if>
<c:if test="${not empty selectCategory}">
	<script>
		var $pageArr = $('.pagination a');
		
		for(var i=0; i<$pageArr.length;i++)
			$pageArr[i].href='list.no?category=${selectCategory}&pageNo='+$pageArr[i].innerText;
		
		$('.pagination .firstPage>a').attr('href', 'list.no?category=${selectCategory}&pageNo=${pi.currentPage - 1}');
		$('.pagination .endPage>a').attr('href', 'list.no?category=${selectCategory}&pageNo=${pi.currentPage + 1}');
	</script>
</c:if>

<script>
	$(function(){
		//중요 공지 숨기기
		$('#hide-important').change(function(){
				hideImportant();
		})
		
		//구분으로 카테고리 선택되도록 구현
		$('.category').click(function(){
			if($(this).hasClass('open')){
				$('#category-tab').addClass('isHide');
				$(this).removeClass('open');
			}else{
				$('#category-tab').removeClass('isHide');
				$(this).addClass('open');
			}
		})
		//구분의 맨 처음은 전체보기
		$('.dropdown-menu li').eq(0).text('전체보기');

		//상세조회 tr 누를 시 상세조회 들어가기!!
		$('#notice-list tbody>tr').click(function(){
			var loc = $(this).children('td').eq(0).text();
			location.href='detail.no?noticeNo='+loc;
		})
		$('#category-tab li').eq(0).text('전체보기');
	})

	function hideImportant(){
		if($('#hide-important').prop('checked')){//체크된 경우
			$.ajax({
				url: 'hideImportant',
				success:function(){
					$('.important').parent().addClass('isHide');
				}
			})
		}else{
			$.ajax({
				url: 'openImportant',
				success:function(){
					$('.important').parent().removeClass('isHide');
				}
			})
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>