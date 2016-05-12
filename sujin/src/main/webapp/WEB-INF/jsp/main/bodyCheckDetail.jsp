<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<table class="board_list">
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


</body>
</html>