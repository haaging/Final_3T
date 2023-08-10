<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
	String memSid = (String) session.getAttribute("memSid"); // 최초 요청시 "0"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 공고글</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>
h2, h4 {
	font-family: "Jua";
	font-size: 20pt;
}

h2 span {
	font-weight: lighter;
	font-size: 18pt;
	color: red;
}

.card-rank {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	background-color: #f00;
	color: #fff;
	border-radius: 50%;
}

.custom-textbox {
	padding: 8px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	outline: none;
}

.card-content {
	padding-top: 40px;
	/* Adjust the value to add space between card title and rank */
}

.selection-bar {
	background-color: #333;
	color: #fff;
	padding: 10px;
}

.selection-bar label, .selection-bar select, .selection-bar button {
	margin-right: 10px;
}

.selection-bar button {
	background-color: #f00;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

.selection-bar button:hover {
	background-color: #ff0000;
}

/* 버튼 스타일 */
.radio-button {
	display: inline-block;
	background-color: #f00;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	margin-right: 10px;
	border-radius: 5px;
}

/* 선택된 라디오 버튼의 스타일 */
.radio-button.selected {
	background-color: #367539; /* 선택된 버튼에 진한 녹색 계열 배경 색상 적용 */
}

@import url('https://fonts.googleapis.com/css?family=Jua:400');

/* 모든 p 태그 글자 폰트 적용 */
p {
	font-family: "Jua";
	font-weight: Regular;
}

/* .btn-box 클래스 글자 폰트 적용 */
.btn-box {
	font-family: "Jua";
}

.tags {
	margin-bottom: 50px;
}

.selection-bar.mb-4 {
	background-color: #fff; /* 배경색을 하얀색으로 */
	color: #000; /* 글자색을 검정색으로 */
	padding: 10px; /* 패딩 추가 */
	border: 2px solid #000; /* 테두리 추가 */
	border-radius: 5px; /* 테두리 둥글기 설정 */
	margin-bottom: 20px; /* 아래쪽 여백 추가 */
}

.selection-bar.mb-4 label, .selection-bar.mb-4 select, .selection-bar.mb-4 button
	{
	margin-right: 10px;
}

.selection-bar.mb-4 button {
	background-color: #fff;
	color: #000;
	border: 2px solid #000;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 5px;
}

.selection-bar.mb-4 button:hover {
	background-color: #4caf50;
}
</style>

<style>
@import url('https://fonts.googleapis.com/css?family=Jua:400');

.badge {
	font-family: "Jua";
}

.mypageSidevar {
	font-family: "Jua";
	font-size: 15pt;
}

.card-header {
	font-family: "Jua";
	font-size: 17pt;
}

.card {
	font-family: "Jua";
	cursor: pointer;
}

.checkBox {
	font-family: "Jua";
	font-size: 15pt;
}

.superscript {
	font-family: "Jua";
}

.detailBtn {
	font-family: "Jua";
}

.updatePlace {
	font-family: "Jua";
	font-weight: normal;
}
</style>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$().ready(function()
	{

		// 펫시팅 돌봄장소 클릭시 예약화면
		$("#spPost").click(function()
		{
			window.location.href = "sittingreservationpage.action";
		});
		
		
		
		$("#filter").click(function()
		{	
			var AddrData = "extraAddr=" + $("#extraAddr").val();
			alert("동 : " + $("#extraAddr").val());
			
			$.ajax(
			{
				type : "POST",
				url : "sittingfilterlist.action",
				async : true,
				data : AddrData,
				success : function(data)
				{
					$("#cardContainer").html(data);
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
	});
</script>


</head>
<body>
	<c:import url="/WEB-INF/components/index/HeaderForm.jsp">
	</c:import>
	<section>
		<div class="container-fluid py-5 bg-light"  style="padding-left: 150px; padding-right: 150px;">

			<!-- Selection Bar -->
			<div class="selection-bar mb-4" 
				style="font-family: Jua; font-size: 13pt; padding-left: 30px; padding-right: 30px;">
				
				
				<!-- 동 검색 구역 시작 -->
				<input type="text" id="zipCode" placeholder="우편번호" readonly="readonly">
				<input type="button" onclick="sample2_execDaumPostcode()" value="지역 찾기">
				<input type="text" id="jmAddr1" name="jmAddr1" placeholder="주소" readonly="readonly">
				<!-- <input type="text" id="sample2_detailAddress" placeholder="구"> -->
				<input type="text" id="extraAddr" placeholder="동" readonly="readonly">
				
				
				<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
				
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    // 우편번호 찾기 화면을 넣을 element
				    var element_layer = document.getElementById('layer');
				
				    function closeDaumPostcode() {
				        // iframe을 넣은 element를 안보이게 한다.
				        element_layer.style.display = 'none';
				    } 
					
				    
				    function sample2_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				                
				            	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var addr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = extraAddr;
				                    }
				                    // 조합된 참고항목을 해당 필드에 넣는다.
				                    document.getElementById("extraAddr").value = extraAddr;
				                
				                } else {
				                    document.getElementById("extraAddr").value = '';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                //document.getElementById('sample2_postcode').value = data.zonecode;
				                //document.getElementById("sample2_address").value = addr;
				                // 커서를 상세주소 필드로 이동한다.
				                //document.getElementById("sample2_detailAddress").focus();
				
				                // iframe을 넣은 element를 안보이게 한다.
				                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				                element_layer.style.display = 'none';
				            },
				            width : '100%',
				            height : '100%',
				            maxSuggestItems : 5
				        }).embed(element_layer);
				
				        // iframe을 넣은 element를 보이게 한다.
				        element_layer.style.display = 'block';
				
				        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
				        initLayerPosition();
				    }
				
				    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
				    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
				    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
				    function initLayerPosition(){
				        var width = 300; //우편번호서비스가 들어갈 element의 width
				        var height = 300; //우편번호서비스가 들어갈 element의 height
				        var borderWidth = 5; //샘플에서 사용하는 border의 두께
				
				        // 위에서 선언한 값들을 실제 element에 넣는다.
				        element_layer.style.width = width + 'px';
				        element_layer.style.height = height + 'px';
				        element_layer.style.border = borderWidth + 'px solid';
				        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
				        //element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
				        //element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
				        element_layer.style.left = 150 + 'px';
				        element_layer.style.top = 180 + 'px';
				    }
				    
				</script>
				
				<!-- 동 검색 구역 끝 -->
					
				 <label for="datepicker">날짜 선택:</label> 
				 <input type="text" id="datepicker" class="custom-textbox" readonly style="width: 115px;"> 
				 <label for="dogs">견수:</label> <input type="number" id="dogs" class="custom-textbox" min="1" max="2">

				<button class="button" id="filter">적용</button>
				<button class="button" onclick="sittingTest()" style="float: right;">펫시터
					지원하기</button>
				<script>
					function sittingTest()
					{
						window.location.href = "sittingtest.action";
					}
				</script>
			</div>

			<div class="mb-4" style="font-family: Jua; font-size: 25pt;">
				<!-- 버튼 모양의 복수 선택 라디오 버튼 -->
				<c:forEach var="dto" items="${IndexTagList }">
					<button class="btn radio-button"
						style="margin: 5px; background-color: #4caf50; color: white; padding: 10px 20px"
						value="${dto.isptSid }">${dto.isptName }</button>
				</c:forEach>
			</div>

			<script>
				$(document).ready(function()
				{
					// 클릭한 버튼에 selected 클래스 추가 및 제거
					$('.radio-button').click(function()
					{
						$(this).toggleClass('selected');
						if ($(this).hasClass('selected'))
						{
							$(this).css('background-color', '#367539'); // 선택된 스타일로 변경
						} else
						{
							$(this).css('background-color', '#4caf50'); // 원래 스타일로 변경
						}
					});
				});
			</script>
			
			





			<h2>펫시터 공고글</h2>
			<hr>

			<div id="cardContainer">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<c:if test="${status.count % 3 == 1}">
						<div class="row justify-content-between">
					</c:if>

					<div class="card" id="spPost" style="margin: 5px; width: 32%; margin-bottom: 50px;">
						<img src="images/sitterroom.jpg" alt="" class="card-img-top"
							style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title">${gradeList[status.index].grade}
								${dto.jmNickName}</h5>
							<h6 class="card-subtitle text-muted">${dto.spAddr1}
								<br /> ${dto.sptitle}
							</h6>
							<br>
							<p>4.8 ⭐ (452개의 후기)
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;
								 ${gradeList[status.index].price}원/ 1박</p>
						</div>
						<!-- end .card-body -->
					</div>
					<!-- end .card -->

					<c:if test="${status.count % 3 == 0}">
			</div>
			<!-- end .row -->
			</c:if>
			</c:forEach>
		</div>
		</div>


		<script>
			// 무한 스크롤 함수
			function infiniteScroll()
			{
				// 현재 스크롤 위치
				var scrollTop = $(window).scrollTop();
				// 화면의 높이
				var windowHeight = $(window).height();
				// 문서 전체 높이
				var documentHeight = $(document).height();

				// 스크롤이 문서 맨 아래에 도달하면 새로운 카드를 추가
				if (scrollTop + windowHeight >= documentHeight)
				{
					// 새로운 카드를 추가하는 작업을 여기에 작성합니다.
					// 예시로 9개의 기존 카드를 복사하여 추가하는 코드를 작성합니다.
					var cards = `<c:out value="${cards}" escapeXml="false" />`;
					for (var i = 0; i < 9; i++)
					{
						$("#cardContainer").append(cards);
					}
				}
			}

			// 스크롤 이벤트를 감지하여 무한 스크롤 함수 호출
			$(window).on("scroll", infiniteScroll);

			// 초기에 한번 스크롤 이벤트를 발생시키기 위해 호출
			infiniteScroll();
		</script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
		<script
			src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	</section>
	<section>
		<div>
			<c:import url="/WEB-INF/components/index/FooterForm.jsp">
			</c:import>
		</div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</body>

<script>
	flatpickr("#datepicker",
	{
		dateFormat : 'Y-m-d',
		position : "below",
		defaultDate : "today",
		theme : "airbnb"
	});
</script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

</html>