<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-공지사항 상세</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/notice.css"> -->
<link rel="stylesheet" type="text/css" href="resources/css/admin-styleSheet.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp" />
	<div id="wrap">
		<h1>공지사항 상세 조회</h1>
		<br>
		<table class="table" id="detail">
			<thead>
				<tr>
					<td colspan="6">${n.noticeTitle}</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>구분</th>
					<td>${n.category}</td>
					<th>등록일</th>
					<td>${n.createDate}</td>
					<th>조회수</th>
					<td>${n.views}</td>
				</tr>
				<tr>
					<td colspan="6" style="padding:30px;">
						${n.noticeContent}
					</td>
				</tr>
			</tbody>
			<tfoot>
				<!-- 다음 글이 존재할 경우 -->
				<c:if test="${n.nextNoticeNo != 0}">
					<tr>
						<td colspan="6"><a href="detailAdmin.no?noticeNo=${n.nextNoticeNo}">다음글 : ${n.nextNoticeTitle}</a></td>
					</tr>
				</c:if>
				<!-- 이전 글이 존재할 경우 -->
				<c:if test="${n.prevNoticeNo != 0}">
					<t>
						<td colspan="6"><a href="detailAdmin.no?noticeNo=${n.prevNoticeNo}">이전글 : ${n.prevNoticeTitle}</a></td>
					</t>
				</c:if>
			</tfoot>
		</table>

	<!-- 목록으로 이동 -->
	<a href="listAdmin.no" class="btn btn-secondary">목록 이동</a>
	<a href="updateForm.no?noticeNo=${n.noticeNo}" class="btn btn-firstclass">수정</a>
	<a href="delete.no?noticeNo=${n.noticeNo}" class="btn btn-danger">삭제</a>
	<br>

	</div>
</body>
</html>