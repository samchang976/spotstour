<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags------------------------------------------------------------------------------------- -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS ----------------------------------------------------------------------------------------- -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn----------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- animation --------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!-- css連結------------------------------------------------------------------------------------------------ -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilColor.css'></c:url>">


<link rel="stylesheet"
	href="<c:url value='/_00_util/managerUtil/css/managerLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/managerUtil/css/managerFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/managerUtil/css/managerColor.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->

<title>活動管理清單</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="font.css">
<style>
body {
	margin: 0px;
	font-size: 20px;
}

#first { /*最外層的div，包含所有*/
	/* border: rgb(219, 67, 67) solid 1px; */
	/* background: #000; */
	text-align: center;
	margin: auto;
	width: 60%;
}

/* #scoend{   div，檢舉類型選單
           border: rgb(32, 4, 4) solid 1px;
           height: 30px;
           text-align: left;
        }*/
button { /*確定、送出的按鈕排版*/
	padding: 10px;
	color: rgb(24, 24, 168);
	border: 1px rgb(24, 24, 168) solid;
	background-color: rgb(245, 241, 242);
	border-radius: 5px;
}

#confirm {
	text-align: center;
}
/* .form-label{ */
/* 	height: 30px; */
/* 	ma */
/* } */
</style>
</head>
<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->

		<div class="container">
			<div class="row">
				<div class="col">
					<div id="first">
						<c:if test="${activityId==null}">
							<h2>新增活動</h2>
						</c:if>
						<c:if test="${activityId!=null}">
							<h2>編輯活動</h2>
						</c:if>
						<div data-aos="zoom-out-down">
							<div class="shadow p-3 mb-5 bg-body rounded">
								<form:form method="POST" modelAttribute="activityBean"
									enctype="multipart/form-data">
									<!-- 						<input type="text" name="Reportdescription" placeholder="請輸入內容" -->
									<!-- 							style="font-size: 20px; font-family: 'Tahoma'; padding: 6px; width: 100%; padding-bottom: 300px;"> -->
									<br>
									<div class="col-12" style="text-align: left;">
										<label for="exampleFormControlInput1" class="form-label">活動標頭(30字以內)
											:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
											<span id="activityHeaderFeedback"></span>
										<form:input type="text" path="activityHeader"
											class="form-control" id="activityHeader" maxlength="30"
											placeholder="字數限制30字以內" />
									</div>
									<br>
									<div class="col-12" style="text-align: left;">
										<label for="exampleFormControlInput1" class="form-label">活動內容(200字以內)
											:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
											<span id="activityContentFeedback"></span>
										<form:input type="text" path="activityContent"
											class="form-control" id="activityContent"
											style="padding: 6px; width: 100%; padding-bottom: 200px;"
											maxlength="200" placeholder="字數限制200字以內" />
									</div>
									<br>
									<div class="col-12" style="text-align: left;">
										<label for="exampleFormControlInput1" class="form-label">活動照片
											: </label>
										<div>
											<!-- 										<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
											<!-- 											class="w-100"> <br> -->
											<form:input type="file" path="activityImage"
												id="activityImage" class="form-control"/>
										</div>
										<!-- 									<div class="image"> -->
										<!-- 										<img id="image1" /> -->
										<!-- 									</div> -->
										<c:if test="${activityBean.activityId!=null}">
											<div class="image">
												<img id="image1" class="w-100"
													src="<c:url value='/activityDetail/${activityBean.activityId}'/>" />
											</div>
										</c:if>
										<c:if test="${activityBean.activityId==null}">
											<div class="image">
												<img id="image1" class="w-100" <%-- 										src="<c:url value='/activityDetail/${activityBean.activityId}'/>" --%>
										 />
											</div>

										</c:if>
									</div>

									<div class="form-group row d-flex justify-content-end mt-5">
										<div style="text-align: center;">
											<div id="confirm" style="background: #fff;">
												<c:if test="${activityId==null}">
												<button id="inputAllBtn" type="button"
														class="btn btn-primary">一鍵輸入</button>
														&nbsp;&nbsp;
													<button type="submit" id="newM" class="btn btn-primary"
														onclick="location.href='activityModify/get/Id=${activity.activityId}'"
														data-bs-toggle="modal" data-bs-target="#exampleModal">新增活動</button>
													

												</c:if>

												<c:if test="${activityId!=null}">
													<button type="submit" id="editM" class="btn btn-primary"
														onclick="location.href='activityModify/Id=${activity.activityId}'"
														data-bs-toggle="modal" data-bs-target="#exampleModal">儲存變更</button>
												</c:if>
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>

						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<c:if test="${activityId==null}">
											<h5 class="modal-title" id="exampleModalLabel">新增成功</h5>
										</c:if>
										<c:if test="${activityId!=null}">
											<h5 class="modal-title" id="exampleModalLabel">修改成功</h5>
										</c:if>

										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<c:if test="${activityId==null}">
										<div class="modal-body">新增成功!! 5秒後自動跳轉至活動列表</div>
									</c:if>
									<c:if test="${activityId!=null}">
										<div class="modal-body">修改成功!! 5秒後自動跳轉至活動列表</div>
									</c:if>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">關閉視窗</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='${pageContext.request.contextPath}/activityList'">前往活動列表</button>
									</div>
								</div>
							</div>
						</div>

						<button type="submit" class="btn btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/activityList'">返回前一頁</button>
					</div>
				</div>
			</div>
		</div>
		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
	
	<script>
		$(document).ready(function() {
			
			let headerTextMax = 30;
			let contentTextMax = 200;
			$('#activityHeaderFeedback').html(`剩餘<span style="color:red;">${'${'}headerTextMax}</span>個字`);
			$('#activityContentFeedback').html(`剩餘<span style="color:red;">${'${'}contentTextMax}</span>個字`);
			typeChange();
			
			//一鍵輸入功能
			//存取input標籤的值必須使用.val()方法
			$('#inputAllBtn').click(function() {
				$('#activityHeader').val("期末活動");
				$('#activityContent').val("輸入折扣碼SPOTSTOURJAVA015");
				typeChange();
			})
			
			$('#activityHeader').on('input propertychange',typeChange)
			$('#activityContent').on('input propertychange',typeChange)
			
			
			function typeChange(){
				let headerTextLength = $('#activityHeader').val().length;
				$('#activityHeaderFeedback').html(`剩餘<span style="color:red;">${'${'}headerTextMax-headerTextLength}</span>個字`);
				let contentTextLength = $('#activityContent').val().length;
				$('#activityContentFeedback').html(`剩餘<span style="color:red;">${'${'}contentTextMax-contentTextLength}</span>個字`);
			
			}
			
			$('#activityImage').change(function() {
				readURL(this);
			})
			//因為單選的關係，所以有檔案一定是在第0個。
			function readURL(input) {
				if (input.files && input.files[0]) {
					let reader = new FileReader();
					reader.onload = function(e) { //讀出來是二進位檔案
						$('#image1').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
		});
	</script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>

</body>
</html>