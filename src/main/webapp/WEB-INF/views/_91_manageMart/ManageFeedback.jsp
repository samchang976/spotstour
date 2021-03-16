<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>編輯商品留言</title>

<style>
body {
	font-size: 20ox;
	text-align: center;
}

.container {
	text-align: left;
	width: 700px;
}

.container-fluid {
	text-align: left;
	/* 	border: 1px solid black; */
	margin: 10px 100px;
	padding-top: 10px;
}

button { /*按鈕的樣式*/
	padding: 10px;
	color: rgb(24, 24, 168);
	border: 1px rgb(24, 24, 168) solid;
	background-color: rgb(245, 241, 242);
	border-radius: 5px;
}
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
			<!-- 陳列商品留言 -->
			<div style="text-align: center;">
				<h3>${item.itemHeader}商品留言</h3>
			</div>
			<div style="text-align: right;">
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<span>現在時間 : <fmt:formatDate type="both" dateStyle="long"
						timeStyle="long" value="${now}" /></span>
			</div>

			<div style="line-height: 2.5;">
				<c:forEach var='feedback' items='${feedbacks}'>
					<div class="container-fluid">
						<div class="row R_SpCre">
							<div class="shadow p-3 bg-body rounded">

								<div class="col col-2-1 C_SpCre">
									<div>
										<div class="row">
											<div class="col-1">
												<i class="fas fa-trash-alt" id="deleteF"
													value="}/Id=${feedback.feedbackId}"
													<%-- 								onclick="location.href='/delete/ItId=${itemBean.itemId}/FbId=${feedback.feedbackId}'"></i> --%>
								onclick="location.replace('${pageContext.request.contextPath}/manageFeedback/delete/ItId=${itemBean.itemId}/FbId=${feedback.feedbackId}')"></i>
											</div>

											<div class="col-11">
												<c:set var="fbCreateTime" value="${feedback.f_createTime}" />
												<fmt:formatDate type="both" dateStyle="long"
													timeStyle="medium" value="${fbCreateTime}" />

												<br>商品留言:${feedback.feedbackText}
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
				</c:forEach>
				<hr>
			</div>
		</div>
		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->

</body>
</html>
