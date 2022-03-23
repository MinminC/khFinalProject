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
            var itemArr = $(result).find('item');
            var value = '';

            itemArr.each(function(i, item){
                                
                value += '<tr><td class="title">'+$(item).find('title').text()//이름
                    +'</td><td class="address">'+$(item).find('addr1').text()+' '+$(item).find('addr2').text()//주소
                    +'</td><td>'
                    +'<input type="hidden" class="areacode" value="'+$(item).find('areacode').text()//지역코드
                    +'"><input type="hidden" class="sigungucode" value="'+$(item).find('sigungucode').text()//시군구코드
                    +'"><input type="hidden" class="mapx" value="'+Math.round($(item).find('mapx').text())//x좌표
                    +'"><input type="hidden" class="mapy" value="'+Math.round($(item).find('mapy').text())//u좌표
                    +'"><input type="hidden" class="firstimage" value="'+$(item).find('firstimage').text()//대표 사진
                    +'"><input type="hidden" class="contenttype" value="'+$(item).find('contenttypeid').text()//여행지타입:12==관광지
                    +'"></td></tr>'
                    ;
            });
            $('#placeList tbody').html(value);
            //<pageNo>1</pageNo>
            //<totalCount>39</totalCount>->페이징바 만들기
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

function ajaxPlaceList(pageNo){
    console.log('여기들어옴?');
    var area = $('#area-option .btn-firstclass').text();
    var $tag = $('#tags-option .btn-firstclass');
    var tags = [];
    $tag.each(function(idx, item){
        tags.push(item.innerText);
    })
    console.log(tags);
    console.log('여기들어옴?');
    $.ajax({
        type:'post',
        dataType : 'json',
        // traditional: true,
        url:'select.pl',
        // contentType: "application/json; charset=UTF-8",
        data:{
            'tags': tags,
            'area': area
        },
        success:function(list){
            console.log(list);
            var result = '';
            var tags = '';
            
            if(list.length == 0){
                result = '검색 결과가 존재하지 않습니다.';
            }
            else{
                var tagSet = new Set();
                for(var i=0; i<list.length; i++){
                    result += '<div><img src="'+list[i].filePath+list[i].picChange+'">'
                                +'<h4>'+list[i].placeName+'</h4>'
                                +'<span>'+list[i].star+'</span></div>';
                    
                    var tagArr = list[i].placeTags.split(',');
                    
                    for(var j = 0; j<tagArr.length; j++){
                        tagSet.add(tagArr[j]);
                    }
                }
                var tagASet = Array.from(tagSet);
                //랜덤 20개만 노출
                var random = [];
                var count = 20;
                while(count>0){//20개 추출
                    var ranNum = Math.floor(Math.random()*tagSet.size);
                    if(random.indexOf(ranNum)==-1){
                        random.push(ranNum);
                        count--;
                    }
                }
                for(var i=0;i<20;i++)
                    tags +='<li class="btn btn-light">'+tagASet[random[i]]+'</li>';

                // tagSet.forEach(function(value){
                //     tags +='<li class="btn btn-light">'+value+'</li>';
                // })
            }
            makeMarker(list);
            $('#summary').html(result);
            $('#tags-option').html(tags);
        },
        error:function(){
            alert('실패');
        }	
    });
}