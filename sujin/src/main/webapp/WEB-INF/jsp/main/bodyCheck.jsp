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
            <a class="navbar-brand" href="/sujin/">건강상태 확인</a>
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
		<form action="/bodyCheckSubmit.do">
			<div class="form-group">
			<c:forEach var = "row" items="${list}">
			<div class="${row.BODY_NM}">
				<h4>${row.BODY_KOR }</h4>
					<select class="form-control" name="${row.BODY_NM}">
					  <option value="5">매우좋음</option>
					  <option value="4">좋음</option>
					  <option value="3">보통</option>
					  <option value="2">나쁨</option>
					  <option value="1">매우나쁨</option>
					</select>
			</div>
			</c:forEach>
			
			<h4>비고</h4>
			<textarea rows="3" class="form-control" name="REMARK"></textarea>
	        <input type="submit" value="입력완료" class="btn btn-default">
        </div>
        </form>
      </div>

    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){    
		var a = ${loginFlag};
		alert(a);
		
	});
	
	
	
	
	
</script>
</body>
</html>