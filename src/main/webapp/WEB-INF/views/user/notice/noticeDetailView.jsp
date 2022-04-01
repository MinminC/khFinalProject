<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자-공지사항</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/css/notice.css">
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
						<td colspan="6"><a href="detail.no?noticeNo=${n.nextNoticeNo}">다음글 : ${n.nextNoticeTitle}</a></td>
					</tr>
				</c:if>
				<!-- 이전 글이 존재할 경우 -->
				<c:if test="${n.prevNoticeNo != 0}">
					<t>
						<td colspan="6"><a href="detail.no?noticeNo=${n.prevNoticeNo}">이전글 : ${n.prevNoticeTitle}</a></td>
					</t>
				</c:if>
			</tfoot>
		</table>
		<!-- 목록으로 이동 -->
		<a href="list.no" class="btn btn-secondary btn-firstclass">목록 이동</a><br>
	</div>
	<br>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>