<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>managerCompleteAcc</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<script type="text/javascript">

	//페이지 로딩 시에 실행되는 코드
	
	$(document).ready(function()
	{

		var flag =<%=request.getAttribute("flag")%>
			if (flag == '7')
				PetSittingAccComplete();
			
			
		

		function PetSittingAccComplete()
		{
			$.ajax(
			{
				type : "POST",
				url : "sittingacclist.action",
				async : true,
				success : function(data)
				{
					$("#subContent").html(data);

				},
				error : function(e)
				{
					alert(e.responseText);
				}

			});
		}
		
		function DogWalkAccComplete()
		{
			$.ajax(
			{
				type : "POST",
				url : "walkreportlist.action",
				async : true,
				success : function(data)
				{
					$("#subContent").html(data);

				},
				error : function(e)
				{
					alert(e.responseText);
				}

			});
		}
		
		
		

	});
</script>
</head>
<body>
	<div id="subContent">
	<div style="margin-left: -10%; width: 120%;" id="subContent">
		<div>
			<h2 style="margin-top: 20px;">사고처리 내역</h2>
			<hr />
			<button class="report-button" id="pet-sitting-report">펫시팅 신고</button>
			<button class="report-button" id="dog-walking-report">대리산책 신고</button>
		</div>
		<div id="completeTable" class="mt-4">
			<table class="table table-bordered table-hover" id="tableComplete">
				<thead>
					<tr>
						<th style="color: white;">처리번호</th>
						<th style="color: white;">예약번호</th>
						<th style="color: white;">처리자(관리자)</th>
						<th style="color: white;">처리일자</th>
					</tr>
				</thead>
				<tbody>
				
						
					
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>