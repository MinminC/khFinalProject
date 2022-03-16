<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 상세</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-notice.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp" />
	<div id="wrap" style="margin-top:200px;">
		<table class="table">
			<thead>
				<tr>
					<th>${n.noticeTitle}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<ul>
							<li><span>구분</span><span>${n.category}</span></li>
							<li><span>등록일</span><span>${n.createDate}</span></li>
							<li><span>조회수</span><span>${n.views}</span></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						${n.noticeContent}
					</td>
				</tr>

				<!-- 다음 글이 존재할 경우 -->
				<c:if test="${n.nextNoticeNo != 0}">
					<tr>
						<td><a href="detailAdmin.no?noticeNo=${n.nextNoticeNo}">다음글 : ${n.nextNoticeTitle}</a></td>
					</tr>
				</c:if>
				<!-- 이전 글이 존재할 경우 -->
				<c:if test="${n.prevNoticeNo != 0}">
					<tr>
						<td><a href="detailAdmin.no?noticeNo=${n.prevNoticeNo}">이전글 : ${n.prevNoticeTitle}</a></td>
					</tr>
				</c:if>
			</tbody>
		</table>

	<!-- 목록으로 이동 -->
	<a href="listAdmin.no" class="btn btn-secondary">목록 이동</a>
	<a href="updateForm.no?noticeNo=${n.noticeNo}" class="btn btn-secondary">수정</a>
	<a href="delete.no?noticeNo=${n.noticeNo}" class="btn btn-secondary">삭제</a>
	<br>

	</div>
</body>
</html>