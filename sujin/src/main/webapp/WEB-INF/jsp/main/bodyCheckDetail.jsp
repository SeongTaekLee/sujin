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
            <a class="navbar-brand" href="/sujin/">BodyCheck</a>
          </div>

          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="/sujin/main/bodyCheck.do">BodyCHeck</a></li>
              <li class="active"><a href="/sujin/main/bodyCheckDetail.do">BodyCheckDetail</a></li>
              <li><a href="#">Diary</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/sujin/main/logout.do">logout</a></li>
            </ul>

          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->

      </nav>



      <!-- Main component for a primary marketing message or call to action -->

      <div class="jumbotron">

        <h1>Navbar example</h1>

        <table class="table table-striped">
			<colgroup>
				<col width="10%"/>
				<col width="*"/>
				<col width="15%"/>
				<col width="20%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col"> 키 			</th>
					<th scope="col"> 등록날짜		</th>
					<th scope="col"> 머리			</th>
					<th scope="col"> 어깨(좌)		</th>
					<th scope="col"> 어깨(우)		</th>
					<th scope="col"> 등				</th>
					<th scope="col"> 속(위장)		</th>
					<th scope="col"> 배(대장)		</th>
					<th scope="col"> 다리			</th>
					<th scope="col"> 팔				</th>
					<th scope="col"> 비고			</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					
					<c:when test="${fn:length(bodyDetailList) > 0}">
						<c:forEach items="${bodyDetailList }" var="row">
							<tr>
								<td>${row.CHECK_NO}</td>
								<td>${row.REG_DT}</td>
								<td>${row.B001}</td>
								<td>${row.B002}</td>
								<td>${row.B003}</td>
								<td>${row.B004}</td>
								<td>${row.B005}</td>
								<td>${row.B006}</td>
								<td>${row.B007}</td>
								<td>${row.B008}</td>
								<td>${row.RMK}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>	
      </div>

    </div> <!-- /container -->


		

<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>