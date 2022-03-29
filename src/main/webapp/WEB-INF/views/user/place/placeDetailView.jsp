<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>여행지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
    
    div{
        word-break:break-all;
    }
    #content{
        border: 1px solid lightgray;
        width: 1200px;
        margin: auto;
    }
    #div1{
        text-align: center;
        padding:auto;
        width: 100%;
        height: 90px;
        font-size: 30px;
        line-height: 90px;
    }
    #div2{
        width: 100%;
        height: 700px;
        border: 1px solid lightgray;
        padding: 10px;
    }
    #div3{
        width: 100%;
    }
    #div3>table{
        width: 100%;
    }
    #div3 tr{
        width: 100%;
        height: 50px;
        font-size: 20px;
        line-height: 40px;
        text-align: left;
        border: 0.2px solid lightgray;
    }
    #div3 th{
        width: 10%;
        text-indent: 1.8em;
    }
    #div3 td{
        width: 90%;
        padding-right:3px;
    }
    
    #review{
        width: 100%;
        height: auto;
    }
    #rv1{
        margin-top: 20px;
        margin-bottom: 5px;
        height: 40px;
    }
    #rv1_1{
        width: 50%;
        height: 100%;
        float: left;
        font-size: 30px;
        line-height: 30px;
        text-indent: 1em;
    }
    #rv1_2{
        width: 40%;
        height: 100%;
        float: right;
        font-size: 20px;
        line-height: 60px;
    }
    #rv1_2>p{
        text-decoration: none;
        color: black;
        float: right;
        text-indent: 1em;
        padding-right: 20px;
        font-size: 0.8em;
        cursor : pointer;
        display: block;
    }



    /* 리뷰 작성 부분 */
    .rv2{
	width:100%;
	height: auto;
    }

    .rv2_1{
        padding:15px;
    }
    
    .rv2_1 img{
        width:60px;
        height:60px;
    }

    .rv2_1 p{
        display: inline-block;
        font-size: 35px;
        margin: 0 0 0 10px;
    }
    .rv2_1 pre{
        display: inline-block;
        font-size: 20px;
        margin: 0 0 20 0px;
        float:right;
    }

    .rv2_2{
        width: 100%;
        height: 40px;
    }
    .rv2_2_1{
        width: 50%; 
        height:100%; 
        float: left;
    }

    .rv2_2_1 p{
        font-size: 30px; 
        margin-left: 20px;
    }
    .rv2_2_2{
        width: 50%; 
        height:100%; 
        float: left;
    }

    .rv2_2_2 p{
        font-size: 25px; 
        float: right; 
        margin-right: 30px;
    }

    .rv2_3{
        width: 100%; 
        height: auto; 
        margin-top: 5px; 
        padding: 10px;
    }

    .rv2_3 p{
        font-size: 30px;
        margin-bottom: 0px;
    }

    .rv2_3+div{
        width: 100%; 
        height: 850px;
        padding: 10px;
    
   		overflow: auto;
        position: relative;
        display: flex;
    }    
    
    .rv2_3+div::-webkit-scrollbar{
        width : 1px;
    }    
    .rv2_3+div::-webkit-scrollbar-thumb{
        background-color : #009688;
        border-radius : 10px;
    }    
    
    .rv2_3+div::-webkit-scrollbar-track{
    	background-color: white;
	}

    .rv2_3+div img{
        width: 100%;
        height: 800px;
        padding: 5px;
    }
    


    /* 파일업로드 */
    #att_zone {
        width: 770px;
        padding: 10px;
    }
    #att_zone:empty:before {
        content: attr(data-placeholder);
        color: #999;
        font-size: .9em;
    }

   /* 별점 */
   .star_rating {
       font-size:0px; 
       letter-spacing:-4px;
    }
    .star_rating a {
        font-size:40px;
        letter-spacing:0;
        display:inline-block;
        margin-left:5px;
        color:#ccc;
        text-decoration: none;
    }
    .star_rating a:first-child {
        margin-left:0;
    }
    .star_rating a.on {
        color:#777;
    }

	/* 삭제 */
    .deleteReview{
    	cursor : pointer;
    }
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    
	<div style="width:1200px; height:200px;"></div>
    <div id="content">
        <div id="div1">${p.placeName}</div>
        <div id="div2"><img src="${p.filePath}${p.picChange}" alt="여행지 사진" style="width:100%; height:100%;" ></div>
        <div id="div3">
            <table>
                <tr>
                    <th>주소  </th>
                    <td>${p.placeAddress}</td>
                </tr>
                <tr>
                    <th>태그  </th>
                    <td>${p.placeTags}</td>
                </tr>
                <tr>
                    <th>개요  </th>
                    <td>${p.placeDes}</td>
                </tr>
            </table>
        </div>
        <hr>
        <div id="review"><!--리뷰-->
            <div id="rv1">
                <div id="rv1_1">리뷰</div>
                <c:if test='${not empty loginUser}'>
                <div id="rv1_2"><p data-toggle="modal" data-target="#Modal">리뷰쓰기</p></div>
                </c:if>
            </div>
            <hr>

        </div>
    </div>

    <script>
        $(function(){
            $.ajax({
                url : "selectReviewInformation.rev",
                data : {placeNo : ${p.placeNo}},
                success : function(list){

                    let value="";
                    let star =" "
                    for(let i in list){
                    	for(let j=0; j<list[i].starScore; j++){
							star += "★";
						}
                    	
                        value += 
                        "<div class='rv2'>"
                            +"<div class='rv2_1'>"
                            	+"<img src='resources/upfiles/user/profilePic.png' alt='프로필' class='rounded-circle'>"
			                    +"<p>"+list[i].userId+"</p>";
			                    
								if('${loginUser.userId}' == list[i].userId){
				                    value += "<pre class='deleteReview'>삭제</pre>"
				                    		+"<input type='hidden' value='"+list[i].revNo+"'>";
								}
			                    
			            value += 
			                "</div>"
                            +"<div class='rv2_2'>"
                                +"<div class='rv2_2_1'><p>"+star+"</p></div>"
                                +"<div class='rv2_2_2'><p>"+list[i].createDate.substr(0, 10)+"</p></div>"
                            +"</div>"
                            +"<div class='rv2_3' ><p>"+list[i].revContent+"</p></div>"
                            +"<div class='"+list[i].revNo+"'></div>"
                            +"<hr>"
                        +"</div>";
						
						star =" ";
						
                    }
                    
                    $('#review').append(value);
                    
                    $.ajax({
                        url : "pictureReview.rev",
                        data : {placeNo : ${p.placeNo}},
                        success : function(list){
                            let value="";
                            for(let i in list){
                                value = "<img src="+list[i].changeName+">";
                                $("div[class='"+list[i].revNo+"']").append(value);
                            }

                        }
                    })
                    
                    
                    $('.deleteReview').click(function(){
			            $.ajax({
				            url : "deleteReview.rev",
				            data : {revNo : $(this).next().val()},
				            success : function(result){
					            alert('리뷰가 삭제되었습니다.');
					            location.reload();
				            }
			            })
		            })
                    
		            
                }
            })   
            
        })
        
        
    </script>

	<!-- 모달(리뷰쓰기) -->
    <div class="modal fade" id="Modal">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content" >  
            <div class="modal-body">
                <br><br>
                <h1 style="text-align: center;"><b>리뷰작성</b></h1>                
                <form method="post" action="insertReview.rev" enctype="multipart/form-data">
                <input type="hidden" name="placeNo" value="${p.placeNo}">
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <!-- 별점 -->
                <p class="star_rating" style="text-align: center;">
                    <a href="#" class="on">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                    <a href="#">★</a>
                </p>
                <p style="text-align: center; font-size: 20px;">별점을 선택해주세요.</p>
                <input type="hidden" name="starScore" value="1">
                <!-- 리뷰 작성 -->
                <textarea name="revContent" id="" style="width: 770px; height: 300px; resize: none; font-size: 20px;" placeholder="리뷰를 작성해주세요." required></textarea>
                <br><br>

                <!--사진 업로드-->
                <div id='image_preview'>
                    <input type='file' id='btnAtt' name="upfile[]" multiple='multiple' style="display: none;" />
                    <label for="btnAtt" class="btn btn-secondary">사진추가</label>
                    <div id='att_zone'></div>
                </div>


                <br>
                <input type="submit" style="width: 770px; height: 50px;" class="btn btn-secondary" value="작성">
                </form><br><br><br>
            </div>            
          </div>
        </div>
    </div> 

    <br><br><br><br><br><br>
    
    <script>
        ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn){
        
            var attZone = document.getElementById(att_zone);
            var btnAtt = document.getElementById(btn)
            var sel_files = [];
            
            // 이미지와 체크 박스를 감싸고 있는 div 속성
            var div_style = 'display:inline-block; position:relative;'
                        + 'width:150px; height:120px; margin:5px; border:1px solid black; z-index:1';

            // 미리보기 이미지 속성
            var img_style = 'width:100%; height:100%; z-index:none';

            // 이미지안에 표시되는 체크박스의 속성
            var chk_style = 'width:150px; height:120px; position:absolute; font-size:24px;'
                        + 'right:0px; bottom:0px; z-index:999; background-color:rgba(255,255,255,0.1); color:#f00';

            btnAtt.onchange = function(e){
            var files = e.target.files;
            var fileArr = Array.prototype.slice.call(files)
            for(f of fileArr){
                imageLoader(f);
            }
            }  
            
            /*첨부된 이미리즐을 배열에 넣고 미리보기 */
            imageLoader = function(file){
            sel_files.push(file);
            var reader = new FileReader();

            reader.onload = function(ee){
                let img = document.createElement('img')
                img.setAttribute('style', img_style)
                img.src = ee.target.result;
                attZone.appendChild(makeDiv(img, file));
            }
            reader.readAsDataURL(file);
            }
            
            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function(img, file){

            var div = document.createElement('div')
            div.setAttribute('style', div_style);   

            var btn = document.createElement('input')
            btn.setAttribute('type', 'button')
            btn.setAttribute('delFile', file.name);
            btn.setAttribute('style', chk_style);

            btn.onclick = function(ev){

                var ele = ev.srcElement;
                var delFile = ele.getAttribute('delFile');

                for(var i=0 ;i<sel_files.length; i++){
                    if(delFile== sel_files[i].name){
                        sel_files.splice(i, 1);      
                    }
                }      

                dt = new DataTransfer();

                for(f in sel_files) {
                    var file = sel_files[f];
                    dt.items.add(file);
                }

                btnAtt.files = dt.files;
                var p = ele.parentNode;
                attZone.removeChild(p)
            }
            div.appendChild(img)
            div.appendChild(btn)
            return div;
            }
        }
        )('att_zone', 'btnAtt')
    

        // 별점  
        $( ".star_rating a" ).click(function() {
            $(this).parent().children("a").removeClass("on");
            $(this).addClass("on").prevAll("a").addClass("on");
            $('input[name=starScore]').attr("value",$(".on").length);
            return false;
        });

        
    </script>

    <br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>