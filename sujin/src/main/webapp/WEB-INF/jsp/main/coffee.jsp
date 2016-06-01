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
              <li class="active"><a href="/sujin/main/coffee.do">커피</a></li>
              <li><a href="/sujin/main/diary.do">일기</a></li>
              <li><a href="/sujin/main/counsel.do">상담</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/sujin/main/logout.do">logout</a></li>
            </ul>

          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->

      </nav>



      <!-- Main component for a primary marketing message or call to action -->
	  <div class="jumbotron">
		<h2>커피</h2>
		<div class="round_wrapper" style="text-align:left;" id="inputRoundWrapper">
			<div class="form-inline" >
				<input type="hidden" name="CF_CD" id="input-cf-cd">
		 		<div class="form-group form-marginR form-marginT">
		 			<label for="input-cf-nm" class="sr-only">커피명</label>
		 			<input type="text" class="form-control" id="input-cf-nm" name="CF_NM" placeholder="커피명" value="아이스아메리카노">
		 		</div>
		 		<div class="form-group form-marginR form-marginT" >
		 			<label for="input-location" class="sr-only">가게명</label>
		 			<input type="text" class="form-control" id="input-location" name="LOCATION" placeholder="가게명">
		 		</div>
		 		 <div class="form-group form-marginR form-marginT">
			    	<label for="DRK_DT">먹은시간</label>
				    <div class='input-group date' id='input-drk-time'>
		                <input type='text' class="form-control" name="DRK_DT" readonly/>
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-time"></span>
		                </span>
		            </div>
				  </div>
		 		<div class="form-group form-marginR form-marginT">
		 			<label for="input-taste">맛</label>
		 			<select class="form-control" id="input-taste" name="TASTE">
		 				<option value="5">매우좋음	</option>
		 				<option value="4">좋음		</option>
		 				<option value="3">보통		</option>
		 				<option value="2">나쁨		</option>
		 				<option value="1">매우나쁨	</option>
		 			</select>
		 		</div>
			</div><!-- 첫줄 -->
			<div class="form-inline" >
				<div class="form-group form-marginT form-marginR">
					<label for="input-rmk" class="sr-only"></label>
					<textarea rows="5" cols="140" name="RMK" id="input-rmk" class="form-control " placeholder="비고"></textarea>
					<br/>
					
					<button class="btn btn-primary btn-block form-marginT" name="input-save-btn" id="input-save-btn">저장하기</button>
					
				</div>
			</div>
			
		
		</div><!-- round wrapper -->
	  </div><!-- jumbo tron -->
	  
	  
	  <div class="jumbotron"><!-- list 부분 -->
	  
	  	<div id="drawCoffeeList">
	  		<!-- 커피 리스트 그려주는 부분 -->
	  		
	  		<!-- <div class="round_wrapper" style="text-align:left;" id="inputRoundWrapper">
			<div class="form-inline" >
				<input type="hidden" name="CF_CD" id="input-cf-cd">
		 		<div class="form-group form-marginR form-marginT">
		 			<label for="input-cf-nm" class="sr-only">커피명</label>
		 			<input type="text" class="form-control" id="input-cf-nm" name="CF_NM" placeholder="커피명" value="아이스아메리카노" disabled>
		 		</div>
		 		<div class="form-group form-marginR form-marginT" >
		 			<label for="input-location" class="sr-only">가게명</label>
		 			<input type="text" class="form-control" id="input-location" name="LOCATION" placeholder="가게명" disabled>
		 		</div>
		 		 <div class="form-group form-marginR form-marginT">
			    	<label for="DRK_DT">먹은시간</label>
				    <div class='input-group date' id='input-drk-time'>
		                <input type='text' class="form-control" name="DRK_DT"  disabled/>
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-time"></span>
		                </span>
		            </div>
				  </div>
		 		<div class="form-group form-marginR form-marginT">
		 			<label for="input-taste">맛</label>
		 			<select class="form-control" id="input-taste" name="TASTE" disabled>
		 				<option value="5">매우좋음	</option>
		 				<option value="4">좋음		</option>
		 				<option value="3">보통		</option>
		 				<option value="2">나쁨		</option>
		 				<option value="1">매우나쁨	</option>
		 			</select>
		 		</div>
			</div>첫줄
			<div class="form-inline" >
				<div class="form-group form-marginT form-marginR">
					<label for="input-rmk" class="sr-only"></label>
					<textarea rows="5" cols="140" name="RMK" id="input-rmk" class="form-control " placeholder="비고" disabled></textarea>
				</div>
			</div>
			<div class="form-inline text-center form-marginT" >                                                                      
			    <label for="btn" class="control-label sr-only">수정하기</label>                            
			    <button type="button" class="btn btn-primary btn-sm edit-list-btn" name="edit-list-btn" >수정하기</button>   	
			
			    <label for="btn" class="control-label sr-only">입력완료</label>                            
			    <button type="button" class="btn btn-success btn-sm submit-list-btn hidden" name="submit-list-btn" >입력완료</button>  
			
			    <label for="btn" class="control-label sr-only">삭제하기</label>                            
			    <button type="button" class="btn btn-danger btn-sm del-list-btn" >삭제하기</button> 	
			</div>                                                                                             
			
		
		</div>round wrapper
	  		 -->
	  		
	  	</div><!-- draw coffee list -->
	  	
	  	<div class="form-group form-marginT">
	  		<button class="form-control btn btn-primary" id="add-coffee-list" name="add-coffee-list">더보기</button>
	  	</div>
	  	
	  </div><!-- jumbo tron -->
	
	<div id="test-div">
	
	</div>                                                                          
    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	var page     = 1;
	var page_cnt = 5;
	$(document).ready(function(){
		
		$("#input-save-btn").click(function(){ //신규 저장 버튼 클릭 시 
			inputCFSave();
		});
		
		
		$('#input-drk-time').datetimepicker({ //부트 스트랩 데이트 피커 사용
			language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
			pickTime : true, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
			defalutDate : new Date(), // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
			format   : 'yyyy-mm-dd hh:ii:ss',
			todayBtn : true
		});
		
		getCoffeeList();
		
		
	});
	
	
	function inputCFSave(){
		
		var param = {
			CF_NM 	 :  $("#inputRoundWrapper").find("input[name=CF_NM]"   ).val(),
			LOCATION :  $("#inputRoundWrapper").find("input[name=LOCATION]").val(),
			DRK_DT 	 :  $("#inputRoundWrapper").find("input[name=DRK_DT]"  ).val(),
			TASTE	 :  $("#inputRoundWrapper").find("select[name=TASTE]"  ).val(),
			RMK		 :  $("#inputRoundWrapper").find("textarea[name=RMK]").val()
		};
		
		$.ajax({
			type : "POST",
			url : "/sujin/main/inputCFSave.do",
			data : param,
			success : function(data){
				alert("저장 성공");
				location.reload();
			},
			error : function(xhr, status, error){
				alert("input save status : "+error);
			}
			
			
		});
	}
	
	
	function getCoffeeList(){ //커피 리스트 불러와서 뿌려주겠다.
		var gData;
		var param = {start : (page-1)*page_cnt+1, 
		         	 end   : (page*page_cnt)};
		//1 = 1,5
		//2 = 6,10
		$.ajax({
			type 		: "POST",
			data 		: param,
			dataType 	: "JSON",
			url			: "/sujin/main/getCoffeeList.do",
			success 	: function(data){
				//alert("성공");
				drawCoffeeList(data);
				gData = data;
			},
			error 		: function(xhr, status, error){
				alert("getCoffeeList"+status);
			},
			complete	: function(data){
				
				$("#add-coffee-list").click(function(){
					
					addCoffeeList();
					if(gData.coffeeList.length < page_cnt){ 
						//alert("끝!");
						$("#add-coffee-list").addClass("disabled");
					}
				});
				
				
				
				
			}
		});
		
	}
	function addCoffeeList(){ //커피리스트 추가하기
		page++;
		getCoffeeList();
	}
	
	function drawCoffeeList(data) { //커피리스트 그리기 
		var html = "";
		$.each(data.coffeeList, function(idx, obj){
			
			html += "";
			html += "<div class=\"round_wrapper\" style=\"text-align:left;\" id=\""+obj.CF_CD+"\">                                                                                                 ";
			html += "	<div class=\"form-inline\" >                                                                                                                                                   ";
			html += "		<input type=\"hidden\" name=\"CF_CD\" id=\"input-cf-cd\">                                                                                                                  ";
			html += " 		<div class=\"form-group form-marginR form-marginT\">                                                                                                                       ";
			html += " 			<label for=\"input-cf-nm\" class=\"sr-only\">커피명</label>                                                                                                            ";
			html += " 			<input type=\"text\" class=\"form-control\" id=\"input-cf-nm\" name=\"CF_NM\" placeholder=\"커피명\" value=\""+obj.CF_NM+"\" disabled>                              ";                        
			html += " 		</div>                                                                                                                                                                     ";
			html += " 		<div class=\"form-group form-marginR form-marginT\" >                                                                                                                      ";
			html += " 			<label for=\"input-location\" class=\"sr-only\">가게명</label>                                                                                                         ";
			html += " 			<input type=\"text\" class=\"form-control\" id=\"input-location\" name=\"LOCATION\" placeholder=\"가게명\" value=\""+obj.LOCATION+"\" disabled>                                                   ";
			html += " 		</div>                                                                                                                                                                     ";
			html += " 		 <div class=\"form-group form-marginR form-marginT\">                                                                                                                      ";
			html += "	    	<label for=\"DRK_DT\">먹은시간</label>                                                                                                                                 ";
			html += "		    <div class='input-group date' id='input-drk-time'>                                                                                                                     ";
			html += "                <input type='text' class=\"form-control\" name=\"DRK_DT\" value=\""+obj.DRK_DT+"\" disabled/>                                                                                             ";
			html += "                <span class=\"input-group-addon\">                                                                                                                                ";
			html += "                    <span class=\"glyphicon glyphicon-time\"></span>                                                                                                              ";
			html += "                </span>                                                                                                                                                           ";
			html += "            </div>                                                                                                                                                                ";
			html += "		  </div>                                                                                                                                                                   ";
			html += " 		<div class=\"form-group form-marginR form-marginT\" id=\"input-taste-div\">                                                                                                                       ";
			html += " 			<label for=\"input-taste\">맛</label>                                                                                                                                  ";
			html += " 			<select class=\"form-control\" id=\"input-taste\" name=\"TASTE\" disabled>                                                                                             ";
			html += " 				<option value=\"5\">매우좋음	</option>                                                                                                                          ";
			html += " 				<option value=\"4\">좋음		</option>                                                                                                                          ";
			html += " 				<option value=\"3\">보통		</option>                                                                                                                          ";
			html += " 				<option value=\"2\">나쁨		</option>                                                                                                                          ";
			html += " 				<option value=\"1\">매우나쁨	</option>                                                                                                                          ";
			html += " 			</select>                                                                                                                                                              ";
			html += " 		</div>                                                                                                                                                                     ";
			html += "	</div>                                                                                                                                                                         ";
			html += "	<div class=\"form-inline\" >                                                                                                                                                   ";
			html += "		<div class=\"form-group form-marginT form-marginR\">                                                                                                                       ";
			html += "			<label for=\"input-rmk\" class=\"sr-only\"></label>                                                                                                                    ";
			html += "			<textarea rows=\"5\" cols=\"140\" name=\"RMK\" id=\"input-rmk\" class=\"form-control \" placeholder=\"비고\" disabled>"+obj.RMK+"</textarea>                                      ";
			html += "		</div>                                                                                                                                                                     ";
			html += "	</div>                                                                                                                                                                         ";
			html += "	<div class=\"form-inline text-center form-marginT\" >                                                                                                                          ";
			html += "	    <label for=\"btn\" class=\"control-label sr-only\">수정하기</label>                                                                                                        ";
			html += "	    <button type=\"button\" class=\"btn btn-primary btn-sm edit-list-btn\" name=\"edit-list-btn\" >수정하기</button>   	                                                       ";
			html += "	                                                                                                                                                                               ";
			html += "	    <label for=\"btn\" class=\"control-label sr-only\">입력완료</label>                                                                                                        ";
			html += "	    <button type=\"button\" class=\"btn btn-success btn-sm submit-list-btn hidden\" name=\"submit-list-btn\" >입력완료</button>                                                ";
			html += "	                                                                                                                                                                               ";
			html += "	    <label for=\"btn\" class=\"control-label sr-only\">삭제하기</label>                                                                                                        ";
			html += "	    <button type=\"button\" class=\"btn btn-danger btn-sm del-list-btn\" name=\"del-list-btn\">삭제하기</button> 	                                                                               ";
			html += "	</div>                                                                                                                                                                         ";
			html += "</div>                                                                                                                                                                            ";
		  		                                                                                                                                                                                       
		});
		$("#drawCoffeeList").append(html);
		
		$.each(data.coffeeList, function(idx, obj){
			$("#"+obj.CF_CD).find("select[name=TASTE]").val(obj.TASTE);
		});
		
		
		$("button[name=edit-list-btn]").click(function(){  //리스트 내 수정하기 버튼
			var id = $(this).parent().parent().attr("id");
			editList(id);
		});
		
		$("button[name=submit-list-btn]").click(function(){ //리스트 내 입력완료 버튼
			var id = $(this).parent().parent().attr("id");
			submitList(id);
		});
		
		$("button[name=del-list-btn]").click(function(){ //리스트 내 삭제 버튼
			var id = $(this).parent().parent().attr("id");
			delList(id);
		});
	}
	
	function editList(id){ //수정
		
		$("#"+id).find("button[name=edit-list-btn]").hide();
		$("#"+id).find("button[name=submit-list-btn]").removeClass("hidden");
		$("#"+id).find("input[name=CF_NM]"   ).removeAttr ("disabled");
		$("#"+id).find("input[name=DRK_DT]"  ).removeAttr ("disabled");
		$("#"+id).find("input[name=DRK_DT]"  ).attr       ("readonly", "readonly");
		$("#"+id).find("input[name=LOCATION]").removeAttr ("disabled");
		$("#"+id).find("select[name=TASTE]"  ).removeAttr ("disabled");
		$("#"+id).find("textarea[name=RMK]"  ).removeAttr ("disabled");
		
		$('#'+id).find("input[name=DRK_DT]").parent().datetimepicker({ //부트 스트랩 데이트 피커 사용
			language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
			pickTime : true, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
			defalutDate : new Date(), // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
			format   : 'yyyy-mm-dd hh:ii:ss',
			todayBtn : true
		});
		
	}
	
	function submitList(id){ //수정완료
	
		var param = {CF_CD 		: id,
					 CF_NM 		: $("#"+id).find("input[name=CF_NM]"   ).val(),
					 DRK_DT		: $("#"+id).find("input[name=DRK_DT]"  ).val(),
					 LOCATION 	: $("#"+id).find("input[name=LOCATION]").val(),
					 TASTE 		: $("#"+id).find("select[name=TASTE]"  ).val(),
					 RMK 		: $("#"+id).find("textarea[name=RMK]"  ).val() 
		};
		$.ajax({
			type	: "POST",
			url		: "/sujin/main/updateCoffeeList.do",
			data	: param,
			success	: function(data){
				alert("수정완료");
				location.reload();
			},
			error	: function(xhr, status, error){
				alert(status);
			}
		});
	}
	
	function delList(id){ //삭제
		$.ajax({
			type	: "POST",
			data	: {CF_CD : id},
			url		: "/sujin/main/delCoffeeList.do",
			success : function(data){
				alert("success");
			},
			error	: function(xhr, status, error){
				alert("error");
			}
		});
	}
	
</script>
</body>
</html>