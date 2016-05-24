<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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
              <li class="active"><a href="/sujin/main/bodyCheckDetail.do">건강상태상세</a></li>
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
		
	});
	
	function init(){
		
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