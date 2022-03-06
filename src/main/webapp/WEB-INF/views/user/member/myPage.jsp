<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>myPage</title>

<style>
    /* div{
        border: 1px solid black;
    } */
    #top{
        border-bottom: 1px solid black;
        width: 1200px;
    }
    #top>h1{
        margin-left: 30px;
    }
    .main{
        width: 1200px;
        height: 200px;
        display: flex;
    }
    .first{
        flex:1;
        width:30%;
        box-sizing: border-box;
    }
    .second{
        flex:1;
        margin: 0px 2%;
        width:30%;
        box-sizing: border-box;
    }
    .third{
        flex:1;
        width:30%;
        box-sizing: border-box;
    }
    .main>div{
        font-size: 25px;
        text-align: center;
        border: 1px solid black;
        line-height: 110px;
    }
    .main>div>div{
        height: 30px;
    }
    #content{
    	width : 1200px;
    	height : 550px;
		margin : auto;
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div id="content">
		<br>
		<div id="top">
	        <h2>����������</h2>
	    </div>
	    <br><br>
	    <div class="main">
	        <div class="first" data-toggle="modal" data-target="#Modal"><div style="height: 15px;"></div><div><b>������������</b></div><div style="padding-top: 20px; font-size: 16px;">���������� ������ �� �ֽ��ϴ�.</div></div>
	        <div class="second"><div style="height: 15px;"></div><div><b>��й�ȣ ����</b></div><div style="padding-top: 20px; font-size: 16px;">��й�ȣ�� ������ �� �ֽ��ϴ�.</div></div>
	        <div class="third"><div style="height: 15px;"></div><div><b>ȸ�� Ż��</b></div><div style="padding-top: 20px; font-size: 16px;">ȸ���� Ż���� �� �ֽ��ϴ�.</div></div>
	    </div>
	    <br>
	    <div class="main">
	        <div class="first"><div style="height: 15px;"></div><div><b>���� ����</b></div><div style="padding-top: 20px; font-size: 16px;">������ ������ Ȯ���� �� �ֽ��ϴ�.</div></div>
	        <div class="second"><div style="height: 15px;"></div><div><b>���� ����</b></div><div style="padding-top: 20px; font-size: 16px;">�ۼ��� ���並 Ȯ���� �� �ֽ��ϴ�.</div></div>
	        <div class="third"><div style="height: 15px;"></div><div><b>1:1����</b></div><div style="padding-top: 20px; font-size: 16px;">�����ڿ��� ������ �� �ֽ��ϴ�.</div></div>
	    </div>
	</div>
    <br><br><br>

	
    <!-- ���
    <div class="modal fade" id="Modal">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content" >  
            <div class="modal-body" style="text-align: center;">
                <br><br>
                <h2><b>����Ȯ��</b></h2>
                <br>
                <h6>���� ������ ����������ȣ�� ���ؼ� ���� Ȯ���� �����մϴ�.</h6><br>
                <br>
                ��й�ȣ&nbsp;&nbsp;&nbsp;<input type="password" style="width: 300px;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-secondary" value="Ȯ��">
                <br><br><br>
            </div>            
          </div>
        </div>
      </div>
     -->
	 
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>