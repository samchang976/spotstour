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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS ----------------------------------------------------------------------------------------- -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn----------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

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
<title>活動快訊管理</title>
<style>
body {
	font-size: 20px;
}

.news {
	padding: 5px;
	/* border: 1px solid slateblue; */
}

.clear-block {
	clear: both;
}

.date {
	/* border:1px solid  rgb(73, 147, 221) ; */
	margin-right: 5px;
}
/* .discount{
            border:1px solid  rgb(36, 112, 189) ;
        } */
#newsTitle {
	padding: 10px;
	font-size: 2.2rem;
  	font-weight:bold;
}

.block {
	border-bottom: 1px solid rgb(224, 224, 224); 
	padding: 5px;
}

.text-algin-center{
text-align :center;
}
</style>

<script>
	// window.onload = function() {
	// 	var xhr = new XMLHttpRequest();
	// 	xhr.open("GET", "<c:url value='/activitys' />", true);
	// 	xhr.send();
	// 	xhr.onreadystatechange = function() {
	// 		if (xhr.readyState == 4 && xhr.status == 200) {
	// 			var content = "";
	// 			var activitys = JSON.parse(xhr.responseText);
	// 			for(var i=0; i < activitys.length; i++){
	// 			    content += 	
	// 				"<div class='left' style='float: left;'>" +
	// 					"<div class='date'>${activity.activity_createTime}</div>" +
	// 				"</div>" +
	// 				"<div class='right ' style='float: left;'>" +
	// 					"<div class='discount'>${activity.activityContent}</div>" +
	// 				"</div>" +
	// 				"<div class='right ' style='float: right;'>" +
	// 					"<input type='button' value='刪除'>" +
	// 				"</div>" +
	// 				"<div class='right ' style='float: right;'>" +
	// 					"<input type='button' value='修改'>" +
	// 				"</div>" +
	// 				"<div class='clear-block'></div>" ;
	// 			}
	// 			var divs = document.getElementById("somedivS");
	// 			divs.innerHTML = content;
	// 		}
	// 	}
	// }
</script>

</head>
<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->

		<!-- 新增列 -->
		<div class="container">
			<div class="row">
				<div class="col-9 col-md-3">
					<button id="news" value="新增活動資訊"
							class="btn btn-primary btn-lg"
							onclick="location.href='${pageContext.request.contextPath}/activityModify'">
							<span class="fas fa-plus"></span> 新增活動資訊
					</button>
					<!-- 							<span><button -->
					<!-- 							id="selectall" value="全選">全選</button></span> <span><button -->
					<!-- 							id="denine" value="刪除全選">刪除全選</button></span> -->
				</div>
			</div>
			<!-- ----------------------------------------------------------------------------------------------- -->
			<div  class="row text-algin-center" >
				<h2>管理活動快訊</h2>
			</div>
			<!-- ----------------------------------------------------------------------------------------------- -->
			<div class="row shadow p-3 mb-5 bg-body rounded">
						<div id="newsTitle">活動快訊</div>
						<!--<div class='center' id='somedivS'></div> -->
						<c:forEach var='activity' items='${activitys}'>
						<div class="col-9 block">
							<div onclick="location.href='${pageContext.request.contextPath}/activityDetail/Id=${activity.activityId}'">
								<!--日期--------------------------------------------------------------------->
								<span class="date">${activity.activity_createTime}</span>
								<!--優惠內容------------------------------------------------------------------>
								<span class="discount">${activity.activityContent}</span>
							</div>
						</div>
						<div class="col-3 block">
								<!--刪除--------------------------------------------------------------------->
								<div class="float-end mx-3">
									<!-- <input type="button" value="刪除"> -->
									<button id="deleteA" value="/Id=${activityId}"
										class="btn btn-primary" data-bs-toggle="modal"
										data-bs-target="#deleteActivity${activity.activityId}">刪除活動</button>
								</div>
								<!--修改--------------------------------------------------------------------->
								<div class="float-end">
								<!-- <input type="button" value="修改"> -->
									<button id="editA" value="/Id=${activityId}" class="btn btn-primary"
										onclick="location.href='activityModify/Id=${activity.activityId}'">編輯活動</button>
								</div>
								<div class="clear-block"></div>
							</div>	
						</c:forEach>
			<!-- ----------------------------------------------------------------------------------------------- -->	
					<!-- 回商城首頁 -->
					<div class="text-algin-center my-3">
						<button type="submit" class="btn btn-primary btn-lg"
							onclick="location.href='${pageContext.request.contextPath}/merchandiseIndex'">回商城首頁</button>
					</div>
				</div>	
			</div>
<!-- =================提示視窗============================================================================================================= -->
				<div class="modal fade"
					id="deleteActivity${activity.activityId}" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">刪除編號${activity.activityId}活動</h5>
								<button type="button" class="btn-close"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">確定要刪除 "<b>活動編號${activity.activityId}</b>" 活動??</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">取消</button>
								<button class="btn btn-primary" value="/Id=${activityId}"
									onclick="location.href='activityList/delete/Id=${activity.activityId}'">確定刪除活動</button>
							</div>
						</div>
					</div>
				</div>
<!-- ============================================================================================================================================ -->
				
			

	<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->

</body>
</html>
