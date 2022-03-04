<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="menubar"><jsp:include page="/WEB-INF/views/common/sideBar.jsp"/></div>
	<div id="wrap">
        <div id="searchPlace">
            <span>여행지</span><input type="search"><button>검색</button>
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            번호
                            <input type="hidden" value="1">

                        </th>
                        <th>여행지 명</th>
                        <th>시, 도</th>
                        <th>구, 군</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <!--pagination-->
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
        <div id="searchResult">
            <h3>강원도 산림박물관</h3>
            <img src="http://tong.visitkorea.or.kr/cms/resource/53/2721553_image2_1.jpg">
            <p>

            </p>
        </div>
        <div>
            <div id="tags">
                <ul>
                    <li>
                        <span>제주도</span>
                        <i>X</i>
                    </li>
                </ul>
                <input type="text" id="tagNow">
            </div>
        </div>
    </div>
</body>
</html>