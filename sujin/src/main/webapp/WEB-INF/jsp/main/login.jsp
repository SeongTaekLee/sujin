<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<script type="text/JavaScript"  src="/sujin/js/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/sujin/css/bootstrap.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/sujin/css/bootstrap-theme.css">

<!-- 커스텀 CSS -->
<link rel="stylesheet" href="/sujin/css/sujin.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>로그인</title>

</head>
<body>
	
	<div class="container">
	<div class="s-container">
		<form class="form-signin" action="/sujin/main/login.do" method="post">
			<input type="hidden" id="flag" name="flag" value="${flag }">
			
			<h2 class="form-signin-geading">로그인해요~</h2>		
			<label for="inputEmail" class="sr-only">Email address</label>
			<input type="text" id="inputId" name="inputId" class="form-control" placeholder="ID" required autofocus>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			
		</form>
	</div>
	<div class="custom">나는 행복합니다.</div>
	</div> <!-- /container -->
    

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/sujin/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		  //모든 웹페이지의 항목들이 로딩이 완료되었을때 처리해줄 내용
		  var flag = $("#flag").val();
		  if(flag == "error"){
			  alert("아이디와 비밀번호를 확인해보세용");
		  }
	});
</script>
</body>
</html>