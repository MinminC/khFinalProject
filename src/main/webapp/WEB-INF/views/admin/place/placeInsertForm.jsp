<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-place.css">
</head>
<body>
    <div id="menubar"><jsp:include page="/WEB-INF/views/common/sideBar.jsp"/></div>
	<div id="wrap">
        <div id="searchPlace">
            <div>
                <span>여행지</span><input type="search"><button class="btn btn-secondary">검색</button>
            </div>
            <script>
                
            </script>
            <table id="placeList" class="table">
                <thead>
                    <tr>
                        <th>여행지 명</th>
                        <th>주소</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>산림박물관</td>
                        <td>강원도</td>
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
        
        <form action="insert.pl" method="post" enctype="multipart/form-data">
            <div id="selectResult">
                <input type="text" name="placeName" required><br>
                    <img class="image" src="" alt="사진없음" width="500" height="363">
                    <input type="file" name="upfile" required>
                    <p>
                        위도 : <input type="text" min="0" size="3" name="placeLat" required>
                        경도 : <input type="text" min="0" size="3" name="placeLon" required><br>
                        주소 : <input type="text" size="50" name="placeAddress" required>
                    </p>
                    <p>
                        지역 코드 : 
                        <select name="area">
                            <c:forEach var="i" items="${areaCode}">
                                <option value="${i.areaNo}">${i.sido}</option>
                            </c:forEach>
                        </select>
                        여행지 타입 : 
                        <select name="typeCode">
                            <c:forEach var="i" items="${placeType}">
                                <option value="${i.areaNo}">${i.sido}</option>
                            </c:forEach>
                        </select>
                    </p>
            </div>
            <br clear="both" />
            <div id="tags">
                <button class="btn btn-danger" onclick="$(this).next().empty()">초기화</button>
                <ul>
                    <li>
                        <span>제주도</span>
                        <i>X</i>    
                    </li>
                </ul>
                <input type="text" id="tagNow">
                <input type="hidden" name="placeTags">
            </div>
            <div id="description">
                <textarea name="placeDes" id="" cols="120" rows="10"></textarea>
            </div>
            <div id="btns-center">
                <button onclick="location.href='list.pl';" class="btn btn-secondary">목록으로</button>
                <button type="submit" onclick="return checkIntegrity();" class="btn btn-primary">등록하기</button>
            </div>
        </form>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/place.js"></script>
</body>
</html>