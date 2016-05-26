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
              <li class="active"><a href="/sujin/main/bodyCheck.do">몸</a></li>
              <li><a href="/sujin/main/food.do">음식</a></li>
              <li><a href="/sujin/main/coffee.do">커피</a></li>
              <li><a href="/sujin/main/diary.do">일기</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/sujin/main/logout.do">logout</a></li>
            </ul>

          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->

      </nav>

	<!-- 건강상태 입력 -->
      <div class="jumbotron">
		
        <h2>건강상태</h2>
		<form action="/sujin/main/bodyCheckSubmit.do" method="post">
			<div class="form-group" id="draw-contents">
			
        	</div>
        </form>
      </div>
      
      <!-- 건강상태 상세 -->
	<div class="jumbotron">

        <h2>건강상태 상세</h2>
		
        <table class="table table-bordered table-hover" >
			<colgroup>
				<col width="10%"/>
				<col width="5%"/> <!-- B001 -->
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/> <!-- B008 -->
				<col width="5%"/> <!-- B009 -->
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr class="success" id="result_th" style="text-align:center;">
					<!-- <th scope="col"> 날짜			</th>
					<th scope="col"> 머리			</th>
					<th scope="col"> 어깨<br>(좌)	</th>
					<th scope="col"> 어깨<br>(우)	</th>
					<th scope="col"> 등				</th>
					<th scope="col"> 속<br>(위장)	</th>
					<th scope="col"> 배<br>(대장)	</th>
					<th scope="col"> 다리			</th>
					<th scope="col"> 팔				</th>
					<th scope="col"> 멘탈			</th>
					<th scope="col"> 등록시간 		</th>
					<th scope="col"> 비고			</th> -->
				</tr>
			</thead>
			<tbody id="result_tr">
				<%-- <c:choose>
					
					<c:when test="${fn:length(bodyDetailList) > 0}">
						<c:forEach items="${bodyDetailList }" var="row">
							<tr >
								<td>${row.CHECK_NO_DATE}</td>
								<td>${row.B001}</td>
								<td>${row.B002}</td>
								<td>${row.B003}</td>
								<td>${row.B004}</td>
								<td>${row.B005}</td>
								<td>${row.B006}</td>
								<td>${row.B007}</td>
								<td>${row.B008}</td>
								<td>${row.REG_DT}</td>
								<td>${row.RMK}</td>
							</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>  --%>
			</tbody>
		</table>	
      </div>
      
      

    </div> <!-- /container -->
	
	
	


<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	
	$(document).ready(function(){    
		init();
		initDetail();

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
			$(".MENTAL")	.find("[name=B009]").val(data.todayValue[0].B009);
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
					 B009 : $("select[name=B009]").val() ,
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
	
function initDetail(){
		
		$.ajax({
			type : "POST",
			url  : "/sujin/main/getBodyCheckDetail.do",
			dataType : "json",
			success : function(data){  
				
				/* <th scope="col"> 날짜			</th> */
				var thList = "";
				if(data.thList.length > 0){
					thList	+= "<th scope=\"col\" style=\"text-align:center\" > 날짜				</th>" ;
					$.each(data.thList, function(idx, obj){ 
						thList += "<th scope=\"col\" style=\"text-align:center\" > "+obj.BODY_KOR+"	</th>";
					});
					thList	+= "<th scope=\"col\" style=\"text-align:center\" > 합계 				</th>";
					thList	+= "<th scope=\"col\" style=\"text-align:center\" > 평균	 			</th>";
					thList	+= "<th scope=\"col\" style=\"text-align:center\" > 등록시간 			</th>";
					thList	+= "<th scope=\"col\" style=\"text-align:center\" > 비고    			</th>";
				}else{
					thList +="<th scope=\"col\" style=\"text-align:center\" colspan=\"11\"> 조회된 값이 없습니다. </th>";
				}
				$("#result_th").html(thList);
				
				var html = "";
				if(data.result.length > 0){ 
					$.each(data.result, function(idx, obj){ 
						html += "<tr>"					   					;
						html += "<td>"+obj.CHECK_NO_DATE+"</td>"			;
						html += "<td class=\"tb_val\">"+obj.B001+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B002+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B003+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B004+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B005+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B006+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B007+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B008+"</td>"    ;
						html += "<td class=\"tb_val\">"+obj.B009+"</td>"    ;
						html += "<td>"+obj.SUM+"</td>" 				 		;
						html += "<td>"+obj.AVG+"</td>" 				 		;
						html += "<td>"+obj.REG_DT+"</td>" 				 	;
						html += "<td>"+obj.RMK+"</td>"     					;
						html += "</tr>"					   					;
					});
				}else{
					html += "<tr><td style=\"  text-align:center;  \" colspan=\"11\"> 조회된 결과값이 없습니다. </td></tr>";
				}
				
				$("#result_tr").html(html);
			},
			error : function(xhr, status , error ){
				alert(" status : "+status+"  error: "+ error);
			},
			complete : function(data){
				$(".tb_val:contains('1')").css("color", "#eb0000");
				$(".tb_val:contains('2')").css("color", "#ff8200");
				$(".tb_val:contains('3')").css("color", "#282828");
				$(".tb_val:contains('4')").css("color", "#228b22");
				$(".tb_val:contains('5')").css("color", "#0000ff");
			}
			
			
		});
		
		
	}
		
		
</script>
</body>
</html>