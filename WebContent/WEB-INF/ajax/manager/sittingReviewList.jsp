<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!-- 벼리언니 이거 지우면 안대 화이팅해 언니 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div><!-- 후기 눌렀을 때 -->
			    	
   	<h3><span class="badge">후기</span></h3>
   	<div>
   		
   		<div class="card reviewCard">
		  <img src="..." class="card-img-top"/>
		  <div class="card-body">
		    <h5 class="card-title">후기 제목 입니다아아아</h5>
		    <p class="card-text">후기 내용 어쩌고 저쩌고 </p>
		  </div>
		  <ul class="list-group list-group-light list-group-small">
		    <li class="list-group-item px-4">별점 : ⭐ </li>
		    <li class="list-group-item px-4">작성자 : 견주닉네임</li>
		    <li class="list-group-item px-4">작성일 : 2023-08-05 </li>
		  </ul>
		</div>
		
		<div class="card reviewCard">
		  <img src="..." class="card-img-top"/>
		  <div class="card-body">
		    <h5 class="card-title">후기 제목 입니다아아아</h5>
		    <p class="card-text">후기 내용 어쩌고 저쩌고 </p>
		  </div>
		  <ul class="list-group list-group-light list-group-small">
		    <li class="list-group-item px-4">별점 : ⭐ </li>
		    <li class="list-group-item px-4">작성자 : 견주닉네임</li>
		    <li class="list-group-item px-4">작성일 : 2023-08-05 </li>
		  </ul>
		</div>
   		
   	</div>
  		
</div><!-- 후기 눌렀을 때 끝 -->


</body>
</html>