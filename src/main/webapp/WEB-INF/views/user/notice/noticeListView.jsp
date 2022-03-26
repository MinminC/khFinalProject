<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자-공지사항 목록</title>
<style>
	.important{
		color: red;
		font-weight: 800;
	}
	.isHide{
		display:none;
	}
	.category{
		position: relative;
	}
	#category-tab{
		position: absolute;
		top:40px;
		left:0;
		z-index:10;
		background:white;
		list-style:none;
		border: 1px solid rgb(233,233,233);
		color:black;
		padding:0;
	}
	#category-tab li{
		padding:5px;
		margin:5px;
		font-weight:500;
	}
	#wrap{
		width:1200px;
		justify-items:center;
	}
	#category-tab li:hover{
		background:gray;
		color:white;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div id="wrap" style="margin-top:200px;">
	<input type="checkbox" id="hide-important"><label for="hide-important">중요 공지 숨기기</label>
	<c:if test="${not empty hideImportant}">
		<script>
			$(function(){
				$('#hide-important').prop('checked', true);
				hideImportant();
			})
		</script>
	</c:if>
	<script>
		$(function(){
			console.log('${not empty hideImportant}');
			//중요 공지 숨기기 누르면 빨간 공지들은 사라지도록 구현
			//공지 숨기기가 되면 session에 저장되어 공지 숨기기가 계속 저장됨
			$('#hide-important').click(function(){
				hideImportant();
			})
			
			//공지 구분으로 구분되도록 구현
			$('.category').click(function(){
				if($(this).hasClass('open')){
					$('#category-tab').addClass('isHide');
					$(this).removeClass('open');
				}else{
					$('#category-tab').removeClass('isHide');
					$(this).addClass('open');
				}
			})
		})
		
		function hideImportant(){
			console.log($('#hide-important').prop('checked'));
			if($('#hide-important').prop('checked')){//트루면
				$.ajax({
					url: 'hideImportant',
					success:function(){
						$('.important').addClass('isHide');
						console.log('숨김');
					}
				})
			}else{
				$.ajax({
					url: 'openImportant',
					success:function(){
						$('.important').removeClass('isHide');
						console.log('펼침');
					}
				})
			}
		}
	</script>
	
	
	<table class="table" id="notice-list">
		<thead>
			<tr>
				<th>번호</th>
				<th class="category">
					구분▼
					<ul id="category-tab" class="isHide">
						<c:forEach var="i" items="${category}">
							<li onclick="location.href='list.no?category=${i.CATEGORY_NO}'">${i.CATEGORY_CONTENT}</li>
						</c:forEach>
					</ul>
				</th>
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
						<c:if test="${i.category eq '중요'}">
							<tr class="important">
						</c:if>
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
	<div class="notice-search">
		<form action="search.no" method="get">
			<select name="type">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="keyword">
			<input type="submit" value="검색">
		</form>
	</div>
	<script>
		$(function(){
			//상세조회 tr 누를 시 상세조회 들어가기!!
			$('#notice-list tbody>tr').click(function(){
				var loc = $(this).children('td').eq(0).text();
				location.href='detail.no?noticeNo='+loc;
				console.log(loc);
			})
			console.log('${not empty selectCategory}');
			$('#category-tab li').eq(0).text('전체보기');
		})
	</script>
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
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>