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
              <li class="active"><a href="/sujin/main/bodyCheck.do">건강상태입력</a></li>
              <li><a href="/sujin/main/bodyCheckDetail.do">건강상태상세</a></li>
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
		<h2>차트</h2>
		<div class="dateTypeBtnWrap">
			<input type="button" class="btn btn-default btn-xs clickChartData" name="clickChartDataD" value="daily"   >
			<input type="button" class="btn btn-default btn-xs clickChartData" name="clickChartDataW" value="weekly"  >
			<input type="button" class="btn btn-default btn-xs clickChartData" name="clickChartDataM" value="monthly" >
			<input type="button" class="btn btn-default btn-xs clickChartData" name="clickChartDataPie" value="PieChart" >
			<input type="button" class="btn btn-default btn-xs clickChartData" name="clickChartDataBar" value="BarChart" >
			<input type="button" class="btn btn-default btn-xs clickChartData" name="clickChartDataLine" value="LineChart" >
		</div>
		<div id = "checkVal"> </div>
		<!-- <div id="googleChartArea">
		
		</div> -->
        <div id="barchart_div" class="googleChart" style="border: 1px solid #cccl; visibility:hidden;" ></div>
	  </div>
	  
	  
      <div class="jumbotron">
		
        <h2>건강상태 입력</h2>
		<form action="/sujin/main/bodyCheckSubmit.do" method="post">
			<div class="form-group" id="draw-contents">
			
        	</div>
        </form>
      </div>

    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	var googleFlag   = false;
	var chartDataArr = new Array();
	var dateType	 = "daily";
	var chartType	 = "pie";
	
	$(document).ready(function(){    
		init();

		//fnGetChartData();
		
		$(":input[name=clickChartDataD]").click(function(){
			dateType = "daily"; 
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataW]").click(function(){
			dateType = "weekly"; 
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataM]").click(function(){
			dateType = "monthly"; 
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataPie]").click(function(){
			chartType = "pie";
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataBar]").click(function(){
			chartType = "bar";
			fnGetChartData();
		}); 
		$(":input[name=clickChartDataLine]").click(function(){
			chartType = "line";
			fnGetChartData();
		}); 
	});
	
	function init(){ //getBodyCheck sql 가져오기(form)
		$.ajax({  
			type		:"POST",
			url			:"/sujin/main/getBodyCheck.do",
			dataType	:"json", 
			success 	:function(data){
				//alert(JSON.stringify(data));
				
				var cd = "";
				$.each(data.cdList, function(idx, obj) { 
					cd += "<option value=\""+obj.CODE_VAL+"\">"+obj.CODE_NM+"</option>"   ;
				});
				
				var contents = "";
				$.each(data.results, function(idx, obj) { 
						contents += "<div class="+obj.BODY_NM+">" 								;
						contents += "<h4>"+obj.BODY_KOR +"</h4>" 								;
						contents += "	<select class=\"form-control\" name="+obj.BODY_CD+">"	;
						contents += cd															;
						contents += "	</select>"													;
						contents += "</div>"														;
				});
						contents += "<h4>비고</h4>"
						contents += "<textarea rows=\"3\" class=\"form-control\" name=\"RMK\" style=\"resize:none;\"></textarea>";
						contents += "<br/>"
						contents += "<input type=\"button\" value=\"입력완료\" class=\"btn btn-default\" onclick=\"inputBodyCheck();\">";
				
				$("#draw-contents").html(contents); 
				
			},
			complete	: function(data){
				setValue();
				
			},
			error		: function(xhr, status, error){
				alert("에러가 발생했습니다. 운영자한테 문의하세요");
			}
		});
		
	}
	
	function setValue(){ //금일 저장된 값이 있으면 세팅
		$.ajax({
			type : "POST",
			url  : "/sujin/main/getTodayValue.do",
			dataType : "JSON",
			success : function(data){
				if(data.todayValue.length > 0){
					//var a= $(".HEAD").find("[name=B001]").val();
					knownJsonKey(data);
				}
			},
			error : function(xhr, status, error){
				alert(status);
			}
		});
	}
	function knownJsonKey(data){ //json key로 셀렉터 찾아서 value 세팅하장
		for (var i = 0; i < data.todayValue.length; i++) { 
			/* for (var prop in data.todayValue[i]) { // json key 값 빼오기 *************
				if (data.todayValue[i].hasOwnProperty(prop)) {
					var key = prop;
					var val = data.todayValue[i][key];
					alert("key : "+key+"  val : "+val);
					//    $("."+key).find("[name=+"val"+]");   //안되는구나....변수는 못들어가니??....
					
					//alert(key);
				}
			} */
			//alert(data.todayValue[0].B001);
			$(".HEAD")		.find("[name=B001]").val(data.todayValue[0].B001);
			$(".SHOULDER_L").find("[name=B002]").val(data.todayValue[0].B002);
			$(".SHOULDER_R").find("[name=B003]").val(data.todayValue[0].B003);
			$(".BACK")		.find("[name=B004]").val(data.todayValue[0].B004);
			$(".STOMACH")	.find("[name=B005]").val(data.todayValue[0].B005);
			$(".ABDOMEN")	.find("[name=B006]").val(data.todayValue[0].B006);
			$(".LEG")		.find("[name=B007]").val(data.todayValue[0].B007);
			$(".ARM")		.find("[name=B008]").val(data.todayValue[0].B008);
			$("textarea[name=RMK]").val(data.todayValue[0].RMK);
		}
	}
	
	function inputBodyCheck(){ //ajax로 디비 저장시키자
		var param = {B001 : $("select[name=B001]").val() ,
					 B002 : $("select[name=B002]").val() ,
					 B003 : $("select[name=B003]").val() ,
					 B004 : $("select[name=B004]").val() ,
					 B005 : $("select[name=B005]").val() ,
					 B006 : $("select[name=B006]").val() ,
					 B007 : $("select[name=B007]").val() ,
					 B008 : $("select[name=B008]").val() ,
					 RMK  : $("textarea[name=RMK]").val()
		};
	
	     $.ajax({
           type    :"POST",
           url     :"/sujin/main/bodyCheckSubmit.do",
           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
           data    : param,
           success : function(data) {
                 alert("저장되었습니다.");
           },
           complete : function(data) {
        	   	 //alert(JSON.stringify(data));
           },
           error : function(xhr, status, error) {
                 //alert("xhr : "+xhr+"error : "+status+" error : "+error);
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
				                   height:  300};
			var piechart = new google.visualization.PieChart(document.getElementById('chart_div'));
			piechart.draw(data, piechart_options);
      }else if(chartType == 'bar'){ 
    	  var title = "";
    	       if(dateType == 'daily'  ) title = '오늘의 상태 바 그래프';
    	  else if(dataType == 'weekly' ) title = '주단위 상태 바 그래프';
    	  else if(dataType == 'monthly') title = '월단위 상태 바 그래프';
    	  
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
				                   height:  300,
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
						          height: 300,

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
				}else if(chartType == "bar"){
					chartDataArr.push(new Array( "머리"		, data.chartData[0].B001 ));
					chartDataArr.push(new Array( "어깨(좌)"	, data.chartData[0].B002 ));
					chartDataArr.push(new Array( "어깨(우)"	, data.chartData[0].B003 ));
					chartDataArr.push(new Array( "등"		, data.chartData[0].B004 ));
					chartDataArr.push(new Array( "속"		, data.chartData[0].B005 ));
					chartDataArr.push(new Array( "배"		, data.chartData[0].B006 ));
					chartDataArr.push(new Array( "다리"		, data.chartData[0].B007 ));
					chartDataArr.push(new Array( "팔"		, data.chartData[0].B008 ));
					
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