<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<div class="container">
      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/sujin/main/login.do">건강상태 확인</a>
          </div>

          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="/sujin/main/bodyCheck.do">건강상태입력</a></li>
              <li><a href="/sujin/main/bodyCheckDetail.do">건강상태상세</a></li>
              <li class="active"><a href="/sujin/main/diary.do">일기</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/sujin/main/logout.do">logout</a></li>
            </ul>

          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->

      </nav>

	  
      <div class="jumbotron">
		
        <h2>Diary</h2>
        <br/>
        
		<form action="/sujin/main/bodyCheckSubmit.do" method="post">
			<div class="form-group" >
				<label for="subject">제목</label>
				<input type="text" id="subject" class="form-control">
			</div>
			<div class="form-group">
				<label for="smarteditor">내용</label>
				<textarea id="smarteditor" class="form-control" style="width:98%;"></textarea>
				<br/>
				<input type="button" id="submit_btn" class="btn btn-default" value="저장">
        	</div>
        </form>
      </div>

    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$(document).ready(function(){ //alert("docu ready");
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/sujin/smartEditor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#submit_btn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        var subject  = $("#subject")    .val();
        var contents = $("#smarteditor").val();
        alert("subject="+subject+"contents="+contents);
        
        
        if(subject == null || subject == "" || contents == null || contents == "<p>&nbsp;</p>"){
        	alert("제목과 내용에 값을 입력핫~쎄용");
        	return;
        }
        var param    = {subject  : subject, 
        				contents : contents
        };
        //alert("param : "+JSON.stringify(param));
        
        $.ajax({  
        	type		: "POST",
        	dataType	: "JSON",
        	url			: "/sujin/main/saveDiary.do",
        	data		: param,
        	success		: function(data){
        		alert(JSON.stringify(data));
        	},
        	complete	:function(data){
        		
        	},
        	error		:function(xhr, status, error){
        		alert(status);
        	}
        	
        });
    })
})

</script>
</body>
</html>