<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-여행지 등록</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin-place.css">
<link rel="stylesheet" type="text/css" href="resources/css/admin-styleSheet.css">
<style>
    input{
        margin:0 !important;
        padding:0;
        display:inline-block;
    }
    #searchPlace>div>select, #searchPlace>div>input, #searchPlace>div>button{
        display: inline-block;
    }
    input[name=placeName]{
        width:100%;
    }
    #tag-tab{
        background: rgb(233,233,233);
        padding-top: 20px;
        text-align: center;
        border-radius: 20px;
    }
    #selectResult p{
        padding:0;
        margin:0;
    }
</style>
</head>
<body>
    <div id="menubar"><jsp:include page="/WEB-INF/views/common/sideBar.jsp"/></div>
	<div id="wrap">
        <h1>여행지 등록</h1>
		<br>
        <div id="searchPlace">
            <div>
                <h3>여행지</h3>
                <hr>
                <select name="contentTypeId" class="form-control" style="width:200px;">
                    <c:forEach var="i" items="${placeType}">
                        <option value="${i.typeCode}">${i.typeContent}</option>
                    </c:forEach>
                </select>
                <input type="search" id="input-search" class="form-control" style="width:250px;">
                <button class="btn btn-firstclass">검색</button>
            </div>
            <script>
                
            </script>
            <table id="placeList" class="table" style="border-right:1px solid rgb(233,233,233);">
                <thead>
                    <tr>
                        <th>여행지 명</th>
                        <th>주소</th>
                    </tr>
                </thead>
                <tbody><tr><td colspan="2" style="height:400px;"></td></tr></tbody>
            </table>
            <!--pagination-->
            <ul class="pagination"></ul>
        </div>
        
        <form action="insert.pl" method="post" enctype="multipart/form-data">
            <div id="selectResult">
                <input type="text" class="form-control" name="placeName" required><br>
                <img id="placeImg" class="image" src="" alt="사진없음" style="width:100%; height:400px;">
                <input type="file" name="upfile" onchange="changeImg(this);">
                <input type="hidden" name="imgPath">
                <p>
                    위도 : <input type="text" class="form-control" style="width:100px;" name="placeLat" required>
                    경도 : <input type="text" class="form-control" style="width:100px;" name="placeLon" required><br>
                    주소 : <input type="text" class="form-control" style="width:300px;" name="placeAddress" required>
                </p>
                <p>
                    지역 코드 : 
                    <select name="area" class="form-control">
                        <c:forEach var="i" items="${areaCode}">
                            <option value="${i.areaNo}">${i.sido}</option>
                        </c:forEach>
                    </select>
                    여행지 타입 : 
                    <select name="typeCode" class="form-control">
                        <c:forEach var="i" items="${placeType}">
                            <option value="${i.typeCode}">${i.typeContent}</option>
                        </c:forEach>
                    </select>
                </p>
            </div>
            <br clear="both" />
            <div id="tag-tab">
                <h4>태그</h4>
                <div id="tags">
                    <ul style="display:inline-block;margin:0;padding:0;"></ul>
                    <input type="text" class="form-control" style="width:100px;" id="tagNow">
                    <input type="hidden" name="placeTags">
                </div>
                <br>
            </div>
            <div id="description">
                <h4>설명</h4>
                <textarea name="placeDes" class="form-control" cols="120" rows="10"></textarea>
            </div><br>
            <div id="btns-center">
                <button type="button" onclick="location.href='list.pl';" class="btn btn-secondary">목록으로</button>
                <button type="submit" onclick="return checkIntegrity();" class="btn btn-firstclass">등록하기</button>
            </div>
        </form>
    </div>
    <script>
    $(function(){
        //여행지 등록
        //여행지 검색을 하면 테이블에 띄움
        $('#searchPlace>div').on('click','button', function(){
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