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
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/sujin/main/login.do">메인</a>
          </div>

          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="/sujin/main/bodyCheck.do">몸</a></li>
              <li><a href="/sujin/main/food.do">음식</a></li>
              <li><a href="/sujin/main/coffee.do">커피</a></li>
              <li class="active"><a href="/sujin/main/diary.do">일기</a></li>
              <li><a href="/sujin/main/counsel.do">상담</a></li>
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
				<input type="text" id="subject" name="SUBJECT" class="form-control">
			</div>
			<div class="form-group">
				<label for="editor">내용</label>
				<textarea id="editor" class="form-control" name="DIARY" style="width:98%;"></textarea>
				
				<br/>
				<input type="button" id="submit_btn" class="btn btn-default btn-block" style="margin-top:10px;" value="저장">
        	</div>
        </form>
      </div>
      
      <div class="jumbotron" id="diary_contents">
      	
      </div><!-- JUMBOTRON -->
      
      
      <div class="jumbotron" >
	  	<input type="button" id="plus_contents" class="btn btn-primary btn-block" style="margin-top:10px;" value="더보기" >
      </div><!-- JUMBOTRON -->
    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript"> 
var CNT	     =  0;
var PAGE_CNT = 10;

$(document).ready(function(){ //alert("docu ready");
	
	fnGetDiaryList();

    //전역변수선언
	//naver smart editor --
	/* 
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
        
        if(subject == null || subject == "" || contents == null || contents == "<p>&nbsp;</p>"){
        	alert("제목과 내용에 값을 입력핫~쎄용");
        	return;
        }
        var param    = {SUBJECT  : subject, 
        				DIARY    : contents
        };
        //alert("param : "+JSON.stringify(param));
        
        $.ajax({  
        	type		: "POST",
        	dataType	: "JSON",
        	url			: "/sujin/main/saveDiary.do",
        	data		: param,
        	success		: function(data){
        		alert("저장됨!");
        	},
        	complete	:function(data){
        		
        	},
        	error		:function(xhr, status, error){
        		alert(status);
        	}
        	
        });
    }) */
    /* 
    ['Source','-','Save','NewPage','Preview','-','Templates'],
    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
    '/',
    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    ['Link','Unlink','Anchor'],
    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
    '/',
    ['Styles','Format','Font','FontSize'],
    ['TextColor','BGColor'],
    ['Maximize', 'ShowBlocks','-','About'] */
    
    
    // [ ck editor ]
    //CKEDITOR.replace("editor");
    CKEDITOR.replace("editor", {
    	
    	toolbar: 
    	[
    		["Undo", "Redo", "Bold", "Italic", "Underline", "Styles", "Format", "Font", "FontSize", "TextColor", "BGColor"]		  
    	]
    	
    });
    
    $("#submit_btn").click(function(){
    	var contents = CKEDITOR.instances.editor.getData();
    	var subject  = $("#subject").val();
    	if(subject == null || subject == "" || contents == null || contents == ""){
        	alert("제목과 내용에 값을 입력핫~쎄용");
        	return;
        }
    	
    	var param    = {SUBJECT  : subject, 
						DIARY    : contents
		};
    	$.ajax({  
        	type		: "POST",
        	dataType	: "JSON",
        	url			: "/sujin/main/saveDiary.do",
        	data		: param,
        	success		: function(data){
        		alert("저장됨!");
        		
        		$("#diary_contents").html("");
        		fnGetDiaryList();
        	},
        	complete	:function(data){
        		
        	},
        	error		:function(xhr, status, error){
        		alert(status);
        	}
        	
        });

    });
    
    
    function fnGetDiaryList(){ //일기 리스트 가져오기 
    	
    	var param = { CNT  : CNT*PAGE_CNT
    				 ,CNT1 : (CNT+1)*PAGE_CNT-1  
    	};
    	
    	$.ajax({  
    		type		: "POST",
    		url			: "/sujin/main/getDiaryList.do",
    		dataType	: "JSON",
    		data		: param,
    		success		: function(data){
    			//alert(JSON.stringify(data.result));
    			/* 
    			<div class="list_wrap" id="list_wrap">
	          		<div class="form-group">
	    		    	<label for="writer" class="control-label">작성자</label>
	    		    	<input type="text" class="form-control" name="WRITER" id="writer" readonly>
	    		    	<label for="reg_dt" class="control-label">등록일</label>
	    		    	<input type="text" class="form-control" name="REG_DT" id="reg_dt" readonly>
	    			</div>
	          		<div class="form-group">
	    			    <label for="subject" class="control-label">제목</label>
	    				<input type="text" class="form-control" name="SUBJECT" id="subject" readonly>
	    			</div>
	          		<div class="form-group">
	    			    <label for="contents" class="control-label">내용</label>
	    			    <textarea class="form-control" name="DIARY" id="contents" readonly></textarea>
	    			</div>
	    			<div class="form-group">
	    				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		    			<input type="hidden" name="DIAY_NO" value="">
	    			</div>
	    			
	          	</div>
    			 */
    			 var html = "";
    			 
    			 if(data.result.length == 0){ 
    				 $("#plus_contents").attr("disabled", true);
    				 $("#plus_contents").val("더이상 불러올 수 없습니다.");
    			 }
    			 
    			 $.each(data.result, function(idx, obj){
    				html+=" <div class=\"list_wrap\" id=\"list_wrap\">                                              						";
	 	          	html+="	<div class=\"form-group\">                                                            							";
	 	    		html+="    	<label for=\"writer\" class=\"control-label\">작성자</label>                        						";
	 	    		html+="    	<input type=\"text\" class=\"form-control\" name=\"WRITER\" id=\"writer\" value="+obj.WRITER+" readonly>	";
	 	    		html+="	</div>                                                                              							";
	 	          	html+="	<div class=\"form-group\">                                                            							";
	 	    		html+="    	<label for=\"reg_dt\" class=\"control-label\">등록일</label>                        						";
	 	    		html+="    	<input type=\"text\" class=\"form-control\" name=\"REG_DT\" id=\"reg_dt\" value="+obj.REG_DT+" readonly>	";
	 	    		html+="	</div>                                                                              							";
	 	          	html+="	<div class=\"form-group\">                                                            							";
	 	    		html+="	    <label for=\"subject\" class=\"control-label\">제목</label>                         						";
	 	    		html+="		<input type=\"text\" class=\"form-control\" name=\"SUBJECT\" id=\"subject\" value="+obj.SUBJECT+" readonly> ";
	 	    		html+="	</div>                                                                              							";
	 	          	html+="	<div id=\"contents\" class=\"contents\">                                                     					";
	 	    		html+=  	obj.DIARY																									 ; 
	 	    		html+="	</div>                                                                              							";
	 	    		
	 	    		html+="<button class=\"btn btn-default btn-xs btn-del\" id="+obj.DIARY_NO+" style=\"margin-top:10px;\">"; 
	 	    		html+="  <span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span> 삭제    								"; 
	 	    		html+="</button>                                                                      									"; 
	 	    		
			 	 	html+="</div>																											";
	 	          	//html+="</div>                                                                               							";
    				 
    			 });
    			 
    			 $("#diary_contents").append(html);
    			 
    			 /* 삭제버튼 클릭시 */
     		    $("button").click(function(){
     		    	fnDelArticle(this.id);
     		    });
    		},
    		error		: function(xhr, status, error){
    			alert(error);
    		},
    		complete	: function(date){
    			
    		}
    	});
    }
    
    /* 더보기 버튼 클릭시 */
    $("#plus_contents").click(function(){
    	CNT++;
    	fnGetDiaryList();
    });
    
    function fnDelArticle(val){ //삭제
    	
    	if(val != null){ //값있어야 실행
    		
    		var param = {DIARY_NO : val};
        	$.ajax({
        		data	: "POST",
        		dataType : "JSON",
        		url		: "/sujin/main/delArticle.do",
        		data	: param,
        		success : function(data){
        			//alert("삭제완료");
        			var diaryNo = data.DIARY_NO;
        			$("#"+diaryNo).parent().html("")  ;
        			
        		},
        		error	: function(data){
        			alert("삭제실패. 재도전해주삼");
        		}
        		
        		
        	});
    		
    	}
    	
    }
    
    
})

</script>
</body>
</html>