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
		<h2>음식</h2>
		<div class="round_wrapper" style="text-align:center;" id="inputRoundWrapper">
		
		<div class="form-inline " >
		  <div class="form-group form-marginR">
		    <label for="FOOD_LV">끼니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		    <select class="form-control" id="FOOD_LV" name="FOOD_LV" value="2">
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
	  
	  <!-- food List -->
	  <!-- Main component for a primary marketing message or call to action -->
	  <div class="jumbotron" >
	  <div id="drawFoodList"><!-- 리스트 뿌려주는 div --></div>
	  <div class="form-group form-marginT">
	  	<label for="addList" class="sr-only">더보기</label>
	  	<button id="add-list-btn" class="btn btn-primary btn-block">더보기</button>
	  </div>
<%--
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
		</div><!-- round wrapper -->
 --%>		
	  </div>
	  
	  
    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	var addMenu     = 1;  //입력창 메뉴 추가
	//var code        = {}; // 코드 : BODY_CHECK_LEVEL(매우좋음), FOOD_LV(아침), FOOD_CONFIRM(먹음)
	var page		= 1;  //현재 페이지
	var page_cnt	= 5;  //한페이지 들어가는 글 수
	$(document).ready(function(){
		//getCodeList();
		
		getFoodList();
		
		$('#EAT_TIME').datetimepicker({ //부트 스트랩 데이트 피커 사용
			language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
			pickTime : true, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
			defalutDate : new Date(), // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
			format   : 'yyyy-mm-dd hh:ii:ss',
			todayBtn : true
		});
		
		
		
		
		$("#add-menu-btn").click(function(){ //메뉴 추가 버튼 누를때마다 메뉴2, 메뉴3 추가됨
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
		
		$("#save-menu-btn").click(function(){ //입력 메소드, INSERT 전용
			
			/* 유효성 검사 */
			var EAT_TIME = $("#inputRoundWrapper").find("input[name=EAT_TIME]").val();
			if(EAT_TIME == "" || EAT_TIME == null){
				alert("먹은 시간은 필수입력사항입니다.");
				return;
			}
			
			var param = { EAT_TIME		: $("#inputRoundWrapper").find("input[name=EAT_TIME]"    ).val(),
						  FOOD_LV		: $("#inputRoundWrapper").find("select[name=FOOD_LV]"    ).val(),
						  CONFIRM_CD	: $("#inputRoundWrapper").find("select[name=CONFIRM_CD]" ).val(),
						  LOCATION		: $("#inputRoundWrapper").find("input[name=LOCATION]"    ).val(),
						  TASTE			: $("#inputRoundWrapper").find("select[name=TASTE]"	     ).val(),
						  MENU1			: $("#inputRoundWrapper").find("input[name=MENU1]"		 ).val(),
						  MENU2			: $("#inputRoundWrapper").find("input[name=MENU2]"		 ).val(),
						  MENU3			: $("#inputRoundWrapper").find("input[name=MENU3]"		 ).val(),
						  MENU4			: $("#inputRoundWrapper").find("input[name=MENU4]"		 ).val(),
						  MENU5			: $("#inputRoundWrapper").find("input[name=MENU5]"		 ).val(),
						  MENU6			: $("#inputRoundWrapper").find("input[name=MENU6]"		 ).val(),
						  MENU7			: $("#inputRoundWrapper").find("input[name=MENU7]"		 ).val(),
						  MENU8			: $("#inputRoundWrapper").find("input[name=MENU8]"		 ).val(),
						  MENU9			: $("#inputRoundWrapper").find("input[name=MENU9]"		 ).val(),
						  RMK			: $("#inputRoundWrapper").find("textarea[name=RMK]"	  	 ).val()
			};
			//alert(JSON.stringify(param));
			
			$.ajax({
				type		: "POST",
				dateType	: "JSON",
				url			: "/sujin/main/insertFood.do",
				data		: param,
				success		: function(data){
					alert("저장되었습니다.");
					location.reload();
				},
				error		: function(xhr, status, error){
					alert(status);
				}
			});

		}); /* $("#save-menu-btn").click(function */
		
		
		
		$("#add-list-btn").click(function(){ //리스트 더보기 버튼
			page++;  //현재 페이지
			getFoodList();
		});
		
		/* $(":button[name=edit-list-btn]").click(function(){ // 리스트 수정하기 버튼 
			alert("add");
			
		}); */
		
		/* $(".del-list-btn").click(function(){ // 리스트 삭제하기 버튼
			alert("del");
			var id = $(this).parent().parent().attr("id");
			alert("id : "+id);
		}); */
		
		
		
	});
	/* 
	function getCodeList(){ //코드값 가져옴 -------------필요없...나?
		
		$.ajax({
			type		: "POST",
			dateType	: "JSON",
			url			: "/sujin/main/getFoodCodeList.do",
			success		: function(data){
				//alert("코드 겟! == "+JSON.stringify(data));
				code = data;
			},
			error		: function(xhr, status, error){
				alert("겟코드 실패!");
			}
		});
	} */
	
	function getFoodList(){ //음식 리스트 가져옴
		var param = {START : (page-1)*page_cnt+1, 
			         END   : (page*page_cnt)};
	
		$.ajax({
			type	    : "POST",
			dateType	: "JSON",
			url			: "/sujin/main/getFoodList.do" ,
			data		: param,
			success		: function(data){
				//alert("success! data ::: "+JSON.stringify(data.foodList[0].EAT_TIME));
				
				drawFoodList(data);
				
			},
			error		: function(xhr, status, error){
				alert(status);
			},
			complete	: function(data){
				
				$(".edit-list-btn").click(function(){ //수정하기 버튼 클릭
					var list_id = $(this).parent().parent().attr("id");
					editList(list_id);
				});
				$(".del-list-btn").click(function(){ //삭제하기 버튼 클릭
					var list_id = $(this).parent().parent().attr("id");
					delList(list_id);
				});
				
				$(".submit-list-btn").click(function(){ //입력 완료 버튼 클릭
					var list_id = $(this).parent().parent().attr("id");
					submitList(list_id);
				});
				
			}
			
		});
	}
	
	function drawFoodList(data){ //음식리스트 그리기
		var html = "";
		$.each(data.foodList, function(idx, obj){
			
			html+= "<div class=\"round_wrapper\" style=\"text-align:center;\" id=\""+obj.FOOD_CD+"\">                   ";
			html+= "<input type=\"hidden\" name=\"FOOD_CD\" value=\"\">													";
			html+= "                                                                                                    ";
			html+= "<div class=\"form-inline \" >                                                                       ";
			html+= "  <div class=\"form-group form-marginR\">                                                           ";
			html+= "    <label for=\"FOOD_LV\">끼니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>				";
			html+= "    <select class=\"form-control\" id=\"FOOD_LV\" name=\"FOOD_LV\" disabled>                        ";
			
			var food_lv = ""; 
			if(obj.FOOD_LV == '1'){ 
				food_lv += "<option value=\"1\" selected>아침</option>";
				food_lv += "<option value=\"2\">점심</option>";
				food_lv += "<option value=\"3\">저녁</option>";
			}else if (obj.FOOD_LV == '2'){ 
				food_lv += "<option value=\"1\">아침</option>";
				food_lv += "<option value=\"2\" selected>점심</option>";
				food_lv += "<option value=\"3\">저녁</option>";
			}else if (obj.FOOD_LV == '3'){
				food_lv += "<option value=\"1\">아침</option>";
				food_lv += "<option value=\"2\">점심</option>";
				food_lv += "<option value=\"3\" selected>저녁</option>";
			}
			html+= food_lv;
			html+= "    </select>                                                                                       ";
			html+= "  </div>                                                                                            ";
			html+= "                                                                                                    ";
			html+= "  <div class=\"form-group form-marginR\">                                                           ";
			html+= "    <label for=\"CONFIRM_CD\" class=\"sr-only\">먹음?</label>                                       ";
			html+= "    <select class=\"form-control\" id=\"CONFIRM_CD\" name=\"CONFIRM_CD\" disabled>                  ";
			
			var confirm_cd = "";
			if(obj.CONFIRM_CD == '0'){
				confirm_cd += "<option value=\"0\" selected>먹음</option>";
				confirm_cd += "<option value=\"1\">먹고싶음</option>";
			}else if(obj.CONFIRM_CD == '1'){
				confirm_cd += "<option value=\"0\">먹음</option>";
				confirm_cd += "<option value=\"1\" selected>먹고싶음</option>";
			}
			html+= confirm_cd;
			html+= "    </select>                                                                                       ";
			html+= "  </div>                                                                                            ";
			html+= "                                                                                                    ";
			html+= "  <div class=\"form-group form-marginR\">                                                           ";
		    html+= "	<label for=\"EAT_TIME\">먹은시간</label>                                                        ";
			html+= "    <div class='input-group date' id='EAT_TIME'>                                                    ";
	        html+= "        <input type='text' class=\"form-control col-xs-4\" name=\"EAT_TIME\" value=\""+obj.EAT_TIME+"\" disabled/>";
	        html+= "        <span class=\"input-group-addon\">                                                          ";
	        html+= "            <span class=\"glyphicon glyphicon-time\"></span>                                        ";
	        html+= "        </span>                                                                                     ";
	        html+= "    </div>                                                                                          ";
			html+= "  </div>                                                                                            ";
			html+= "                                                                                                    ";
			html+= "  <div class=\"form-group form-marginR \">                                                          ";
			html+= "    <label for=\"FOOD_LV\">맛</label>                                                               ";
			html+= "    <select class=\"form-control\" id=\"TASTE\" name=\"TASTE\" disabled>                            ";
			
			var taste = "";
			if(obj.TASTE == '1'){
				taste += "<option value=\"5\">매우좋음</option> ";
				taste += "<option value=\"4\">좋음</option>     ";
				taste += "<option value=\"3\">보통</option>     ";
				taste += "<option value=\"2\">나쁨</option>     ";
				taste += "<option value=\"1\" selected>매우나쁨</option> ";
			}else if(obj.TASTE == '2'){
				taste += "<option value=\"5\">매우좋음</option> ";
				taste += "<option value=\"4\">좋음</option>     ";
				taste += "<option value=\"3\">보통</option>     ";
				taste += "<option value=\"2\" selected>나쁨</option>     ";
				taste += "<option value=\"1\">매우나쁨</option> ";
			}else if(obj.TASTE == '3'){
				taste += "<option value=\"5\">매우좋음</option> ";
				taste += "<option value=\"4\">좋음</option>     ";
				taste += "<option value=\"3\" selected>보통</option>     ";
				taste += "<option value=\"2\">나쁨</option>     ";
				taste += "<option value=\"1\">매우나쁨</option> ";
			}else if(obj.TASTE == '4'){
				taste += "<option value=\"5\">매우좋음</option> ";
				taste += "<option value=\"4\" selected>좋음</option>     ";
				taste += "<option value=\"3\">보통</option>     ";
				taste += "<option value=\"2\">나쁨</option>     ";
				taste += "<option value=\"1\">매우나쁨</option> ";
			}else if(obj.TASTE == '5'){
				taste += "<option value=\"5\" selected>매우좋음</option> ";
				taste += "<option value=\"4\">좋음</option>     ";
				taste += "<option value=\"3\">보통</option>     ";
				taste += "<option value=\"2\">나쁨</option>     ";
				taste += "<option value=\"1\">매우나쁨</option> ";
			}
			html+= taste;
			html+= "    </select>                                                                                       ";
			html+= "  </div>                                                                                            ";
			html+= "                                                                                                    ";
			html+= "</div><!-- form-inline -->                                                                          ";
			html+= "                                                                                                    ";
			html+= "<div class=\"form-horizontal\" ><!-- 두번째 줄 -->                                                  ";
			html+= "  <div class=\"form-group form-marginT\">                                                           ";
			html+= "    <label for=\"LOCATION\" class=\"col-sm-2 control-label\">음식점 이름</label>                    ";
			html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
			html+= "    <input type=\"text\" class=\"form-control\" id=\"LOCATION\" name=\"LOCATION\" value=\""+obj.LOCATION+"\" disabled/>";
			html+= "    </div>                                                                                          ";
			html+= "  </div>                                                                                            ";
			html+= "                                                                                                    ";
			html+= "                                                                                                    ";
			html+= "  <div class=\"form-group form-marginT\">                                                           ";
			html+= "    <label for=\"RMK\" class=\"col-sm-2 control-label\">설명 </label>                               ";
			html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
			html+= "    	<textarea rows=\"5\" class=\"form-control\" name=\"RMK\" disabled>"+obj.RMK+"</textarea>    ";
			html+= "    </div>                                                                                          ";
			html+= "  </div>                                                                                            ";
			html+= "                                                                                                    ";
			html+= "  <div class=\"form-group\">                                                                        ";
			html+= "    <label for=\"MENU1\" class=\"col-sm-2 control-label\">MENU1 </label>                            ";
			html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
			html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU1\" name=\"MENU1\" value=\""+obj.MENU1+"\" disabled/>";
			html+= "    </div>                                                                                          ";
			html+= "  </div>                                                                                            ";
			
			if(obj.MENU2 != null && obj.MENU2 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU1\" class=\"col-sm-2 control-label\">MENU2 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU2\" name=\"MENU2\" value=\""+obj.MENU2+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}
			if(obj.MENU3 != null && obj.MENU3 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU3\" class=\"col-sm-2 control-label\">MENU3 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU3\" name=\"MENU3\" value=\""+obj.MENU3+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}
			if(obj.MENU4 != null && obj.MENU4 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU4\" class=\"col-sm-2 control-label\">MENU4 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU4\" name=\"MENU4\" value=\""+obj.MENU4+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}			
			if(obj.MENU5 != null && obj.MENU5 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU5\" class=\"col-sm-2 control-label\">MENU5 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU5\" name=\"MENU5\" value=\""+obj.MENU5+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}
			if(obj.MENU6 != null && obj.MENU6 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU6\" class=\"col-sm-2 control-label\">MENU6 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU6\" name=\"MENU6\" value=\""+obj.MENU6+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}
			if(obj.MENU7 != null && obj.MENU7 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU7\" class=\"col-sm-2 control-label\">MENU7 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU7\" name=\"MENU7\" value=\""+obj.MENU7+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}
			if(obj.MENU8 != null && obj.MENU8 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU8\" class=\"col-sm-2 control-label\">MENU8 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU8\" name=\"MENU8\" value=\""+obj.MENU8+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}
			if(obj.MENU9 != null && obj.MENU9 != ""){
				html+= "  <div class=\"form-group\">                                                                        ";
				html+= "    <label for=\"MENU9\" class=\"col-sm-2 control-label\">MENU9 </label>                            ";
				html+= "    <div class=\"col-sm-10\" style=\"padding-top:0px;\">                                            ";
				html+= "    	<input type=\"text\" class=\"form-control\" id=\"MENU9\" name=\"MENU9\" value=\""+obj.MENU9+"\" disabled/>";
				html+= "    </div>                                                                                          ";
				html+= "  </div>                                                                                            ";
			}
			
			html+= "                                                                                                    ";
			html+= "</div><!-- form-horizontal -->                                                                      ";
			
			html+= "<div class=\"form-inline \" >                                                                       ";
			html+= "    <label for=\"btn\" class=\"control-label sr-only\">수정하기</label>                             ";
			html+= "    <button type=\"button\" class=\"btn btn-primary btn-sm edit-list-btn\" name=\"edit-list-btn\" >수정하기</button>   		";
			
			html+= "    <label for=\"btn\" class=\"control-label sr-only\">입력완료</label>                             ";
			html+= "    <button type=\"button\" class=\"btn btn-success btn-sm submit-list-btn hidden\" name=\"submit-list-btn\" >입력완료</button>   ";
			
			html+= "    <label for=\"btn\" class=\"control-label sr-only\">삭제하기</label>                             ";
			html+= "    <button type=\"button\" class=\"btn btn-danger btn-sm del-list-btn\" >삭제하기</button> 		";
			html+= "</div>                                                                                              ";
			
			html+= "</div>                                                                                              ";
			
		});
		
		$("#drawFoodList").append(html);
		
		//아니면 모두 로드한 후 for문 하나 더 돌려서 세팅
		if(data.foodList.length == 0 || data.foodList.length < page){
			alert("끝!");
			$("#add-list-btn").addClass("disabled");
		}
		
		//alert($("[name=TASTE]").parent().find("[name=TASTE]").html());
		
		
	}
		
	function editList(FOOD_CD){ //리스트 수정
		$("#"+FOOD_CD).find("button[name=edit-list-btn]"    ).addClass   ("hidden");
		$("#"+FOOD_CD).find("button[name=submit-list-btn]"  ).removeClass("hidden");
		$("#"+FOOD_CD).find("button[name=add-list-menu-btn]").removeClass("hidden");
		
		
		$("#"+FOOD_CD).find("select[name=FOOD_LV]"        ).removeAttr("disabled");
		$("#"+FOOD_CD).find("select[name=CONFIRM_CD]"     ).removeAttr("disabled");
		$("#"+FOOD_CD).find("input[name=EAT_TIME]"		  ).removeAttr("disabled");
		$("#"+FOOD_CD).find("input[name=EAT_TIME]"		  ).attr("readonly", "readonly");
		$("#"+FOOD_CD).find("select[name=TASTE]"		  ).removeAttr("disabled");
		$("#"+FOOD_CD).find("input[name=LOCATION]"		  ).removeAttr("disabled");
		$("#"+FOOD_CD).find("textarea[name=RMK]"		  ).removeAttr("disabled");
		for(var i=1; i<=9; i++){
			$("#"+FOOD_CD).find("input[name=MENU"+i+"]"	  ).removeAttr("disabled");
		}
		
		
		
		$("#"+FOOD_CD).find('#EAT_TIME').datetimepicker({ //부트 스트랩 데이트 피커 사용
			language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
			pickTime : true, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
			defalutDate : new Date(), // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
			format   : 'yyyy-mm-dd hh:ii:ss',
			todayBtn : true
		});
		
	}
	
	function delList(FOOD_CD){ // 리스트 삭제
	
		$.ajax({
			type : "POST",
			url	: "/sujin/main/delFoodList.do",
			data : {FOOD_CD : FOOD_CD},
			success : function(data){
				alert("삭제 완료되었습니다.");
				location.reload();
			},
			error	: function(xhr, status, error){
				alert("삭제 에러 : "+status);
			}
			
		});
	}
	
	function submitList(FOOD_CD){ //리스트 수정 완료
		
		var param = {FOOD_CD 	:   FOOD_CD,
					FOOD_LV  	: 	$("#"+FOOD_CD).find("select[name=FOOD_LV]"        ).val(),
					CONFIRM_CD 	:	$("#"+FOOD_CD).find("select[name=CONFIRM_CD]"     ).val(),
					EAT_TIME	:	$("#"+FOOD_CD).find("input[name=EAT_TIME]"		  ).val(),
					TASTE		:	$("#"+FOOD_CD).find("select[name=TASTE]"		  ).val(),
					LOCATION	:	$("#"+FOOD_CD).find("input[name=LOCATION]"		  ).val(),
					RMK			:	$("#"+FOOD_CD).find("textarea[name=RMK]"		  ).val(),
					MENU1		:	$("#"+FOOD_CD).find("input[name=MENU1]"		  	  ).val(),
					MENU2		:	$("#"+FOOD_CD).find("input[name=MENU2]"		  	  ).val(),
					MENU3		:	$("#"+FOOD_CD).find("input[name=MENU3]"		  	  ).val(),
					MENU4		:	$("#"+FOOD_CD).find("input[name=MENU4]"		  	  ).val(),
					MENU5		:	$("#"+FOOD_CD).find("input[name=MENU5]"		  	  ).val(),
					MENU6		:	$("#"+FOOD_CD).find("input[name=MENU6]"		  	  ).val(),
					MENU7		:	$("#"+FOOD_CD).find("input[name=MENU7]"		  	  ).val(),
					MENU8		:	$("#"+FOOD_CD).find("input[name=MENU8]"		  	  ).val(),
					MENU9		:	$("#"+FOOD_CD).find("input[name=MENU9]"		  	  ).val()
		};
		
		$.ajax({
			type		: "POST",
			data		: param,
			url			: "/sujin/main/updateFoodList.do",
			success		: function(data){
				alert("수정 되었습니다.");
				location.reload();
			} ,
			error		: function(xhr, status, error){
				alert("리스트 수정 에러 : "+status);
			}
		});
		
	}
	
</script>
</body>
</html>