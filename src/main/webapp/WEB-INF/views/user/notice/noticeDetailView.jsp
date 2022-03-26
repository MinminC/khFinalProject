<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자-공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="wrap" style="margin-top:200px;">
		<h1>공지사항</h1>
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
						<td><a href="detail.no?noticeNo=${n.nextNoticeNo}">다음글 : ${n.nextNoticeTitle}</a></td>
					</tr>
				</c:if>
				<!-- 이전 글이 존재할 경우 -->
				<c:if test="${n.prevNoticeNo != 0}">
					<tr>
						<td><a href="detail.no?noticeNo=${n.prevNoticeNo}">이전글 : ${n.prevNoticeTitle}</a></td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>

	<!-- 목록으로 이동 -->
	<a href="list.no" class="btn btn-secondary">목록 이동</a>
	<br>
	<!--footer-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>