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
              <li><a href="/sujin/main/diary.do">일기</a></li>
              <li><a href="/sujin/main/counsel.do">상담</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/sujin/main/logout.do">logout</a></li>
            </ul>

          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->

      </nav>

	  <div class="round_wrapper form-marginT body"> 
		<h4>몸상태 <button type="button" class="btn btn-default" name="bodySummary" style="margin-left:30px;"></button></h4>
	  </div>
	  
	  <div class="round_wrapper form-marginT food">
	  	<h4>음식 <button type="button" name="no_food" id="no_food" class="btn btn-danger hidden" style="margin-left:50px;">안먹음</button> </h4> 
	  	<div class="form-horizontal">
		  <div class="form-group">
		    <label for="food_lv" class="col-sm-1 control-label">끼니</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="food_lv" name="food_lv" readonly>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="location" class="col-sm-1 control-label">음식점</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="location" name="location" readonly>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="rmk" class="col-sm-1 control-label">설명</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" id="rmk" name="rmk" readonly></textarea>
		    </div>
		  </div>
		 </div>
		 
	  </div>
	  
	  <div class="round_wrapper form-marginT coffee">
	  	<h4>커피  <button type="button" name="no_coffee" id="no_coffee" class="btn btn-danger hidden" style="margin-left:50px;">안먹음</button> </h4>
	  	<div class="form-horizontal">
		  <div class="form-group">
		    <label for="coffee_nm" class="col-sm-1 control-label">커피명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="coffee_nm" name="coffee_nm" readonly>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="drk_dt" class="col-sm-1 control-label">시간</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="drk_dt" name="drk_dt" readonly>
		    </div>
		  </div>
		 </div>
		
	  </div>
	  
	  <div class="round_wrapper form-marginT diary">
	  	<h4>일기  <button type="button" class="btn btn-default" name="diarySummary" style="margin-left:50px;"></button></h4>
	  </div>
	  
	  <div class="round_wrapper form-marginT counsel">
	  	<h4>상담</h4>
	  	상담(오늘자) 인원수, 최신 상담인원 이름
	  	<div class="form-horizontal">
		  <div class="form-group">
		    <label for="counsel_cnt" class="col-sm-1 control-label">인원수</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="counsel_cnt" name="counsel_cnt" readonly>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="counsel_nm" class="col-sm-1 control-label">상담자</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="counsel_nm" name="counsel_nm" readonly>
		    </div>
		  </div>
		 </div>
	  </div>

      <!-- Main component for a primary marketing message or call to action -->
	  <div class="jumbotron">
		<h2>몸</h2>
		<div class="dateTypeBtnWrap">
			<input type="button" class="btn btn-default btn-xs clickChartData active" name="clickChartDataD" value="daily"   >
			<input type="button" class="btn btn-default btn-xs clickChartData" 		  name="clickChartDataW" value="weekly"  >
			<input type="button" class="btn btn-default btn-xs clickChartData" 		  name="clickChartDataM" value="monthly" >
			<input type="button" class="btn btn-default btn-xs clickChartData active" name="clickChartDataPie" value="PieChart" >
			<input type="button" class="btn btn-default btn-xs clickChartData" 		  name="clickChartDataBar" value="BarChart" >
			<input type="button" class="btn btn-default btn-xs clickChartData" 		  name="clickChartDataLine" value="LineChart" >
		</div>
		<div id="chart_div"    class="googleChart" style="border: 1px solid #cccl; visibility:visible;" ></div>
	  </div>
	  
	  <div class="jumbotron">
	  
	  </div>
	  
	  
    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	var googleFlag   = false;
	var chartDataArr = new Array();
	var dateType	 = "daily";
	var chartType	 = "pie";
	$(document).ready(function(){    
		
		bodySummary(); //몸 
		foodSummary(); 
		coffeeSummary();
		diarySummary();
		counselSummary();
		
		$(":input[name=clickChartDataD]").click(function(){
			dateType = "daily";
			$(":input[name=clickChartDataD]").removeClass("active");
			$(":input[name=clickChartDataW]").removeClass("active");
			$(":input[name=clickChartDataM]").removeClass("active");
			$(":input[name=clickChartDataD]").addClass("active");
			fnGetChartData();
			
		}); 
		$(":input[name=clickChartDataW]").click(function(){
			$(":input[name=clickChartDataD]").removeClass("active");
			$(":input[name=clickChartDataW]").removeClass("active");
			$(":input[name=clickChartDataM]").removeClass("active");
			$(":input[name=clickChartDataW]").addClass("active");
			dateType = "weekly"; 
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataM]").click(function(){
			$(":input[name=clickChartDataD]").removeClass("active");
			$(":input[name=clickChartDataW]").removeClass("active");
			$(":input[name=clickChartDataM]").removeClass("active");
			$(":input[name=clickChartDataM]").addClass("active");
			dateType = "monthly"; 
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataPie]").click(function(){
			$(":input[name=clickChartDataPie]" ).removeClass("active");
			$(":input[name=clickChartDataBar]" ).removeClass("active");
			$(":input[name=clickChartDataLine]").removeClass("active");
			$(":input[name=clickChartDataPie]" ).addClass("active");
			chartType = "pie";
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataBar]").click(function(){
			$(":input[name=clickChartDataPie]" ).removeClass("active");
			$(":input[name=clickChartDataBar]" ).removeClass("active");
			$(":input[name=clickChartDataLine]").removeClass("active");
			$(":input[name=clickChartDataBar]" ).addClass("active");
			chartType = "bar";
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataLine]").click(function(){
			$(":input[name=clickChartDataPie]" ).removeClass("active");
			$(":input[name=clickChartDataBar]" ).removeClass("active");
			$(":input[name=clickChartDataLine]").removeClass("active");
			$(":input[name=clickChartDataLine]" ).addClass("active");
			chartType = "line";
			fnGetChartData();
		}); 
		
	});/* document ready */
	
	function bodySummary(){
		$.ajax({
			type:"POST",
			dataType : "JSON",
			url : "/sujin/main/getMainBodySummary.do",
			success : function(data){
				var avg = data.result;
				
				if(avg == null){
					$("[name=bodySummary]").attr("class", "btn btn-danger");
					$("[name=bodySummary]").text("입력안됨");
				}else if(avg <= 1.5){
					$("[name=bodySummary]").attr("class", "btn btn-danger");
					$("[name=bodySummary]").text("매우나쁨");
				}else if(avg <= 2.5 && avg > 1.5){
					$("[name=bodySummary]").attr("class", "btn btn-warning");
					$("[name=bodySummary]").text("나쁨");
				}else if(avg <= 3.5 && avg > 2.5){
					$("[name=bodySummary]").attr("class", "btn btn-default");
					$("[name=bodySummary]").text("보통");
				}else if(avg <= 4.5 && avg > 3.5){
					$("[name=bodySummary]").attr("class", "btn btn-success");
					$("[name=bodySummary]").text("좋음");
				}else if(avg > 4.5){
					$("[name=bodySummary]").attr("class", "btn btn-primary");
					$("[name=bodySummary]").text("매우좋음");
				}
			},
			error : function(xhr, status, error){
				alert(status);
			}
		});
	}
	
	function foodSummary(){
		$.ajax({
			type:"POST",
			dataType : "JSON",
			url : "/sujin/main/getMainFoodSummary.do",
			success : function(data){
				
				$("[name=no_food]").addClass("hidden");
				$("[name=food_lv]") .val(data.FOOD_LV);
				$("[name=location]").val(data.LOCATION);
				$("[name=rmk]")     .text(data.RMK);
				
			},
			error  : function(xhr, status, error){
				$(".food").find(".form-horizontal").addClass("hidden");
				$("[name=no_food]").removeClass("hidden");
			}
		});
	}
	function coffeeSummary(){
		//coffee_nm   drk_dt
		$.ajax({
			type:"POST",
			dataType : "JSON",
			url : "/sujin/main/getMainCoffeeSummary.do",
			success : function(data){
				
				$("[name=no_coffee]").addClass("hidden");
				$("[name=coffee_nm]").val(data.CF_NM);
				$("[name=drk_dt]")   .val(data.DRK_DT);
				
			},
			error  : function(xhr, status, error){
				$(".coffee").find(".form-horizontal").addClass("hidden");
				$("[name=no_coffee]").removeClass("hidden");
			}
		});
	}
	function diarySummary(){
		$.ajax({
			type:"POST",
			//dataType : "JSON",
			url : "/sujin/main/getMainDiarySummary.do",
			success : function(data){
				$("[name=diarySummary]");
				if(data == 0){
					$("[name=diarySummary]").attr("class", "btn btn-danger");
					$("[name=diarySummary]").text("안씀");
				}else{
					$("[name=diarySummary]").attr("class", "btn btn-success");
					$("[name=diarySummary]").text("씀");
				}
				
			},
			error  : function(xhr, status, error){
				alert(status);
			}
		});
	}
	function counselSummary(){
		$.ajax({
			type:"POST",
			dataType : "JSON",
			url : "/sujin/main/getMainCounselSummary.do",
			success : function(data){
				alert(JSON.stringify(data));
				
			},
			error  : function(xhr, status, error){
				alert(status);
			}
		});
	}
	
	/* -------------------------------------[구글 차트]------------------------------------------- */
 	// Load Charts and the corechart and barchart packages.
    google.load("visualization", "1", {packages:["corechart"]});

    // Draw the pie chart and bar chart when Charts is loaded.
    google.setOnLoadCallback(fnGetChartData);
    
    function drawVisualization() { 
	  
      if(chartType == 'pie'){ 
		       
    	  var data = new google.visualization.DataTable();
          data.addColumn('string', '신체');
          data.addColumn('number', '점수');
          data.addRows(chartDataArr); 
          /* data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]); */
          
			var piechart_options = {title:  '아픈 부분 비율',
				 		  		    width:  $(".jumbotron").first().width(),
				                   height:  350};
			var piechart = new google.visualization.PieChart(document.getElementById('chart_div'));
			piechart.draw(data, piechart_options);
      }else if(chartType == 'bar'){ 
    	  var title = "";
    	       if(dateType == 'daily'  ) title = '오늘의 상태 바 그래프';
    	  else if(dateType == 'weekly' ) title = '주단위 상태 바 그래프';
    	  else if(dateType == 'monthly') title = '월단위 상태 바 그래프';
    	  
    	  var data = new google.visualization.DataTable();
          data.addColumn('string', '신체');
          data.addColumn('number', '점수');
          data.addRows(chartDataArr); 
          /* data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]); */
          
			var barchart_options = {title:  title,
						  		    width:  $(".jumbotron").first().width(),
				                   height:  350,
				                   legend: 'none'};
			var barchart = new google.visualization.BarChart(document.getElementById('chart_div'));
			barchart.draw(data, barchart_options);
      }else if(chartType == 'line'){
    	  
	    	var data = new google.visualization.DataTable();
	        data.addColumn('string', '날짜');
	        data.addColumn('number', '평균');
	        data.addRows(chartDataArr); 

          var linechart_options = {title: '평균치 꺾은선 그래프',
						           width:  $(".jumbotron").first().width(),
						          height: 350,

            axes: {x: { 0: {side: 'top'} }
            }
          };
    	  var linechart = new google.visualization.LineChart(document.getElementById('chart_div'));
    	  linechart.draw(data, linechart_options);
    	  	
      }
      
      

      
      
    }
	
	/* ----------------------------------[ 구글 차트 창크기 조절]--------------------------------------- */
	
	
	$(window).resize( function(){
		
		if(googleFlag){
			drawVisualization(); //window resize가 fnGetChartData보다 먼저 타는 문제로 flag 체크함. 데이터 가져온 후에 뿌립시다.
	    }
		
	} ).resize();
	
	/* ------------------------[차트 데이터 가져오기]----------------------------- */
	function fnGetChartData(){ 
		googleFlag 		= true;
		var CALC_DAYS 	= 1;
		
		//if(dateType == null){dateType="daily";}
		//if(chartType == null){chartType="pie";}
		
		param = {DATE_TYPE  : dateType,
				 CHART_TYPE : chartType};
		
		$.ajax({
			data 		: "POST",
			url			: "/sujin/main/getChartData.do",
			dataType 	: "JSON",
			data		: {DATE_TYPE : dateType,
				 		   CHART_TYPE : chartType},
			success		: function(data){
				chartDataArr = new Array();
				
				
				if(chartType == "pie"){
					chartDataArr.push(new Array( "머리"		, data.chartData[0].B001 ));
					chartDataArr.push(new Array( "어깨(좌)"	, data.chartData[0].B002 ));
					chartDataArr.push(new Array( "어깨(우)"	, data.chartData[0].B003 ));
					chartDataArr.push(new Array( "등"		, data.chartData[0].B004 ));
					chartDataArr.push(new Array( "속"		, data.chartData[0].B005 ));
					chartDataArr.push(new Array( "배"		, data.chartData[0].B006 ));
					chartDataArr.push(new Array( "다리"		, data.chartData[0].B007 ));
					chartDataArr.push(new Array( "팔"		, data.chartData[0].B008 ));
					chartDataArr.push(new Array( "멘탈"		, data.chartData[0].B009 ));
				}else if(chartType == "bar"){
					chartDataArr.push(new Array( "머리"		, data.chartData[0].B001 ));
					chartDataArr.push(new Array( "어깨(좌)"	, data.chartData[0].B002 ));
					chartDataArr.push(new Array( "어깨(우)"	, data.chartData[0].B003 ));
					chartDataArr.push(new Array( "등"		, data.chartData[0].B004 ));
					chartDataArr.push(new Array( "속"		, data.chartData[0].B005 ));
					chartDataArr.push(new Array( "배"		, data.chartData[0].B006 ));
					chartDataArr.push(new Array( "다리"		, data.chartData[0].B007 ));
					chartDataArr.push(new Array( "팔"		, data.chartData[0].B008 ));
					chartDataArr.push(new Array( "멘탈"		, data.chartData[0].B009 ));
					
				}else if(chartType == "line"){
					$.each(data.chartData, function(idx, obj){ 
						chartDataArr.unshift(new Array(String(obj.CHECK_NO) , obj.COL_AVG));
					});
				}
				
				drawVisualization();
			},
			complete	: function(data){
				//alert(JSON.stringify(data));
			},
			error		: function(xhr, status, error){
				alert("error : "+status);
			}
		});
		
		
	}

</script>
</body>
</html>