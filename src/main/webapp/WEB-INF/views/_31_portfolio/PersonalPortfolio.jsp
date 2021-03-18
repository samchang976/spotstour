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

<style>
.like-table {
	display: table-cell;
}

td, .like-table {
	width: 150px;
	height: 80px;
	/* 	border: 1px solid #000; */
	vertical-align: middle;
}

td div, .like-table div {
	width: 100px;
	height: 50px;
	margin: 0 auto;
	color: #fff;
	font-size: 12px;
	line-height: 30px;
	text-align: center;
	/* 	background: #c00; */
}

.like-table div {
	background: #069;
}
</style>
<!-- --------------------------------------------------------------------------------------------------------->
<title>個人作品</title>
</head>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!--定位-------------------------------------------------------------------------------------->
	<div class="BodyPosition">
<!--控制盤----------------------------------------------------------------------------------------->
							
		<!-- 標題 -->
		<div class="row" style="margin:15px">
			<h3>個人作品</h3>
		</div>
		<!-- 控制盤 -->
		<div class="row row row-cols-1 row-cols-md-2" style="margin-top:10px">
			<div class="col-md-6" style="padding-left: 40px;">
				<button class="Bt_blue" style="margin-right: 10px;"
					onclick="location.href='${pageContext.request.contextPath}/videoCreate'">新增影片</button>
				<button class="Bt_blue" style="margin-right: 10px;"
					onclick="location.href='${pageContext.request.contextPath}/personalPortfolio'">依時間排序</button>
				<button class="Bt_blue" style="margin-right: 10px;"
					onclick="location.href='${pageContext.request.contextPath}/personalPortfolio'">依點閱率排序</button>
<!-- 				<button class="Bt_blue" onclick="history.back()" style="margin-right: 5px;">回上一頁</button> -->
				<button class="Bt_blue" onclick="location.href='${pageContext.request.contextPath}/index'" style="margin-right: 35px;">回首頁</button>
			</div>
			<div class="col-md-6" style="padding-right: 40px">
				<form class="d-flex" action="SearchPortfolioDetail" method="get">
					<input class="form-control me-2" type="text" name="searchWord"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</div>
		<br>
<!--個人作品--------------------------------------------------------------------------------------------------------->
		<c:forEach items="${memberPortfolioList}" var="mpl">
			<div class="container-fluid">
				<div class="shadow p-3 mb-5 bg-body rounded" style="margin: 10px;">
					<div class="row R_SpCre">
<!-- 						<div class="col col-1"> -->
<!-- 							<input class="form-check-input" type="checkbox" -->
<!-- 								id="checkboxNoLabel" value="" aria-label="..."> -->
<!-- 						</div> -->

						<div class="col col-4" style="margin-left: 20px">
							<div style="margin: 4px;">
								<H4>${mpl.portfolioName}</H4>
							</div>
								<video controls poster="${pageContext.request.contextPath}${mpl.videoPic}" style="width: 80%; height: auto">
  							    <source src="${pageContext.request.contextPath}${mpl.videoFile}" type="video/mp4">
  							    </video>
							<br>
							<!--按讚次數-->
							<div id="great">
								<a href="#"> <i class="far fa-thumbs-up"></i></a> <span>103</span> 
								<a href="#"> <i class="far fa-thumbs-down"></i></a> <span>1</span>
								<!-- 觀看次數 -->
								<span style="float:right;">觀看次數: 123456次</span>
							</div>
						</div>

						<div class=" col col-5" style="padding:20px;margin-top: 20px">
							<div style="margin: 5px;">
								<i class="fas fa-map-marker-alt"></i> 位置: ${mpl.pAddress}
							</div>
							影片描述: <i>${mpl.portfolioText}</i>
						</div>

<!--影片選項--------------------------------------------------------------------------------------------------------->
						<div class="col col-2" style="margin-left: 80px;margin-top: 20px">
							<table>
								<tr>
									<td>
										<div>
											 <form action="videoModify" method="post" enctype="multipart/form-data">
											 <input type="hidden" name="portfolioId" value="${mpl.portfolioId}">
											 <input type="hidden" name="portfolioName" value="${mpl.portfolioName}">
											 <input type="hidden" name="portfolioText" value="${mpl.portfolioText}">
											 <input type="hidden" name="pAddress" value="${mpl.pAddress}">
											 <input type="hidden" name="longitude" value="${mpl.longitude}">
											 <input type="hidden" name="latitude" value="${mpl.latitude}">
											 <input type="hidden" name="cityId" value="${mpl.cityId}">
											 <input type="hidden" name="cityName" value="${mpl.cityName}">
											 <input type="hidden" name="placeTypeId" value="${mpl.placeTypeId}">
											 <input type="hidden" name="placeType" value="${mpl.placeType}">
											 <input type="hidden" name="mId" value="${mpl.mId}">
<%-- 											 <input type="hidden" name="videoFile" value="${mpl.videoFile}"> --%>
<%-- 											 <input type="hidden" name="videoPic" value="${mpl.videoPic}"> --%>
											 <button class="Bt_blue" type="submit">編輯影片</button>
											 </form>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<button class="Bt_blue" id="deleteM" value="/Id=${portfolioId}"
												data-bs-toggle="modal"
												data-bs-target="#deletePortfolio${mpl.portfolioId}">刪除影片</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<button class="Bt_blue" id="manageFeedback"
												onclick="location.href='manageFeedback/Id=${mpl.portfolioId}'">管理留言</button>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!--設定刪除按鈕動作 -->
						<div class="modal fade" id="deletePortfolio${mpl.portfolioId}"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">刪除影片</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">確定要刪除此影片?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='merchandiseModify/delete/Id=${mpl.portfolioId}'">確定刪除影片</button>
									</div>
								</div>
							</div>
						</div>
						<!--設定刪除按鈕動作 -->

<!----------------------------------------------------------------------------------------------------------->
					</div>
				</div>
			</div>
		</c:forEach>


		<hr>
<!--定位-------------------------------------------------------------------------------------->
	</div>
<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
<!--------------------------------------------------------------------------------------------->

</body>
</html>