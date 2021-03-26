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

.container {
	max-width: 1200px;
}

.flex{
	display: flex;
    align-items: center;
}

label{
width: 70px;
}
</style>

<script type="text/javascript">
	function submitBtnClick() {
		document.fileForm.submit();
	}
</script>
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
		<div class="container" id="container_PersonalPortfolio">
			<!-- 標題 -->
			<div style="text-align: center;">
				<h2>個人作品</h2>
				<p></p>
			</div>
			<!-- 控制盤 -->
			<div class="row row row-cols-1 row-cols-md-2 my-2">
				<div class="col-md-8 flex" >
					<button class="btn btn-primary mx-1" 
						onclick="location.href='${pageContext.request.contextPath}/videoCreate'">新增影片</button>
					
					
					<form action="personalPortfolio" method="post">
						<input type="hidden" name="param" value="1">
						<button class="btn btn-primary mx-1"  type="submit">依新到舊時間排序</button>
					</form>	
					
					
					<form action="personalPortfolio" method="post">
						<input type="hidden" name="param" value="2">
						<button class="btn btn-primary mx-1" type="submit">依舊到新時間排序</button>	
					</form>	
					
					
					<form action="personalPortfolio" method="post">
						<input type="hidden" name="param" value="3">
						<button class="btn btn-primary mx-1" type="submit">依觀看次數排序</button>	
					</form>	
					
					<form action="personalPortfolio" method="post">
						<input type="hidden" name="param" value="4">
						<button class="btn btn-primary mx-1" type="submit">依按讚數排序</button>	
					</form>	
					<!-- 				<button class="Bt_blue" onclick="history.back()" style="margin-right: 5px;">回上一頁</button> -->
					<button class="btn btn-primary mx-1"
						onclick="location.href='${pageContext.request.contextPath}/index'"
						>回首頁</button>
				
				
				</div>
				
<!-- 搜尋--------------------------------------------------------------------------------------------------------- -->
				<div class="col-md-4" >
					<form class="d-flex" action="SearchPortfolioDetail" method="get">
						<input class="form-control me-2" type="text" name="searchWord"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-secondary" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<!--個人作品--------------------------------------------------------------------------------------------------------->
			<c:forEach items="${memberPortfolioList}" var="mpl">
<!-- 				<div class="container-fluid"> -->
					<div class="shadow p-3 mb-5 bg-body rounded my-3" >
						<div class="row">
							<!-- 						<div class="col col-1"> -->
							<!-- 							<input class="form-check-input" type="checkbox" -->
							<!-- 								id="checkboxNoLabel" value="" aria-label="..."> -->
							<!-- 						</div> -->
							<div class="col-5">
								
								<video controls poster="/upload${mpl.videoPic}"
									class="w-100">
									<source src="/uploadv${mpl.videoFile}" type="video/mp4">
								</video>
								<!--按讚次數------------------------------------------------->
								<div id="great">
									<a href="#"> <i class="far fa-thumbs-up fa-2x"></i></a> <span><c:if test="${mpl.gcount==null}">0</c:if><c:if test="${mpl.gcount!=null}">${mpl.gcount}</c:if></span>
									<a href="#"> <i class="far fa-thumbs-down fa-2x"></i></a> <span><c:if test="${mpl.bcount==null}">0</c:if><c:if test="${mpl.bcount!=null}">${mpl.bcount}</c:if></span>
									<!-- 觀看次數 -------------------------------------------->
									<span style="float: right;">觀看次數: <c:if test="${mpl.vcount==null}">0</c:if><c:if test="${mpl.vcount!=null}">${mpl.vcount}</c:if>次</span>
								</div>
							</div>
<!-- 							<div class="col-1"></div> -->
							<div class="col-4">
								<div >
									<!--名稱 ----------------------------------------------->
									<H4>${mpl.portfolioName}</H4>
									<!--時間 ----------------------------------------------->
									<label>
										上傳時間:
									</label>
									<c:set var="fbCreateTime" value="${mpl.p_createTime}" />
									<fmt:formatDate type="both" dateStyle="long"
									timeStyle="medium" value="${fbCreateTime}" />
								</div>
								
								<div >
									<label>
										<i class="fas fa-map-marker-alt red mx-2"></i>位置&nbsp;:
									</label>
									${mpl.pAddress}
								</div>
								<div class="mt-3">
									<label>
										影片描述: 
									</label>
									<span>${mpl.portfolioText}</span>
								</div>
							</div>
							<br>

							<!--影片選項--------------------------------------------------------------------------------------------------------->
							<div class="col-2" style="margin-left: 80px; margin-top: 20px">
								<table>
									<tr>
										<td>
											<div>
												<form action="videoModify" method="post"
													enctype="multipart/form-data">
													<input type="hidden" name="portfolioId"
														value="${mpl.portfolioId}"> <input type="hidden"
														name="portfolioName" value="${mpl.portfolioName}">
													<input type="hidden" name="portfolioText"
														value="${mpl.portfolioText}"> <input type="hidden"
														name="pAddress" value="${mpl.pAddress}"> <input
														type="hidden" name="longitude" value="${mpl.longitude}">
													<input type="hidden" name="latitude"
														value="${mpl.latitude}"> <input type="hidden"
														name="cityId" value="${mpl.cityId}"> <input
														type="hidden" name="cityName" value="${mpl.cityName}">
													<input type="hidden" name="placeTypeId"
														value="${mpl.placeTypeId}"> <input type="hidden"
														name="placeType" value="${mpl.placeType}"> <input
														type="hidden" name="mId" value="${mpl.mId}"> <input
														type="hidden" name="strVideoFile" value="${mpl.videoFile}">
													<input type="hidden" name="strVideoPic"
														value="${mpl.videoPic}"> <input type="hidden"
														name="videoId" value="${mpl.videoId}"> <input
														type="hidden" name="v_freeze" value="${mpl.v_freeze}">
														<br>
													<button class="btn btn-primary" type="submit">編輯影片</button>
												</form>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div>
											<br>
												<button class="btn btn-primary" id="deleteP"
													data-bs-toggle="modal" type="button"
													data-bs-target="#deletePortfolio${mpl.portfolioId}">刪除影片</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div>
											<br>
											<form action="personalPortfolioMsg" method="post">
													<input type="hidden" name="portfolioId" value="${mpl.portfolioId}">
													<input type="hidden" name="portfolioName" value="${mpl.portfolioName}">
													<button class="btn btn-primary" id="manageFeedback"
													type="submit">管理留言</button>
											</form>
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
											<form action="deletePortfolio" method="post"
												enctype="multipart/form-data" name="fileForm">
												<input type="hidden" name="portfolioId"
													value="${mpl.portfolioId}"> <input type="hidden"
													name="portfolioName" value="${mpl.portfolioName}">
												<input type="hidden" name="portfolioText"
													value="${mpl.portfolioText}"> <input type="hidden"
													name="pAddress" value="${mpl.pAddress}"> <input
													type="hidden" name="longitude" value="${mpl.longitude}">
												<input type="hidden" name="latitude" value="${mpl.latitude}">
												<input type="hidden" name="cityId" value="${mpl.cityId}">
												<input type="hidden" name="cityName" value="${mpl.cityName}">
												<input type="hidden" name="placeTypeId"
													value="${mpl.placeTypeId}"> <input type="hidden"
													name="placeType" value="${mpl.placeType}"> <input
													type="hidden" name="mId" value="${mpl.mId}"> <input
													type="hidden" name="strVideoFile" value="${mpl.videoFile}">
												<input type="hidden" name="strVideoPic"
													value="${mpl.videoPic}"> <input type="hidden"
													name="videoId" value="${mpl.videoId}"> <input
													type="hidden" name="v_freeze" value="${mpl.v_freeze}">
												<button type="submit" class="btn btn-primary">確定刪除影片</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!--設定刪除按鈕動作 -->

							<!----------------------------------------------------------------------------------------------------------->
						</div>
					</div>
<!-- 				</div> -->
			</c:forEach>

		</div>
		<!--定位-------------------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!--------------------------------------------------------------------------------------------->

</body>
</html>