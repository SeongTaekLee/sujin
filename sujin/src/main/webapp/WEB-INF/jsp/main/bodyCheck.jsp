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
              <li><a href="#">일기(예정)</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/sujin/main/logout.do">logout</a></li>
            </ul>

          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->

      </nav>



      <!-- Main component for a primary marketing message or call to action -->

      <div class="jumbotron">

        <h2>건강상태 입력</h2>
		<form action="/sujin/main/bodyCheckSubmit.do" method="post">
			<div class="form-group" id="draw-contents">
			
			<%-- <c:forEach var = "row" items="${list}">
			<div class="${row.BODY_NM}">
				<h4>${row.BODY_KOR }</h4> 
					<select class="form-control" name="${row.BODY_CD}">
					  <option value="5">매우좋음</option>
					  <option value="4">좋음</option>
					  <option value="3">보통</option>
					  <option value="2">나쁨</option>
					  <option value="1">매우나쁨</option>
					</select>
			</div>
			</c:forEach> --%>
			
			<!-- <h4>비고</h4>
			<textarea rows="3" class="form-control" name="RMK" style="resize:none;"></textarea>
			<br/>
	        <input type="button" value="입력완료" class="btn btn-default" onclick="inputBodyCheck();"> -->
        </div>
        </form>
      </div>

    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){    
		//var a = $("select[name=B001]").val();
		//alert(a);
		init();
		
	});
	
	function init(){ //getBodyCheck sql 가져오기
		$.ajax({  
			type		:"POST",
			url			:"/sujin/main/getBodyCheck.do",
			dataType	:"json", 
			success 	:function(data){
				
				var contents = "";
				$.each(data.results, function(idx, obj) { 
						contents += "<div class="+obj.BODY_NM+">" 								;
						contents += "<h4>"+obj.BODY_KOR +"</h4>" 								;
						contents += "	<select class=\"form-control\" name="+obj.BODY_CD+">"	;
						contents += "	  <option value=\"5\">매우좋음</option>"					;
						contents += "	  <option value=\"4\">좋음</option>	"						;
						contents += "	  <option value=\"3\">보통</option>	"						;
						contents += "	  <option value=\"2\">나쁨</option>	"						;
						contents += "	  <option value=\"1\">매우나쁨</option>"					;
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
				//alert("22  "+data);
			},
			error		: function(xhr, status, error){
				alert("에러가 발생했습니다. 운영자한테 문의하세요");
			}
		});
		
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
           dataType:"html", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
           data    : param,
           success : function(data) {
                 alert("sucess  :: "+data);
           },
           complete : function(data) {
        	   	 alert("complete");
           },
           error : function(xhr, status, error) {
                 alert("xhr : "+xhr+"error : "+status+" error : "+error);
           }
	     });
		
		
	}
	
	
	
</script>
</body>
</html>