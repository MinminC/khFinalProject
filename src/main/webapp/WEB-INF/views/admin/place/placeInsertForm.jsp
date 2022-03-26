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
                <tbody></tbody>
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
                <img id="placeImg" class="image" src="" alt="사진없음" width="500" height="363">
                <input type="file" onchange="changeImg(this);" name="upfile" required>
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
                            <option value="${i.typeCode}">${i.typeContent}</option>
                        </c:forEach>
                    </select>
                </p>
            </div>
            <br clear="both" />
            <div id="tags">
                <button class="btn btn-danger" onclick="$(this).next().empty()">초기화</button>
                <ul></ul>
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
    <script>
    $(function(){
        //여행지 등록
        //여행지 검색을 하면 테이블에 띄움
        $('#searchPlace>div').on('click','button', function(){
            console.log('들어옴');
            var keyword = $(this).siblings('input[type=search]').val();
            
            //xml로 오는 객체를 AJAX
            if(keyword == ''){
                alert('검색어를 입력하세요');
            }
            else{
                ajaxSearchPlace(keyword, 1);
            }

            $('#selectResult').blur(function(){

            })
        })
        
        //테이블의 행을 클릭하면 selectPlace 영역에 뜸
        $('#placeList tbody').on('click', 'tr', function(){
            $('input[name=placeName]').val($(this).find('.title').text());
            $('input[name=placeLat]').val($(this).find('.mapx').val());
            $('input[name=placeLon]').val($(this).find('.mapy').val());
            $('#selectResult>img').attr('src', $(this).find('.firstimage').val());
            $('input[name=placeAddress]').val($(this).find('.address').text());
            $('select[name=area]>option[value='+$(this).find('.areacode').val()+']').attr('selected', true);
            $('select[name=typeCode]>option[value='+$(this).find('.contenttype').val()+']').attr('selected', true);
        })

        //여행지 등록-이미지 초기화
        $('#selectResult').on('click','img',function(){
            //파일을 넣을 수 있게. 초기화 누르면 원래 이미지로 다시 변경
        })

        //위도, 경도에 숫자와 점 이외의 값이 들어가면 화냄
        $('input[name=placeLat]').keyup(function(){
            if(!regExpNumber($(this).val())){
                alert('위도를 입력하세요.');
                $(this).val('');
                $(this).focus();
            }
        })
        $('input[name=placeLon]').keyup(function(){
            if(!regExpNumber($(this).val())){
                alert('경도를 입력하세요.');
                $(this).val('');
                $(this).focus();
            }
        })
    })
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/place.js"></script>
</body>
</html>