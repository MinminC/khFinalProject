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
    $.ajax({
        url:'searchOpenData.pl',
        data:{
            'keyword' : keyword,
            'pageNo' : pageNo
            },
        success: function(result){
            console.log(result);
            var itemArr = $(result).find('item');
            var value = '';

            console.log(itemArr);
            itemArr.each(function(i, item){
                                
                value += '<tr><td class="title">'+$(item).find('title').text()//이름
                    +'</td><td class="address">'+$(item).find('addr1').text()+' '+$(item).find('addr2').text()//주소
                    +'</td><td>'
                    +'<input type="hidden" class="areacode" value="'+$(item).find('areacode').text()//지역코드
                    +'"><input type="hidden" class="sigungucode" value="'+$(item).find('sigungucode').text()//시군구코드
                    +'"><input type="hidden" class="mapx" value="'+$(item).find('mapx').text()//x좌표
                    +'"><input type="hidden" class="mapy" value="'+$(item).find('mapy').text()//u좌표
                    +'"><input type="hidden" class="firstimage" value="'+$(item).find('firstimage').text()//대표 사진
                    +'"><input type="hidden" class="contenttype" value="'+$(item).find('contenttypeid').text()//여행지타입:12==관광지
                    +'"></td></tr>'
                    ;
            });
            $('#placeList tbody').html(value);
            //<pageNo>1</pageNo>
            //<totalCount>39</totalCount>->페이징바 만들기
        },
        error: function(){
            console.log('error');
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