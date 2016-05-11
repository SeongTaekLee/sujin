<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
		<td>CHECK_NO 키 </td>
		<td>REG_DT 등록날짜</td>
		<td>B001 HEAD	머리</td>
		<td>B002 SHOULDER_L	어깨(좌)</td>
		<td>B003 SHOULDER_R	어깨(우)</td>
		<td>B004 BACK	등</td>
		<td>B005 STOMACH	속(위장)</td>
		<td>B006 ABDOMEN	배(대장)</td>
		<td>B007 LEG	다리</td>
		<td>B008 ARM	팔</td>
		<td>RMK  비고</td>
	</tr>
	<tr>
		<td>${CHECK_NO}</td>
		<td>${REG_DT}</td>
		<td>${B001}</td>
		<td>${B002}</td>
		<td>${B003}</td>
		<td>${B004}</td>
		<td>${B005}</td>
		<td>${B006}</td>
		<td>${B007}</td>
		<td>${B008}</td>
		<td>${RMK}</td>
		
	</tr>
</table>


</body>
</html>