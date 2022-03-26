$(function(){
    //태그에서 벗어나면 태그 목록에 등록
    $('#tagNow').blur(function(){
        $(this).siblings('ul').append('<li><span>'+$(this).val()+'</span><i>X</i></li>');
        $(this).val('');
    })
    $('#tags').on('click','i', function(){
        $(this).parent().remove();
    })
})

function regExpNumber(keyword){
    var regExp = /^[\d.]{1,}$/;
    return regExp.test(keyword);
}

function ajaxSearchPlace(keyword, pageNo){
    var contentTypeId = $('select[name=contentTypeId]').val();
    $.ajax({
        url:'searchOpenData.pl',
        data:{
            'keyword' : keyword,
            'pageNo' : pageNo,
            'contentTypeId' :  contentTypeId
            },
        success: function(result){
            var currentPage = pageNo;
            //페이징바 10개, 총 게시글은 5개씩 보여주기
                var listCount = Number($(result).find('totalCount').text());
                var currentPage = Number($(result).find('pageNo').text());
                var pageLimit = Number($(result).find('numOfRows').text());
                var boardLimit = 10;
                var maxPage = Math.ceil(listCount/boardLimit);
                var startPage = (currentPage -1)/pageLimit * pageLimit +1;
                var endPage = startPage + pageLimit -1;
                
                if(endPage > maxPage)
                    endPage = maxPage;

                var value='';
                
                if(currentPage != 1)
                    value += '<li class="page-item"><a class="page-link" onclick="ajaxSearchPlace('+"'"+keyword+"'"+', '+(pageNo-1)+');">&lt;</a></li>';
                for(var i=1;i<endPage+1;i++){
                    value += '<li class="page-item';
                    if(currentPage == i)
                        value += ' active';
                    value += '"><a class="page-link" onclick="ajaxSearchPlace('+"'"+keyword+"'"+', '+i+');">'+i+'</a></li>';
                }
                if(currentPage<maxPage)
                    value += '<li class="page-item endPage"><a class="page-link" onclick="ajaxSearchPlace('+"'"+keyword+"', "+(pageNo+1)+');">&gt;</a></li>';
                $('.pagination').html(value);
                
                var itemArr = $(result).find('item');
                var value = '';
                itemArr.each(function(i, item){//인덱스, 해당 인덱스에서의 값
                                
                value += '<tr><td class="title">'+$(item).find('title').text()//이름
                    +'</td><td class="address">'+$(item).find('addr1').text()+' '+$(item).find('addr2').text()//주소
                    +'</td><td>'
                    +'<input type="hidden" class="areacode" value="'+$(item).find('areacode').text()//지역코드
                    +'"><input type="hidden" class="sigungucode" value="'+$(item).find('sigungucode').text()//시군구코드
                    +'"><input type="hidden" class="mapx" value="'+$(item).find('mapx').text()//x좌표
                    +'"><input type="hidden" class="mapy" value="'+$(item).find('mapy').text()//u좌표
                    +'"><input type="hidden" class="firstimage" value="'+$(item).find('firstimage').text()//대표 사진
                    +'"><input type="hidden" class="contenttype" value="'+$(item).find('contenttypeid').text()//여행지타입:12==관광지
                    +'"></td></tr>';
            });
            $('#placeList tbody').html(value);
        }
    })
}

function checkIntegrity(){
    //태그를 하나로 묶기
    var tagArr = [];
    var $tags = $('#tags span');
    for(var i = 0; i<$tags.length; i++)
        tagArr.push($tags[i].innerText);
    var tagStr = tagArr.join(',');
    $('input[name=placeTags]').val(tagStr);

    //내용 삽입
    if(!$('textarea[name=placeDes]').val()){
        alert('내용 넣어요!!!!');
        return false
    }
    return true;
}

function changeImg(picture){
    if(picture.files.length == 1){
        var reader = new FileReader();
        reader.readAsDataURL(picture.files[0]);
        reader.onload = function(e){
            $('#placeImg').attr('src', e.target.result);
        }
    }else
        $('#placeImg').attr('src', null);
}

