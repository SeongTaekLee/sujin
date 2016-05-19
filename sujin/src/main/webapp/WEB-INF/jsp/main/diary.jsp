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
              <li><a href="/sujin/main/bodyCheck.do">건강상태입력</a></li>
              <li><a href="/sujin/main/bodyCheckDetail.do">건강상태상세</a></li>
              <li class="active"><a href="/sujin/main/diary.do">일기</a></li>
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
        <img src="/sujin/smarteditor/img/bg_quote2.gif">
		<form action="/sujin/main/bodyCheckSubmit.do" method="post">
			<div class="form-group" id="draw-contents">
				<textarea name="content" id="content" >11</textarea>
				<script type="text/javascript">
					 var oEditors = [];
					 nhn.husky.EZCreator.createInIFrame({
					 oAppRef: oEditors,
					 elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다.
					 sSkinURI: "sujin/smarteditor/SmartEditor2Skin.html",
					 //sSkinURI: "/sujin/src/main/webapp/smarteditor/SmartEditor2Skin.html",
					 fCreator: "createSEditor2"
					 });
				</script>
				<br/>
				<input type="button" class="btn btn-default" value="저장">
        	</div>
        </form>
      </div>

    </div> <!-- /container -->



<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>