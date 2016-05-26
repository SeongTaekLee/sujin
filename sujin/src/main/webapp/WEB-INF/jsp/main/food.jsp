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
            </button>
            <a class="navbar-brand" href="/sujin/main/login.do">메인</a>
          </div>

          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="/sujin/main/bodyCheck.do">몸</a></li>
              <li class="active"><a href="/sujin/main/food.do">음식</a></li>
              <li><a href="/sujin/main/coffee.do">커피</a></li>
              <li><a href="/sujin/main/diary.do">일기</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/sujin/main/logout.do">logout</a></li>
            </ul>

          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->

      </nav>



      <!-- Main component for a primary marketing message or call to action -->
	  <div class="jumbotron">
		<h2>음식(미완)</h2>
		<div class="round_wrapper" style="text-align:center;">
		
		<div class="form-inline " >
		  <div class="form-group form-marginR">
		    <label for="FOOD_LV">끼니</label>
		    <select class="form-control" id="FOOD_LV" name="FOOD_LV">
		    	<option value="1">아침</option>
		    	<option value="2">점심</option>
		    	<option value="3">저녁</option>
		    </select>
		  </div>
		  
		  <div class="form-group form-marginR">
		    <label for="CONFIRM_CD" class="sr-only">먹음?</label>
		    <select class="form-control" id="CONFIRM_CD" name="CONFIRM_CD">
		    	<option value="0">먹음</option>
		    	<option value="1">먹고싶음</option>
		    </select>
		  </div>
		  
		  <div class="form-group form-marginR">
	    	<label for="EAT_TIME">먹은시간</label>
		    <div class='input-group date' id='EAT_TIME'>
                <input type='text' class="form-control col-xs-4" name="EAT_TIME" readonly/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-time"></span>
                </span>
            </div>
		  </div>
		  
		  <div class="form-group form-marginR ">
		    <label for="FOOD_LV">맛</label>
		    <select class="form-control" id="TASTE" name="TASTE">
		    	<option value="5">매우좋음</option>
		    	<option value="4">좋음</option>
		    	<option value="3">보통</option>
		    	<option value="2">나쁨</option>
		    	<option value="1">매우나쁨</option>
		    </select>
		  </div>
		  
		</div><!-- form-inline -->
		
		<div class="form-horizontal" ><!-- 두번째 줄 -->
		  <div class="form-group form-marginT">
		    <label for="LOCATION" class="col-sm-2 control-label">음식점 이름</label>
		    <div class="col-sm-10" style="padding-top:0px;">
		    <input type="text" class="form-control" id="LOCATION" name="LOCATION"/>
		    </div>
		  </div>
		  
		  
		  <div class="form-group form-marginT">
		    <label for="RMK" class="col-sm-2 control-label">설명 </label>
		    <div class="col-sm-10" style="padding-top:0px;">
		    	<textarea rows="5" class="form-control" name="RMK"></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="MENU1" class="col-sm-2 control-label">MENU1 </label>
		    <div class="col-sm-10" style="padding-top:0px;">
		    	<input type="text" class="form-control" id="MENU1" name="MENU1"/>
		    </div>
		  </div>
		  
		  <div id="add-menu">
		  	<!-- 메뉴추가부분 -->
		  </div>
		  
		</div><!-- form-horizontal -->
		<div class="form-inline " >
		    <label for="btn" class="control-label sr-only">추가하기</label>
		    <button type="button" class="btn btn-default btn-sm " id="add-menu-btn">추가하기</button>
		  
		    <label for="btn" class="control-label sr-only">저장하기</label>
		    <button type="button" class="btn btn-primary btn-sm " id="save-menu-btn">저장하기</button>
		</div><!--  class="form-inline" -->
		
		<!-- 	FOOD_CD		음식 키
				EAT_TIME	먹은시간
				FOOD_LV		끼니명
				CONFIRM_CD	먹음 / 먹고싶음
				LOCATION	음식점이름
				TASTE		맛
				LAT			위도
				LNG			경도
				MENU1		메뉴명
				MENU2		메뉴명
				REG_DT		등록일자
				RMK			비고
		 -->
		</div>
	  </div>
	  
	  
    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	var addMenu     = 1;
	
	$(document).ready(function(){
		
		$('#EAT_TIME').datetimepicker({
			language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
			pickTime : true, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
			defalutDate : new Date(), // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
			format   : 'yyyy-mm-dd hh:ii:ss',
			todayBtn : true
		});
		
		
		$("#add-menu-btn").click(function(){ 
			addMenu++;
			var html = "";
			var menu = "MENU"+addMenu;
			
			if(addMenu == 9){ // menu9 까지있음
				$("#add-menu-btn").addClass("disabled");
			}
			html += "<div class=\"form-group\">														";
			html += "    <label for="+menu+" class=\"col-sm-2 control-label\">"+menu+"</label>		";
			html += "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">						";
			html += "    	<input type=\"text\" class=\"form-control\" id=\""+menu+"\" name=\""+menu+"\"/> ";
			html += "    </div>																		";
			html += "</div>																			";
			
			
			
			$("#add-menu").append(html);
			
		});
		
		$("#save-menu-btn").click(function(){
			
			/* 유효성 검사 */
			var EAT_TIME = $("input[name=EAT_TIME]").val();
			if(EAT_TIME == "" || EAT_TIME == null){
				alert("먹은 시간은 필수입력사항입니다.");
				return;
			}
			
			var param = { EAT_TIME		: $("input[name=EAT_TIME]"    ).val(),
						  FOOD_LV		: $("select[name=FOOD_LV]"    ).val(),
						  CONFIRM_CD	: $("select[name=CONFIRM_CD]" ).val(),
						  LOCATION		: $("input[name=LOCATION]"    ).val(),
						  TASTE			: $("select[name=TASTE]"	  ).val(),
						  //LAT			: $("").val(),
						  //LNG			: $("").val(),
						  MENU1			: $("input[name=MENU1]"		  ).val(),
						  MENU2			: $("input[name=MENU2]"		  ).val(),
						  MENU3			: $("input[name=MENU3]"		  ).val(),
						  MENU4			: $("input[name=MENU4]"		  ).val(),
						  MENU5			: $("input[name=MENU5]"		  ).val(),
						  MENU6			: $("input[name=MENU6]"		  ).val(),
						  MENU7			: $("input[name=MENU7]"		  ).val(),
						  MENU8			: $("input[name=MENU8]"		  ).val(),
						  MENU9			: $("input[name=MENU9]"		  ).val(),
						  RMK			: $("textarea[name=RMK]"	  ).val(),
			};
			//alert(JSON.stringify(param));
			
			$.ajax({
				type		: "POST",
				dateType	: "JSON",
				url			: "/sujin/main/insertFood.do",
				data		: param,
				success		: function(data){
					alert("저장되었습니다.");
				},
				error		: function(xhr, status, error){
					alert(status);
				}
			});
			
		});
		
	});
</script>
</body>
</html>