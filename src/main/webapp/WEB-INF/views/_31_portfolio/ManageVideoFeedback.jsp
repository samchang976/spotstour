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
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/portfolioUtil/css/portfolioColor.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->
<title>收藏的影片</title>
</head>
<body>
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
				<h4>${item.itemHeader}影片留言
				</h4>
			</div>

			<div style="line-height: 2.5;">
				<c:forEach var='feedback' items='${feedbacks}'>
					<div class="container-fluid">
						<div class="row R_SpCre">
							<div class="shadow p-3 bg-body rounded">
								<div class="col col-2-1 C_SpCre">
									<div>
										<div class="row">
											<div class="col-1" style="text-align: center; margin: auto;">
												<i class="fas fa-trash-alt" id="deleteVideo"
													value="/Id=${feedback.feedbackId}"
													<%-- 								onclick="location.href='/delete/ItId=${itemBean.itemId}/FbId=${feedback.feedbackId}'"></i> --%>
<%-- 								onclick="location.replace('${pageContext.request.contextPath}/manageFeedback/delete/ItId=${itemBean.itemId}/FbId=${feedback.feedbackId}')"></i> --%>
								 data-bs-toggle="modal"
													data-bs-target="#exampleModal${feedback.feedbackId}"></i>
											</div>
											<div class="col-11">
												<c:set var="fbCreateTime" value="${feedback.f_createTime}" />


												<br>影片留言:${feedback.feedbackText}
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal${feedback.feedbackId}"
						tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">刪除影片留言</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">確定要刪除影片留言??</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary"
										onclick="location.replace('${pageContext.request.contextPath}/manageFeedback/delete/ItId=${itemBean.itemId}/FbId=${feedback.feedbackId}')">確定刪除商品留言</button>
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